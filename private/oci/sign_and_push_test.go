package main

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"sync/atomic"
	"testing"
)

func TestRunPhasesAndSkipSigned(t *testing.T) {
	dir := t.TempDir()
	logFile := filepath.Join(dir, "events.log")
	signLock := filepath.Join(dir, "sign.lock")

	versionFile := filepath.Join(dir, "volatile-status.txt")
	writeFile(t, versionFile, "REGISTRY reg.local\nPROJECT_ID distroless\nCOMMIT_SHA deadbeef\nFORMATTED_DATE 2026 Nov 02\n")

	var targets []target
	for i := range 3 {
		imgDir := filepath.Join(dir, fmt.Sprintf("img-%d", i))
		if err := os.MkdirAll(imgDir, 0o755); err != nil {
			t.Fatal(err)
		}
		digest := fmt.Sprintf("sha256:%064d", i+1)
		writeFile(t, filepath.Join(imgDir, "index.json"), fmt.Sprintf(`{"manifests":[{"digest":%q}]}`, digest))
		sbom := filepath.Join(dir, fmt.Sprintf("sbom-%d.spdx.json", i))
		writeFile(t, sbom, "{}")
		targets = append(targets, target{
			Image:      imgDir,
			SBOM:       sbom,
			Repository: fmt.Sprintf("{REGISTRY}/{PROJECT_ID}/app-%d", i),
			Tags:       []string{"latest", "{COMMIT_SHA}"},
		})
	}

	crane := writeScript(t, filepath.Join(dir, "crane"), fmt.Sprintf(`#!/usr/bin/env bash
set -euo pipefail
sub="$1"; shift
printf 'crane:%%s:%%s\n' "$sub" "$*" >> %q
`, logFile))

	// img-0 exits 10 (no signatures), img-1 exits 0 (already signed), img-2 exits 12 (no matching sigs).
	cosign := writeScript(t, filepath.Join(dir, "cosign"), fmt.Sprintf(`#!/usr/bin/env bash
set -euo pipefail
sub="$1"; shift
case "$sub" in
  initialize)
    tr="$TUF_ROOT/tuf-repo-cdn.sigstore.dev/targets"
    mkdir -p "$tr"
    echo '{"mediaType":"application/vnd.dev.sigstore.trustedroot+json;version=0.1"}' > "$tr/trusted_root.json"
    chmod 0444 "$tr/trusted_root.json"
    printf 'cosign:initialize:%%s\n' "$TUF_ROOT" >> %q
    ;;
  verify)
    [[ "$1" == "--offline" && "$2" == "--trusted-root" && -r "$3" ]] || { echo "bad verify args: $*" >&2; exit 2; }
    ref="$4"
    printf 'cosign:verify:%%s\n' "$ref" >> %q
    case "$ref" in
      *0001) exit 10 ;;
      *0002) exit 0 ;;
      *0003) exit 12 ;;
    esac
    exit 1
    ;;
  attest|sign)
    [[ "${GOOGLE_SERVICE_ACCOUNT_NAME:-}" == "signer@example.iam.gserviceaccount.com" ]] || exit 3
    [[ "${TUF_ROOT:-}" != "/bogus-parent-tuf" && -n "${TUF_ROOT:-}" ]] || exit 4
    mkdir %q # fails if two sign/attest commands ever overlap
    sleep 0.02
    rmdir %q
    printf 'cosign:%%s:%%s\n' "$sub" "$1" >> %q
    ;;
esac
`, logFile, logFile, signLock, signLock, logFile))

	manifestPath := writeManifest(t, dir, manifest{
		VersionFile: versionFile,
		Crane:       crane,
		Cosign:      cosign,
		Targets:     targets,
	})

	t.Setenv("TUF_ROOT", "/bogus-parent-tuf")
	err := run(t.Context(), []string{
		"--manifest", manifestPath,
		"--keyless", "signer@example.iam.gserviceaccount.com",
		"--jobs", "2",
	})
	if err != nil {
		t.Fatalf("run() error = %v, want nil", err)
	}

	events := readLines(t, logFile)
	if len(events) == 0 || !strings.HasPrefix(events[0], "cosign:initialize:") {
		t.Fatalf("events = %v, want first event with prefix %q", events, "cosign:initialize:")
	}
	if strings.TrimPrefix(events[0], "cosign:initialize:") == "/bogus-parent-tuf" {
		t.Fatalf("first event = %q, parent TUF_ROOT leaked into cosign initialize", events[0])
	}

	type counts struct {
		pushes, verifies, attests, signs, tags int
	}
	var got counts
	phase := 1
	for _, ev := range events[1:] {
		switch {
		case strings.HasPrefix(ev, "crane:push:"):
			if phase != 1 {
				t.Fatalf("push in phase %d, want phase 1: %q", phase, ev)
			}
			got.pushes++
		case strings.HasPrefix(ev, "cosign:verify:"):
			if phase != 1 {
				t.Fatalf("verify in phase %d, want phase 1: %q", phase, ev)
			}
			got.verifies++
		case strings.HasPrefix(ev, "cosign:attest:"):
			if phase > 2 {
				t.Fatalf("attest in phase %d, want <= 2: %q", phase, ev)
			}
			phase = 2
			if strings.HasSuffix(ev, "0002") {
				t.Fatalf("already-signed image attested: %q", ev)
			}
			got.attests++
		case strings.HasPrefix(ev, "cosign:sign:"):
			if phase > 2 {
				t.Fatalf("sign in phase %d, want <= 2: %q", phase, ev)
			}
			phase = 2
			if strings.HasSuffix(ev, "0002") {
				t.Fatalf("already-signed image signed: %q", ev)
			}
			got.signs++
		case strings.HasPrefix(ev, "crane:tag:"):
			phase = 3
			got.tags++
		default:
			t.Fatalf("unexpected event %q", ev)
		}
	}

	want := counts{pushes: 3, verifies: 3, attests: 2, signs: 2, tags: 6}
	if got != want {
		t.Fatalf("counts = %+v, want %+v\nevents = %v", got, want, events)
	}
}

func TestRunErrors(t *testing.T) {
	setupFixture := func(t *testing.T, craneBody, cosignBody, repo string) string {
		t.Helper()
		dir := t.TempDir()
		versionFile := filepath.Join(dir, "volatile-status.txt")
		writeFile(t, versionFile, "REGISTRY reg.local\n")

		imgDir := filepath.Join(dir, "img")
		if err := os.MkdirAll(imgDir, 0o755); err != nil {
			t.Fatal(err)
		}
		writeFile(t, filepath.Join(imgDir, "index.json"), fmt.Sprintf(`{"manifests":[{"digest":%q}]}`, "sha256:"+strings.Repeat("a", 64)))
		sbom := filepath.Join(dir, "sbom.spdx.json")
		writeFile(t, sbom, "{}")

		crane := writeScript(t, filepath.Join(dir, "crane"), craneBody)
		cosign := writeScript(t, filepath.Join(dir, "cosign"), cosignBody)
		return writeManifest(t, dir, manifest{
			VersionFile: versionFile,
			Crane:       crane,
			Cosign:      cosign,
			Targets: []target{{
				Image:      imgDir,
				SBOM:       sbom,
				Repository: repo,
				Tags:       []string{"latest"},
			}},
		})
	}

	initCosign := `#!/usr/bin/env bash
set -euo pipefail
if [[ "$1" == "initialize" ]]; then
  mkdir -p "$TUF_ROOT/tuf-repo-cdn.sigstore.dev/targets"
  echo '{}' > "$TUF_ROOT/tuf-repo-cdn.sigstore.dev/targets/trusted_root.json"
  exit 0
fi
`

	t.Run("push failure aborts before sign or tag", func(t *testing.T) {
		dir := t.TempDir()
		logFile := filepath.Join(dir, "events.log")
		manifestPath := setupFixture(t,
			fmt.Sprintf("#!/usr/bin/env bash\nprintf 'crane:%%s\\n' \"$1\" >> %q\necho boom >&2\nexit 1\n", logFile),
			initCosign+fmt.Sprintf("printf 'cosign:%%s\\n' \"$1\" >> %q\nexit 0\n", logFile),
			"{REGISTRY}/app",
		)
		err := run(t.Context(), []string{"--manifest", manifestPath, "--keyless", "sa@example.com"})
		if err == nil || !strings.Contains(err.Error(), "boom") {
			t.Fatalf("run() error = %v, want error containing %q", err, "boom")
		}
		for _, ev := range readLines(t, logFile) {
			if ev == "cosign:attest" || ev == "cosign:sign" || ev == "crane:tag" {
				t.Fatalf("unexpected post-failure call %q", ev)
			}
		}
	})

	t.Run("verify registry error fails instead of signing", func(t *testing.T) {
		dir := t.TempDir()
		logFile := filepath.Join(dir, "events.log")
		manifestPath := setupFixture(t,
			"#!/usr/bin/env bash\nexit 0\n",
			initCosign+fmt.Sprintf("printf 'cosign:%%s\\n' \"$1\" >> %q\necho '503 service unavailable' >&2\nexit 1\n", logFile),
			"{REGISTRY}/app",
		)
		err := run(t.Context(), []string{"--manifest", manifestPath, "--keyless", "sa@example.com"})
		if err == nil || !strings.Contains(err.Error(), "503 service unavailable") {
			t.Fatalf("run() error = %v, want error containing %q", err, "503 service unavailable")
		}
		for _, ev := range readLines(t, logFile) {
			if ev == "cosign:attest" || ev == "cosign:sign" {
				t.Fatalf("verify error triggered signing: %q", ev)
			}
		}
	})

	t.Run("unstamped placeholder fails fast", func(t *testing.T) {
		manifestPath := setupFixture(t,
			"#!/usr/bin/env bash\nexit 1\n",
			"#!/usr/bin/env bash\nexit 1\n",
			"{REGISTRY}/{PROJECT_ID}/app",
		)
		err := run(t.Context(), []string{"--manifest", manifestPath, "--keyless", "sa@example.com"})
		if err == nil || !strings.Contains(err.Error(), "unstamped placeholder") {
			t.Fatalf("run() error = %v, want error containing %q", err, "unstamped placeholder")
		}
	})

	t.Run("cli validation", func(t *testing.T) {
		t.Setenv("KEYLESS", "")
		for _, tc := range []struct {
			args    []string
			wantSub string
		}{
			{args: []string{"--manifest", "m.json"}, wantSub: "--keyless"},
			{args: []string{"--manifest", "m.json", "--keyless", "sa@example.com", "--jobs", "0"}, wantSub: "--jobs"},
			{args: []string{"--manifest", "m.json", "--keyless", "sa@example.com", "extra"}, wantSub: `unknown arg "extra"`},
		} {
			err := run(t.Context(), tc.args)
			if err == nil || !strings.Contains(err.Error(), tc.wantSub) {
				t.Fatalf("run(%q) error = %v, want substring %q", tc.args, err, tc.wantSub)
			}
		}
	})
}

func TestRunParallel(t *testing.T) {
	t.Run("precanceled context dispatches nothing", func(t *testing.T) {
		ctx, cancel := context.WithCancel(t.Context())
		cancel()
		var calls atomic.Int32
		err := runParallel(ctx, 4, 10, func(context.Context, int) error {
			calls.Add(1)
			return nil
		})
		if !errors.Is(err, context.Canceled) {
			t.Fatalf("runParallel() error = %v, want %v", err, context.Canceled)
		}
		if got := calls.Load(); got != 0 {
			t.Fatalf("calls = %d, want 0", got)
		}
	})

	t.Run("mid-flight parent cancel stops remaining items", func(t *testing.T) {
		ctx, cancel := context.WithCancel(t.Context())
		var calls atomic.Int32
		err := runParallel(ctx, 1, 10, func(context.Context, int) error {
			if calls.Add(1) == 2 {
				cancel()
			}
			return nil
		})
		if !errors.Is(err, context.Canceled) {
			t.Fatalf("runParallel() error = %v, want %v", err, context.Canceled)
		}
		if got := calls.Load(); got != 2 {
			t.Fatalf("calls = %d, want 2", got)
		}
	})

	t.Run("first worker error wins over sibling errors", func(t *testing.T) {
		errFirst := errors.New("first failure")
		ready := make(chan struct{})
		err := runParallel(t.Context(), 2, 4, func(ctx context.Context, idx int) error {
			if idx == 0 {
				close(ready)
				return errFirst
			}
			<-ready
			<-ctx.Done()
			return errors.New("sibling killed")
		})
		if !errors.Is(err, errFirst) {
			t.Fatalf("runParallel() error = %v, want %v", err, errFirst)
		}
	})
}

func writeManifest(t *testing.T, dir string, m manifest) string {
	t.Helper()
	raw, err := json.Marshal(m)
	if err != nil {
		t.Fatal(err)
	}
	path := filepath.Join(dir, "manifest.json")
	writeFile(t, path, string(raw))
	return path
}

func writeFile(t *testing.T, path, content string) {
	t.Helper()
	if err := os.WriteFile(path, []byte(content), 0o644); err != nil {
		t.Fatal(err)
	}
}

func writeScript(t *testing.T, path, content string) string {
	t.Helper()
	if err := os.WriteFile(path, []byte(content), 0o755); err != nil {
		t.Fatal(err)
	}
	return path
}

func readLines(t *testing.T, path string) []string {
	t.Helper()
	b, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	s := strings.TrimSpace(string(b))
	if s == "" {
		return nil
	}
	return strings.Split(s, "\n")
}
