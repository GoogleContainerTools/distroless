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
	"net/http"
	"testing"
)

func TestStructCreation(t *testing.T) {
	type TestCase struct {
		expected  PackageIndex
		generated PackageIndex
	}

	testCases := []TestCase{{
		expected: PackageIndex{
			Channel:    "updates",
			Release:    "testRel",
			Arch:       "testArch",
			InRelease:  "https://deb.debian.org/debian/dists/testRel-updates/InRelease",
			PackagesXZ: "https://deb.debian.org/debian/dists/testRel-updates/main/binary-testArch/Packages.xz",
			PoolParent: "https://deb.debian.org/debian/",
		},
		generated: updates("testRel", "testArch"),
	}, {
		expected: PackageIndex{
			Channel:    "security",
			Release:    "testRel",
			Arch:       "testArch",
			InRelease:  "https://security.debian.org/dists/testRel/updates/InRelease",
			PackagesXZ: "https://security.debian.org/dists/testRel/updates/main/binary-testArch/Packages.xz",
			PoolParent: "https://security.debian.org/debian-security/",
		},
		generated: security("testRel", "testArch"),
	}, {
		expected: PackageIndex{
			Channel:    "main",
			Release:    "testRel",
			Arch:       "testArch",
			InRelease:  "https://deb.debian.org/debian/dists/testRel/InRelease",
			PackagesXZ: "https://deb.debian.org/debian/dists/testRel/main/binary-testArch/Packages.xz",
			PoolParent: "https://deb.debian.org/debian/",
		},
		generated: main("testRel", "testArch"),
	}}

	for _, tc := range testCases {
		t.Run(tc.expected.Channel, func(t *testing.T) {
			if tc.expected != tc.generated {
				t.Fatalf("\n got: %v\nwant: %v", tc.generated, tc.expected)
			}
		})
	}
}

func TestRemotePackageInfoExists(t *testing.T) {
	ps := PackageIndexes()

	for _, pi := range ps {
		t.Run(pi.PackagesXZ, func(t *testing.T) {
			resp, err := http.Head(pi.PackagesXZ)
			if err != nil {
				t.Fatalf("Could not verify existence of remote packages index: %q", pi.PackagesXZ)
			}
			if resp.StatusCode != http.StatusOK {
				t.Fatalf("Could not verify existence of remote packages index: %q", pi.PackagesXZ)
			}
		})

		t.Run(pi.InRelease, func(t *testing.T) {
			resp, err := http.Head(pi.InRelease)
			if err != nil {
				t.Fatalf("Could not verify existence of remote InRelease: %q", pi.InRelease)
			}
			if resp.StatusCode != http.StatusOK {
				t.Fatalf("Could not verify existence of remote InRelease: %q", pi.InRelease)
			}
		})
	}
}
