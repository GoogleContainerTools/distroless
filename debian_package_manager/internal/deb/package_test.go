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

import "testing"

func TestPackage_Equivalent(t *testing.T) {
	base := &Package{
		Name:    "goose",
		SHA256:  "12345",
		Version: MustParseVersion("1"),
		URL:     "https://somewhere.com/package.deb",
	}
	testCases := []struct {
		pkg    *Package
		equals bool
	}{
		{pkg: base, equals: true},
		{pkg: &Package{"goose", "12345", MustParseVersion("1"), "https://somewhereelse.com/package.deb"}, equals: true},
		{pkg: &Package{"moose", "12345", MustParseVersion("1"), "https://somewhere.com/package.deb"}, equals: false},
		{pkg: &Package{"goose", "123456", MustParseVersion("1"), "https://somewhere.com/package.deb"}, equals: false},
		{pkg: &Package{"goose", "123456", MustParseVersion("2"), "https://somewhere.com/package.deb"}, equals: false},
	}
	for _, tc := range testCases {
		if base.Equivalent(tc.pkg) != tc.equals {
			t.Fatalf("\n%q\n%q\nwere have unexpected equivalent measure of %v", base, tc.pkg, tc.equals)
		}
	}
}
