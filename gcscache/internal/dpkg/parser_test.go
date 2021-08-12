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

package dpkg

import (
	"bytes"
	"os"
	"testing"

	"github.com/google/go-cmp/cmp"
)

func TestParse(t *testing.T) {
	packages, err := os.Open("testdata/Packages.txt")
	if err != nil {
		t.Fatal(err)
	}
	data, err := Parse(packages, nil, nil)
	if err != nil {
		t.Fatal(err)
	}

	// package existence
	{
		want := []string{"libnewlib-dev", "libnewlib-doc", "newlib-source", "newmail", "zzuf"}
		got := []string{}

		for _, ppkg := range data {
			got = append(got, ppkg["Package"])
		}
		if diff := cmp.Diff(want, got); diff != "" {
			t.Errorf("Packages parsing mismatch (-want +got):\n%s", diff)
		}
	}

	// multiline parsing
	{
		want := "interface::commandline, mail::notification, role::program,scope::utility, works-with::mail"
		got := ""
		for _, ppkg := range data {
			if ppkg["Package"] == "newmail" {
				got = ppkg["Tag"]
			}
		}
		if got == "" {
			t.Fatalf("Failed to find newmail.Tag package")
		}
		if got != want {
			t.Fatalf("Failed\n got: %s\nwant: %s", got, want)
		}
	}
}

func TestParse_filtered(t *testing.T) {
	want := `Package: zzuf
Version: 0.13.svn20100215-4.1
Installed-Size: 209
Maintainer: Sam Hocevar <sho@debian.org>
Architecture: amd64
Depends: libc6 (>= 2.14)
Description: transparent application fuzzer
Description-md5: 27dbe1f74dc9503e917a86ba5a96a833
Tag: implemented-in::c, role::program
Section: devel
Priority: optional
Filename: pool/main/z/zzuf/zzuf_0.13.svn20100215-4.1_amd64.deb
Size: 86174
MD5sum: 0cf99b320ef14cdaead8dc98184242b6
SHA1: 47b4e9b5def65974fb0e76355687977923946137
SHA256: 6b063ba41ed2efc58931ebbd6ff668c522cb22c734597fa2409885eb9bd4fcd2
`
	packages, err := os.Open("testdata/Packages.txt")
	if err != nil {
		t.Fatal(err)
	}
	var out bytes.Buffer
	data, err := Parse(packages, map[string]bool{"zzuf": true}, &out)
	if err != nil {
		t.Fatal(err)
	}
	if len(data) != 1 || data[0]["Package"] != "zzuf" {
		t.Fatalf("Failed to parse zzuf out of packages")
	}

	got := out.String()
	if diff := cmp.Diff(want, got); diff != "" {
		t.Errorf("Packages parsing mismatch (-want +got):\n%s", diff)
	}
}
