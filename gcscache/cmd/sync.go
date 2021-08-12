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
		pkgData, pkgBuf := parsePackageData(src.PackagesXZ, pkgs)
		writeDebs(ctx, bucket, pkgData, src.PoolParent)
		writePackagesXZ(ctx, bucket, pkgBuf, src)
	}
}

func parsePackageData(packagesXZ string, pkgs map[string]bool) ([]map[string]string, *bytes.Buffer) {
	log.Println("Fetching package index: ", packagesXZ)
	resp, err := http.Get(packagesXZ)
	if err != nil {
		log.Fatal("failed to fetch remote package list: ", packagesXZ, err)
	}
	rc := resp.Body
	defer rc.Close()

	xzr, err := xz.NewReader(rc)
	if err != nil {
		log.Fatal("failed to open xz reader for package list: ", packagesXZ, err)
	}

	var buf bytes.Buffer

	filtered, err := xz.NewWriter(&buf)
	if err != nil {
		log.Fatal("failed to open xz writer for package list: ", packagesXZ, err)
	}

	pkgData, err := dpkg.Parse(xzr, pkgs, filtered)
	if err != nil {
		log.Fatal("failed to parse package data: ", packagesXZ, err)
	}

	if err := filtered.Close(); err != nil {
		log.Fatal(err)
	}
	return pkgData, &buf
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
		} else {
			log.Printf("Wrote %q", destGCS)
		}
	}
}

func writePackagesXZ(ctx context.Context, bucket *storage.BucketHandle, pkgBuf *bytes.Buffer, src dpkg.PackageIndex) {
	// write Packages.xz
	shaB := sha256.Sum256(pkgBuf.Bytes())
	shaH := hex.EncodeToString(shaB[:])
	pkgRoot := fmt.Sprintf("indexes/%s-%s-%s", src.Release, src.Channel, src.Arch)
	pkgFile := fmt.Sprintf("%s/%s/Packages.xz", pkgRoot, shaH)

	if exists, err := gcs.Exists(ctx, bucket, pkgFile); err != nil {
		log.Fatal("failed to check if file exists on gcs ", pkgFile, err)
	} else if exists {
		log.Printf("Skipping %q", pkgFile)
		return
	}

	if err := gcs.Write(ctx, bucket, pkgBuf, pkgFile); err != nil {
		log.Fatal("failed to copy Packages.xz to gcs ", pkgFile, err)
	} else {
		log.Printf("Wrote %q", pkgFile)
	}

	// update latest
	latest := fmt.Sprintf("%s/latest", pkgRoot)
	latestTgt := strings.NewReader(pkgFile)
	if err := gcs.Write(ctx, bucket, latestTgt, latest); err != nil {
		log.Fatal("failed to write latest to gcs", latest, err)
	} else {
		log.Printf("Updated latest %q to %q", latest, pkgFile)
	}
}
