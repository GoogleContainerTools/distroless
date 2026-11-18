// Binary sign_and_push pushes OCI images, verifies or creates keyless Cosign
// SPDX attestations and signatures, and applies stamped image tags.
package main

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"os"
	"os/exec"
	"os/signal"
	"path/filepath"
	"strings"
	"sync"
	"sync/atomic"
	"syscall"
)

// Cosign v2 verification exit codes (github.com/sigstore/cosign/v2/cmd/cosign/errors).
const (
	cosignExitNoSignatures   = 10
	cosignExitNoMatchingSigs = 12
)

type target struct {
	Image      string   `json:"image"`
	SBOM       string   `json:"sbom"`
	Repository string   `json:"repository"`
	Tags       []string `json:"tags"`
}

type manifest struct {
	VersionFile string   `json:"version_file"`
	Crane       string   `json:"crane"`
	Cosign      string   `json:"cosign"`
	Targets     []target `json:"targets"`
}

type resolvedTarget struct {
	image string
	sbom  string
	ref   string
}

type tagOp struct {
	ref string
	tag string
}

func main() {
	ctx, stop := signal.NotifyContext(context.Background(), os.Interrupt, syscall.SIGTERM)
	err := run(ctx, os.Args[1:])
	stop()
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func run(ctx context.Context, args []string) error {
	fs := flag.NewFlagSet("sign_and_push", flag.ContinueOnError)
	var (
		manifestPath string
		keyless      string
		jobs         int
	)
	fs.StringVar(&manifestPath, "manifest", "", "path to sign_and_push manifest JSON")
	fs.StringVar(&keyless, "keyless", os.Getenv("KEYLESS"), "service account email for keyless signing")
	fs.IntVar(&jobs, "jobs", 16, "max concurrent push/verify and tag operations")
	if err := fs.Parse(args); err != nil {
		return err
	}
	if fs.NArg() > 0 {
		return fmt.Errorf("unknown arg %q", fs.Arg(0))
	}
	if keyless == "" {
		return errors.New("--keyless flag or KEYLESS environment variable must be provided")
	}
	if jobs < 1 {
		return fmt.Errorf("--jobs must be >= 1, got %d", jobs)
	}

	rawManifest, err := os.ReadFile(manifestPath)
	if err != nil {
		return err
	}
	var m manifest
	if err := json.Unmarshal(rawManifest, &m); err != nil {
		return fmt.Errorf("parse manifest: %w", err)
	}

	stamper, err := loadStamper(m.VersionFile)
	if err != nil {
		return err
	}

	targets := make([]resolvedTarget, len(m.Targets))
	var tagOps []tagOp
	for i, t := range m.Targets {
		digest, err := readDigest(t.Image)
		if err != nil {
			return err
		}
		repo := stamper.Replace(t.Repository)
		if strings.ContainsAny(repo, "{}") {
			return fmt.Errorf("unstamped placeholder in repository %q (did you pass --config=release?)", repo)
		}
		ref := repo + "@" + digest
		for _, rawTag := range t.Tags {
			tag := stamper.Replace(rawTag)
			if strings.ContainsAny(tag, "{}") {
				return fmt.Errorf("unstamped placeholder in tag %q (did you pass --config=release?)", tag)
			}
			tagOps = append(tagOps, tagOp{ref: ref, tag: tag})
		}
		targets[i] = resolvedTarget{image: t.Image, sbom: t.SBOM, ref: ref}
	}

	workDir, err := os.MkdirTemp("", "sign-and-push-*")
	if err != nil {
		return err
	}
	defer func() { _ = os.RemoveAll(workDir) }()

	seedTUF := filepath.Join(workDir, "tuf")
	cosignEnv := []string{
		"GOOGLE_SERVICE_ACCOUNT_NAME=" + keyless,
		"TUF_ROOT=" + seedTUF,
	}
	if err := runStreamCmd(ctx, cosignEnv, m.Cosign, "initialize"); err != nil {
		return fmt.Errorf("cosign initialize: %w", err)
	}
	trustedRoot := filepath.Join(seedTUF, "tuf-repo-cdn.sigstore.dev", "targets", "trusted_root.json")

	needsSign := make([]bool, len(targets))
	var signCount atomic.Int32
	fmt.Printf("## Pushing and verifying %d images...\n", len(targets))
	if err := runParallel(ctx, jobs, len(targets), func(ctx context.Context, idx int) error {
		rt := targets[idx]
		fmt.Printf("Pushing %s\n", rt.ref)
		if out, err := runCmd(ctx, nil, m.Crane, "push", rt.image, rt.ref); err != nil {
			return cmdErr("crane push "+rt.ref, err, out)
		}
		// Pass --trusted-root directly so concurrent verifies never mutate TUF_ROOT.
		out, err := runCmd(ctx, nil, m.Cosign,
			"verify", "--offline", "--trusted-root", trustedRoot, rt.ref,
			"--certificate-oidc-issuer", "https://accounts.google.com",
			"--certificate-identity", keyless,
		)
		if err != nil {
			var exitErr *exec.ExitError
			if !errors.As(err, &exitErr) || (exitErr.ExitCode() != cosignExitNoSignatures && exitErr.ExitCode() != cosignExitNoMatchingSigs) {
				return cmdErr("cosign verify "+rt.ref, err, out)
			}
			needsSign[idx] = true
			signCount.Add(1)
		}
		return nil
	}); err != nil {
		return err
	}

	// Run attest and sign sequentially to avoid Fulcio/Rekor rate limits and
	// concurrent mutations on shared TUF_ROOT or OCI signature tags.
	fmt.Printf("## Attesting and signing %d images...\n", signCount.Load())
	for idx, rt := range targets {
		if !needsSign[idx] {
			continue
		}
		if err := runStreamCmd(ctx, cosignEnv, m.Cosign, "attest", rt.ref, "--predicate", rt.sbom, "--type", "spdx", "--yes"); err != nil {
			return fmt.Errorf("cosign attest %s: %w", rt.ref, err)
		}
		if err := runStreamCmd(ctx, cosignEnv, m.Cosign, "sign", rt.ref, "--yes"); err != nil {
			return fmt.Errorf("cosign sign %s: %w", rt.ref, err)
		}
	}

	fmt.Printf("## Tagging %d image tags...\n", len(tagOps))
	if err := runParallel(ctx, jobs, len(tagOps), func(ctx context.Context, idx int) error {
		op := tagOps[idx]
		if out, err := runCmd(ctx, nil, m.Crane, "tag", op.ref, op.tag); err != nil {
			return cmdErr(fmt.Sprintf("crane tag %s %s", op.ref, op.tag), err, out)
		}
		fmt.Printf("Tagged %s as %s\n", op.ref, op.tag)
		return nil
	}); err != nil {
		return err
	}

	fmt.Print("\n👌 Finished pushing & signing\n\n")
	return nil
}

func loadStamper(path string) (*strings.Replacer, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	var pairs []string
	for line := range strings.SplitSeq(string(data), "\n") {
		line = strings.TrimSuffix(line, "\r")
		if key, val, ok := strings.Cut(line, " "); ok && key != "" {
			pairs = append(pairs, "{"+key+"}", val)
		}
	}
	return strings.NewReplacer(pairs...), nil
}

func readDigest(imageDir string) (string, error) {
	data, err := os.ReadFile(filepath.Join(imageDir, "index.json"))
	if err != nil {
		return "", err
	}
	var idx struct {
		Manifests []struct {
			Digest string `json:"digest"`
		} `json:"manifests"`
	}
	if err := json.Unmarshal(data, &idx); err != nil {
		return "", fmt.Errorf("parse %s/index.json: %w", imageDir, err)
	}
	if len(idx.Manifests) == 0 || idx.Manifests[0].Digest == "" {
		return "", fmt.Errorf("missing manifest digest in %s/index.json", imageDir)
	}
	return idx.Manifests[0].Digest, nil
}

func runParallel(ctx context.Context, jobs, n int, fn func(ctx context.Context, idx int) error) error {
	ctx, cancel := context.WithCancelCause(ctx)
	defer cancel(nil)

	var (
		next atomic.Int64
		wg   sync.WaitGroup
	)
	for range min(jobs, n) {
		wg.Go(func() {
			for ctx.Err() == nil {
				idx := int(next.Add(1) - 1)
				if idx >= n {
					return
				}
				if err := fn(ctx, idx); err != nil {
					cancel(err)
					return
				}
			}
		})
	}
	wg.Wait()
	return context.Cause(ctx)
}

func runCmd(ctx context.Context, extraEnv []string, name string, args ...string) ([]byte, error) {
	cmd := exec.CommandContext(ctx, name, args...)
	if len(extraEnv) > 0 {
		cmd.Env = append(os.Environ(), extraEnv...)
	}
	return cmd.CombinedOutput()
}

func runStreamCmd(ctx context.Context, extraEnv []string, name string, args ...string) error {
	cmd := exec.CommandContext(ctx, name, args...)
	if len(extraEnv) > 0 {
		cmd.Env = append(os.Environ(), extraEnv...)
	}
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

func cmdErr(desc string, err error, out []byte) error {
	if out = bytes.TrimSpace(out); len(out) > 0 {
		return fmt.Errorf("%s: %w\n%s", desc, err, out)
	}
	return fmt.Errorf("%s: %w", desc, err)
}
