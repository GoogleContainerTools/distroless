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

package config

import (
	"fmt"
	"os"

	"github.com/pkg/errors"
	"gopkg.in/yaml.v3"
)

type Packages map[Arch]map[Distro]map[string]bool

func (ps Packages) Get(arch Arch, distro Distro) (map[string]bool, error) {
	pkgs, ok := ps[arch][distro]
	if !ok {
		return nil, fmt.Errorf("packages not found for %q/%q", distro, arch)
	}
	return pkgs, nil
}

func (ps Packages) add(archs []Arch, distros []Distro, packages []string) {
	for _, arch := range archs {
		if _, ok := ps[arch]; !ok {
			ps[arch] = map[Distro]map[string]bool{}
		}
		for _, distro := range distros {
			if _, ok := ps[arch][distro]; !ok {
				ps[arch][distro] = map[string]bool{}
			}
			for _, pkg := range packages {
				ps[arch][distro][pkg] = true
			}
		}
	}
}

type PackagesYaml struct {
	Packages []string
	Archs    []Arch
	Distros  []Distro
}

func validate(pjs []PackagesYaml) error {
	for i, pj := range pjs {
		if len(pj.Archs) == 0 {
			return fmt.Errorf("package config at index %d, Archs is empty", i)
		}
		if len(pj.Packages) == 0 {
			return fmt.Errorf("package config at index %d, Packages is empty", i)
		}
		if len(pj.Distros) == 0 {
			return fmt.Errorf("package config at index %d, Distros is empty", i)
		}
	}
	return nil
}

func LoadPackages(path string) (Packages, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	pys := []PackagesYaml{}
	dec := yaml.NewDecoder(f)
	dec.KnownFields(true)
	if err := dec.Decode(&pys); err != nil {
		return nil, err
	}
	if err := validate(pys); err != nil {
		return nil, errors.Wrapf(err, "validation error in %q", path)
	}
	pdb := Packages{}
	for _, py := range pys {
		pdb.add(py.Archs, py.Distros, py.Packages)
	}
	return pdb, nil
}
