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
	"fmt"
	"regexp"
	"strings"

	"github.com/pkg/errors"
)

type Package struct {
	Name    string
	SHA256  string
	Version Version
	URL     string
}

func NewPackage(name string, sha256hex string, version string, url string) (*Package, error) {
	if strings.TrimSpace(name) == "" {
		return nil, errors.New("package name was empty")
	}
	if strings.TrimSpace(sha256hex) == "" {
		return nil, errors.New("package sha256 was empty")
	}
	sharegex := regexp.MustCompile("^([a-f0-9]{64})$")
	if !sharegex.MatchString(sha256hex) {
		return nil, fmt.Errorf("package sha256 was invalid: %q", sha256hex)
	}
	if strings.TrimSpace(version) == "" {
		return nil, errors.New("package version was empty")
	}

	v, err := parseVersion(version)
	if err != nil {
		return nil, errors.Wrapf(err, "package version parsing error for %q", name)
	}

	return &Package{name, sha256hex, v, url}, nil
}

// Equivalent checks if these packages are the same file (even if they have different urls)
func (p1 *Package) Equivalent(p2 *Package) bool {
	return p1.Name == p2.Name &&
		p1.SHA256 == p2.SHA256 &&
		p1.Version.Original == p2.Version.Original
}

type ResolvedPackage struct {
	Src  *Package
	File string
}

func NewResolvedPackage(src *Package, file string) *ResolvedPackage {
	return &ResolvedPackage{src, file}
}
