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
	"bufio"
	"fmt"
	"io"
	"net/url"
	"path"
	"regexp"
	"strings"
)

const (
	separator   = ":"
	packageKey  = "Package"
	sha256Key   = "SHA256"
	versionKey  = "Version"
	filenameKey = "Filename"
)

// Parse reads a debian package list, filters on packages (no filter if packages = nil)
// and returns a []Package with poolPrefix applied to filename
func parse(r io.Reader, packages map[string]bool) ([]map[string]string, error) {
	var allEntries []map[string]string
	var currentLines []string
	var currentKey string
	var currentEntry = map[string]string{}

	continuation := regexp.MustCompile(`^\s`)
	s := bufio.NewScanner(r)

	// some Packages.xz lines are super big
	maxCap := 1024 * 1024
	megaBuffer := make([]byte, maxCap)
	s.Buffer(megaBuffer, maxCap)

	ln := 0
	for s.Scan() {
		line := s.Text()
		ln++
		if line != "" {
			if continuation.MatchString(line) {
				if currentKey == "" || len(currentEntry) == 0 {
					return nil, fmt.Errorf("bad indentation on line %d: %q", ln, line)
				}
				currentEntry[currentKey] += strings.TrimSpace(line)
			} else if strings.Contains(line, separator) {
				sp := strings.SplitN(line, separator, 2)
				currentKey = strings.TrimSpace(sp[0])
				if _, ok := currentEntry[currentKey]; ok {
					return nil, fmt.Errorf("duplicate key %q on line %d: %q", currentKey, ln, line)
				}
				currentEntry[currentKey] = strings.TrimSpace(sp[1])
			} else {
				return nil, fmt.Errorf("no indentation or delimiter on line %d: %q", ln, line)
			}
		} else {
			if len(currentEntry) != 0 && (packages == nil || packages[currentEntry[packageKey]]) {
				allEntries = append(allEntries, currentEntry)
			}
			currentLines = currentLines[:0]
			currentEntry = map[string]string{}
			currentKey = ""
		}
	}
	if s.Err() != nil {
		return nil, s.Err()
	}
	if len(currentEntry) != 0 && (packages == nil || packages[currentEntry[packageKey]]) {
		allEntries = append(allEntries, currentEntry)
	}

	return allEntries, nil
}

func Parse(r io.Reader, packages map[string]bool, poolPrefix *url.URL) (map[string]*Package, error) {
	allEntries, err := parse(r, packages)
	if err != nil {
		return nil, err
	}
	ps := map[string]*Package{}
	for _, entry := range allEntries {
		fileURL := *poolPrefix // make a copy of the pool root so we don't mutate it
		fileURL.Path = path.Join(poolPrefix.Path, entry[filenameKey])

		p, err := NewPackage(entry[packageKey], entry[sha256Key], entry[versionKey], fileURL.String())
		if err != nil {
			return nil, err
		}
		ps[p.Name] = p
	}
	return ps, nil
}
