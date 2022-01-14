//
// Copyright 2022 Google LLC
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

package deb

import (
	"net/url"
	"os"
	"testing"

	"github.com/google/go-cmp/cmp"
)

func TestParse(t *testing.T) {
	packages, err := os.Open("testdata/Packages.txt")
	if err != nil {
		t.Fatal(err)
	}
	data, err := parse(packages, nil)
	if err != nil {
		t.Fatal(err)
	}

	// package existence
	{
		want := []string{"libnewlib-dev", "libnewlib-doc", "newlib-source", "newmail", "zzuf"}
		got := []string{}

		for _, ppkg := range data {
			got = append(got, ppkg[packageKey])
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
	packages, err := os.Open("testdata/Packages.txt")
	if err != nil {
		t.Fatal(err)
	}
	data, err := parse(packages, map[string]bool{"zzuf": true})
	if err != nil {
		t.Fatal(err)
	}
	if len(data) != 1 || data[0]["Package"] != "zzuf" {
		t.Fatalf("Failed to parse zzuf out of packages")
	}
}

func TestParse_toPackageInfo(t *testing.T) {
	prefixes := []string{
		"https://somewhere/",
		"https://somewhere",
	}
	want := map[string]*Package{
		"zzuf": {
			Name: "zzuf",
			URL:  "https://somewhere/pool/main/z/zzuf/zzuf_0.13.svn20100215-4.1_amd64.deb",
			Version: Version{
				UpstreamVersion: "0.13.svn20100215",
				DebianRevision:  "4.1",
				Original:        "0.13.svn20100215-4.1",
			},
			SHA256: "6b063ba41ed2efc58931ebbd6ff668c522cb22c734597fa2409885eb9bd4fcd2",
		},
	}
	for _, pfx := range prefixes {
		t.Run(pfx, func(t *testing.T) {
			packages, err := os.Open("testdata/Packages.txt")
			if err != nil {
				t.Fatal(err)
			}
			ppfx, err := url.Parse(pfx)
			if err != nil {
				t.Fatal(err)
			}
			got, err := Parse(packages, map[string]bool{"zzuf": true}, ppfx)
			if err != nil {
				t.Fatal(err)
			}
			if !cmp.Equal(got, want, cmp.AllowUnexported(Version{})) {
				t.Fatal(cmp.Diff(got, want, cmp.AllowUnexported(Version{})))
			}
		})
	}
}
