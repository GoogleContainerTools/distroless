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
	"os"

	"gopkg.in/yaml.v3"
)

type Snapshots struct {
	Debian   string
	Security string
}

func LoadSnapshots(path string) (*Snapshots, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	s := &Snapshots{}
	dec := yaml.NewDecoder(f)
	dec.KnownFields(true)
	if err := dec.Decode(s); err != nil {
		return nil, err
	}
	return s, nil
}

func SaveSnapshots(path string, snapshots *Snapshots) error {
	f, err := os.OpenFile(path, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0644)
	if err != nil {
		return err
	}
	defer f.Close()

	if _, err := f.WriteString("# AUTO GENERATED\n"); err != nil {
		return err
	}
	enc := yaml.NewEncoder(f)
	if err := enc.Encode(snapshots); err != nil {
		return err
	}
	return nil
}

func (s1 *Snapshots) Equivalent(s2 *Snapshots) bool {
	return s1.Debian == s2.Debian && s1.Security == s2.Security
}
