//
// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"bytes"
	"context"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"io"
	"log"
	"net/http"
	"strings"

	"cloud.google.com/go/storage"
	"github.com/GoogleContainerTools/distroless/gcscache/internal/dpkg"
	"github.com/GoogleContainerTools/distroless/gcscache/internal/gcs"

	"github.com/ulikunitz/xz"
)

func main() {
	ctx := context.Background()

	client, err := storage.NewClient(ctx)
	if err != nil {
		log.Fatal(err)
	}
	defer client.Close()

	bucket := client.Bucket("distroless-debian-cache")

	srcs := dpkg.PackageIndexes()
	pkgs := dpkg.PackageNames()
	for _, src := range srcs {
		packagesXZ, pkgsHash := fetchRemote(src.PackagesXZ)
		inRelease, _ := fetchRemote(src.InRelease)

		if !strings.Contains(string(inRelease), pkgsHash) {
			log.Fatalf("InRelease:%q did not contain valid sha256:%q for PackagesXZ:%q", src.InRelease, pkgsHash, src.PackagesXZ)
		}

		pkgSet, ok := pkgs[src.Release]
		if !ok {
			log.Fatalf("No list of packages found for %q", src.Release)
		}
		pkgData, pkgBuf := parsePackageData(packagesXZ, src.PackagesXZ, pkgSet)
		writeDebs(ctx, bucket, pkgData, src.PoolParent)
		writePackagesFiles(ctx, bucket, pkgBuf, packagesXZ, inRelease, src)
	}
}

// return content (in memory) and hex sha256
func fetchRemote(remote string) ([]byte, string) {
	log.Println("Fetching: ", remote)
	resp, err := http.Get(remote)
	if err != nil || resp.StatusCode != http.StatusOK {
		log.Fatal("failed to fetch remote file: ", remote, err)
	}
	rc := resp.Body
	defer rc.Close()
	sha := sha256.New()
	var buf bytes.Buffer
	tr := io.TeeReader(rc, sha)

	if _, err = io.Copy(&buf, tr); err != nil {
		log.Fatal("failed to write file to memory: ", remote, err)
	}

	hash := hex.EncodeToString(sha.Sum(nil))

	return buf.Bytes(), hash
}

func parsePackageData(pkgBytes []byte, url string, pkgs map[string]bool) ([]map[string]string, []byte) {
	xzr, err := xz.NewReader(bytes.NewReader(pkgBytes))
	if err != nil {
		log.Fatal("failed to open xz reader for package list: ", url, err)
	}

	var buf bytes.Buffer

	filtered, err := xz.NewWriter(&buf)
	if err != nil {
		log.Fatal("failed to open xz writer for package list: ", url, err)
	}

	pkgData, err := dpkg.Parse(xzr, pkgs, filtered)
	if err != nil {
		log.Fatal("failed to parse package data: ", url, err)
	}

	if err := filtered.Close(); err != nil {
		log.Fatal(err)
	}
	return pkgData, buf.Bytes()
}

func writeDebs(ctx context.Context, bucket *storage.BucketHandle, pkgData []map[string]string, srcPoolParent string) {
	for _, pkg := range pkgData {
		subpath := pkg["Filename"]
		srcUrl := srcPoolParent + subpath
		destGCS := "files/" + subpath

		if exists, err := gcs.Exists(ctx, bucket, destGCS); err != nil {
			log.Fatal("failed to check if file exists on gcs ", destGCS, err)
		} else if exists {
			log.Printf("Skipping %q", destGCS)
			continue
		}

		if err := gcs.SaveURL(ctx, bucket, srcUrl, destGCS); err != nil {
			log.Fatal("failed to copy package to gcs ", destGCS, err)
		}
		log.Printf("Wrote %q", destGCS)
	}
}

// write packages archive to gcs and update latest
// involves writing 3 files
// 1. Packages.xz: a filtered view of packages that are cached
// 2. Packages.xz.orig: the original complete packages file from debian (MUST be a superset of Packages.xz)
// 3. InRelease: signed release info for Packages.xz.orig (MUST be updated if Packages.xz.orig is updated)
func writePackagesFiles(ctx context.Context, bucket *storage.BucketHandle, pkgBuf []byte, origPkgBuf []byte, inReleaseBuf []byte, src dpkg.PackageIndex) {
	// write Packages.xz
	shaB := sha256.Sum256(pkgBuf)
	shaH := hex.EncodeToString(shaB[:])
	pkgRoot := fmt.Sprintf("indexes/%s-%s-%s", src.Release, src.Channel, src.Arch)
	pkgFile := fmt.Sprintf("%s/%s/Packages.xz", pkgRoot, shaH)
	origPkgFile := fmt.Sprintf("%s.orig", pkgFile)
	inReleaseFile := fmt.Sprintf("%s/%s/InRelease.orig", pkgRoot, shaH)

	packagesWritten := writePackagesXZ(ctx, bucket, bytes.NewReader(pkgBuf), pkgFile)
	originInfoWritten := writeOriginInfo(ctx, bucket, origPkgBuf, origPkgFile, inReleaseBuf, inReleaseFile)

	// update latest file
	latest := fmt.Sprintf("%s/latest", pkgRoot)
	latestSha := strings.NewReader(shaH)
	latestExists, err := gcs.Exists(ctx, bucket, latest)
	if err != nil {
		log.Fatal("failed to check if latest exist on gcs ", latest, err)
	}
	if !latestExists || packagesWritten || originInfoWritten {
		if err := gcs.Write(ctx, bucket, latestSha, latest); err != nil {
			log.Fatal("failed to write latest to gcs", latest, err)
		}
		log.Printf("Updated latest %q to %q", latest, shaH)
	}
}

// returns true if a file was written, false if already exists
func writePackagesXZ(ctx context.Context, bucket *storage.BucketHandle, contents io.Reader, dest string) bool {
	if exists, err := gcs.Exists(ctx, bucket, dest); err != nil {
		log.Fatal("failed to check if Packages.xz exists on gcs ", dest, err)
	} else if exists {
		log.Printf("Skipping %q", dest)
		return false
	}

	if err := gcs.Write(ctx, bucket, contents, dest); err != nil {
		log.Fatal("failed to copy Packages.xz to gcs ", dest, err)
	}
	log.Printf("Wrote %q", dest)
	return true
}

// Packages.xz.orig and InRelease are a pair and should be written together even if one already exists.
// returns true if files were written, false if BOTH already exists
func writeOriginInfo(ctx context.Context, bucket *storage.BucketHandle, origPkgBuf []byte, origPkgDest string, inReleaseBuf []byte, inReleaseDest string) bool {
	if exist, err := gcs.Exists(ctx, bucket, origPkgDest, inReleaseDest); err != nil {
		log.Fatal("failed to check if Packages.xz.orig and InRelease.orig exist on gcs ", origPkgDest, inReleaseDest, err)
	} else if exist {
		log.Printf("Skipping %q", origPkgDest)
		log.Printf("Skipping %q", inReleaseDest)
		return false
	}

	if err := gcs.Write(ctx, bucket, bytes.NewReader(origPkgBuf), origPkgDest); err != nil {
		log.Fatal("failed to copy Packages.xz.orig to gcs ", origPkgDest, err)
	}
	log.Printf("Wrote %q", origPkgDest)

	if err := gcs.Write(ctx, bucket, bytes.NewReader(inReleaseBuf), inReleaseDest); err != nil {
		log.Fatal("failed to copy Packages.xz.orig to gcs ", inReleaseDest, err)
	}
	log.Printf("Wrote %q", inReleaseDest)

	return true
}
