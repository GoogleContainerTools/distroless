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
	"strconv"
	"strings"
	"unicode"

	"github.com/pkg/errors"
)

// https://www.debian.org/doc/debian-policy/ch-controlfields.html#version
// [epoch:]upstream_version[-debian_revision]

type Version struct {
	Epoch           int
	UpstreamVersion string
	DebianRevision  string
	Original        string
}

func (v Version) String() string {
	return v.Original
}

// returns 1 if va > vb, 0 if equal and -1 if vb > va
func compareVersionStrings(va string, vb string) (int, error) {
	a, err := parseVersion(va)
	if err != nil {
		return 2, err
	}
	b, err := parseVersion(vb)
	if err != nil {
		return 2, err
	}
	return CompareVersion(a, b), nil
}

func CompareVersion(a Version, b Version) int {
	if a == b {
		return 0
	}

	if a.Epoch != b.Epoch {
		if a.Epoch > b.Epoch {
			return 1
		}
		return -1
	}

	if a.UpstreamVersion != b.UpstreamVersion {
		return compareRevisionStrings(a.UpstreamVersion, b.UpstreamVersion)
	}

	return compareRevisionStrings(a.DebianRevision, b.DebianRevision)
}

type stringConst string

func MustParseVersion(verStr stringConst) Version {
	if v, err := parseVersion(string(verStr)); err != nil {
		panic(err)
	} else {
		return v
	}
}

func parseVersion(verStr string) (Version, error) {
	ver := Version{
		Original: verStr,
	}
	if !isAllASCII(verStr) {
		return ver, fmt.Errorf("%q is not an ASCII version string", ver)
	}

	// epoch is the first integer before ":"
	splitOnColon := strings.SplitN(verStr, ":", 2)
	if len(splitOnColon) == 1 {
		ver.Epoch = 0
	} else {
		if epoch, err := strconv.Atoi(splitOnColon[0]); err != nil {
			return ver, errors.Wrapf(err, "Invalid epoch: %q", verStr)
		} else {
			ver.Epoch = epoch
		}
	}
	remainder := splitOnColon[len(splitOnColon)-1]

	// split the remaining by last -
	hyphenIndex := strings.LastIndex(remainder, "-")
	if hyphenIndex == -1 {
		ver.UpstreamVersion = remainder
		ver.DebianRevision = "0"
	} else {
		ver.UpstreamVersion = remainder[:hyphenIndex]
		ver.DebianRevision = remainder[hyphenIndex+1:]
	}

	if !isValidUpstreamVersion(ver.UpstreamVersion) {
		return ver, fmt.Errorf("invalid debian upstream version string: %q(%q)", ver.UpstreamVersion, verStr)
	}
	if !isValidDebianRevision(ver.DebianRevision) {
		return ver, fmt.Errorf("invalid debian revision version string: %q(%q)", ver.DebianRevision, verStr)
	}

	return ver, nil
}

func isAllASCII(s string) bool {
	for i := 0; i < len(s); i++ {
		if s[i] > unicode.MaxASCII {
			return false
		}
	}
	return true
}

func isValidUpstreamVersion(uv string) bool {
	if len(uv) == 0 {
		return false
	}
	// must start with [0-9]
	if !unicode.IsDigit(rune(uv[0])) {
		return false
	}

	// only allow [A-Za-z0-9] and the characters .+-~ underscore is deprecated
	symbols := ".+-~"
	for _, s := range uv {
		if !unicode.IsDigit(s) && !unicode.IsLetter(s) && !strings.ContainsRune(symbols, s) {
			return false
		}
	}
	return true
}

func isValidDebianRevision(uv string) bool {
	if len(uv) == 0 {
		return false
	}

	// only allow [A-Za-z0-9] and the characters .+~
	symbols := ".+-~"
	for _, s := range uv {
		if !unicode.IsDigit(s) && !unicode.IsLetter(s) && !strings.ContainsRune(symbols, s) {
			return false
		}
	}
	return true
}

// returns remainder, digits
func findDigits(str string) (int, string) {
	if len(str) == 0 {
		return 0, ""
	}
	for i := 0; i < len(str); i++ {
		if !unicode.IsDigit(rune(str[i])) {
			if i == 0 {
				return 0, str
			}
			val, _ := strconv.Atoi(str[:i])
			return val, str[i:]
		}
	}
	val, _ := strconv.Atoi(str)
	return val, ""
}

// returns remainder, digits
func findNonDigits(str string) (string, string) {
	if len(str) == 0 {
		return "", ""
	}
	for i := 0; i < len(str); i++ {
		if unicode.IsDigit(rune(str[i])) {
			if i == 0 {
				return "", str
			}
			return str[:i], str[i:]
		}
	}
	return str, ""
}

type tuple struct {
	nonDigits string
	digits    int
}

// converts a version string to str, int, str, int, ...
func breakdownVersion(ver string) []tuple {
	result := []tuple{}

	var nd string
	var di int
	for rem := ver; len(rem) != 0; {
		nd, rem = findNonDigits(rem)
		di, rem = findDigits(rem)
		result = append(result, tuple{nd, di})
	}
	return result
}

func compareRevisionStrings(a string, b string) int {
	if a == b {
		return 0
	}
	partsA := breakdownVersion(a)
	partsB := breakdownVersion(b)

	minL := len(partsA)
	if len(partsA) > len(partsB) {
		minL = len(partsB)
	}

	for i := 0; i < minL; i++ {
		if partsA[i] == partsB[i] {
			continue
		}
		if partsA[i].nonDigits != partsB[i].nonDigits {
			return compareNonDigits(partsA[i].nonDigits, partsB[i].nonDigits)
		}
		if partsA[i].digits != partsB[i].digits {
			if partsA[i].digits > partsB[i].digits {
				return 1
			}
			return -1
		}
	}

	if len(partsA) == len(partsB) {
		return 0
	}
	if len(partsA) > len(partsB) {
		return 1
	}
	return -1
}

func compareNonDigits(a string, b string) int {
	if a == b {
		return 0
	}
	minL := len(a)
	if len(a) > len(b) {
		minL = len(b)
	}
	for i := 0; i < minL; i++ {
		if a[i] == b[i] {
			continue
		}
		// tilde is smalled
		if a[i] == '~' {
			return -1
		}
		if b[i] == '~' {
			return 1
		}
		// then all letters before symbols
		if unicode.IsLetter(rune(a[i])) && !unicode.IsLetter(rune(b[i])) {
			return -1
		}
		if !unicode.IsLetter(rune(a[i])) && unicode.IsLetter(rune(b[i])) {
			return 1
		}
		// then compare letters against letters or symbols against symbols by ascii value
		if a[i] > b[i] {
			return 1
		}
		if b[i] > a[i] {
			return -1
		}
	}
	// reached the end of a or b, see if the next character is a tilde (because that sorts before nothing)
	if len(a) > len(b) {
		if a[minL] == '~' {
			return -1
		}
		return 1
	} else {
		if b[minL] == '~' {
			return 1
		}
		return -1
	}
}
