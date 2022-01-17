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
)

type Arch int64

const (
	AMD64 Arch = iota
	ARM64
	ARM
	PPC64LE
	S390X
)

var archs = []Arch{AMD64, ARM64, ARM, PPC64LE, S390X}

func (a Arch) String() string {
	switch a {
	case AMD64:
		return "amd64"
	case ARM64:
		return "arm64"
	case ARM:
		return "arm"
	case PPC64LE:
		return "ppc64le"
	case S390X:
		return "s390x"
	}
	panic("unknown release")
}

// DebianName returns the debian specific name, which are slightly different than normal
func (a Arch) DebianName() string {
	switch a {
	case AMD64:
		return "amd64"
	case ARM64:
		return "arm64"
	case ARM:
		return "armhf"
	case PPC64LE:
		return "ppc64el"
	case S390X:
		return "s390x"
	}
	panic("unknown release")
}

func (a *Arch) UnmarshalYAML(unmarshal func(interface{}) error) error {
	var s string
	err := unmarshal(&s)
	if err != nil {
		return err
	}
	for _, arch := range archs {
		if s == arch.String() {
			*a = arch
			return nil
		}
	}
	return fmt.Errorf("%q is not a valid architecture", s)
}
