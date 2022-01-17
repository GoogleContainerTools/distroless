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
	"testing"
)

func TestCompareVersions(t *testing.T) {
	testCases := []struct {
		a    string
		b    string
		want int
	}{
		{"0.0.0", "0:0.0.0", 0},
		{"0:0.0.0-foo", "0.0.0-foo", 0},
		{"0.0.0-a", "0:0.0.0-a", 0},

		{"0.0.0", "0.0.0-0", 0},
		{"0.0.0", "0.0.0-00", 0},
		{"0.0.0-0", "0:0.0.0", 0},

		{"0.0.0", "0.0.0", 0},
		{"1:0.0.0", "1:0.0.0", 0},
		{"0.0.0-10", "0.0.0-10", 0},
		{"2:0.0.0-1", "2:0.0.0-1", 0},
		{"0:1.0.0-foo", "0:1.0.0-foo", 0},

		{"0.0.0-0", "0:0.0.1", -1},
		{"0.0.0-0", "0:0.0.0-a", -1},
		{"0.0.0-0", "0:0.0.0-1", -1},
		{"0.0.9", "0.0.10", -1},
		{"0.9.0", "0.10.0", -1},
		{"9.0.0", "10.0.0", -1},

		{"0.0.1-0", "0:0.0.0", 1},
		{"0.0.0-a", "0:0.0.0-1", 1},
		{"0.0.0-a", "0:0.0.0-0", 1},
		{"0.0.9", "0.0.1", 1},
		{"0.9.0", "0.1.0", 1},
		{"9.0.0", "1.0.0", 1},
	}

	for _, tc := range testCases {
		t.Run(fmt.Sprintf("%q,%q", tc.a, tc.b), func(t *testing.T) {
			got, err := compareVersionStrings(tc.a, tc.b)
			if err != nil {
				t.Fatal(err)
			}
			if got != tc.want {
				t.Fatalf("got:%d, want:%d", got, tc.want)
			}
		})
	}
}
func TestCompareRevisionStrings(t *testing.T) {
	testCases := []struct {
		a    string
		b    string
		want int
	}{
		{"0", "0", 0},
		{"0", "00", 0},
		{"00.0.9", "0.0.9", 0},
		{"0.00.9-foo", "0.0.9-foo", 0},
		{"0.0.9-1.00foo", "0.0.9-1.0foo", 0},

		{"0.0.9", "0.0.10", -1},
		{"0.0.9-foo", "0.0.10-foo", -1},
		{"0.0.9-foo", "0.0.10-goo", -1},
		{"0.0.9-foo", "0.0.9-goo", -1},
		{"0.0.10-foo", "0.0.10-goo", -1},
		{"0.0.9-1.0foo", "0.0.9-1.1foo", -1},

		{"0.0.10", "0.0.9", 1},
		{"0.0.10-foo", "0.0.9-foo", 1},
		{"0.0.10-foo", "0.0.9-goo", 1},
		{"0.0.9-1.0foo", "0.0.9-1.0bar", 1},
	}

	for _, tc := range testCases {
		t.Run(fmt.Sprintf("%q,%q", tc.a, tc.b), func(t *testing.T) {
			got := compareRevisionStrings(tc.a, tc.b)
			if got != tc.want {
				t.Fatalf("got:%d, want:%d", got, tc.want)
			}
		})
	}
}

func TestCompareNonDigits(t *testing.T) {
	testCases := []struct {
		a    string
		b    string
		want int
	}{
		{"~", ".", -1},
		{"~", "a", -1},
		{"a", ".", -1},
		{"a", "~", 1},
		{".", "~", 1},
		{".", "a", 1},
		{".", ".", 0},
		{"0", "0", 0},
		{"a", "a", 0},

		{"", "a", -1},
		{"~", "", -1},
		{"~~a", "~", -1},
		{"~~", "~~a", -1},
	}

	for _, tc := range testCases {
		t.Run(fmt.Sprintf("%q,%q", tc.a, tc.b), func(t *testing.T) {
			got := compareNonDigits(tc.a, tc.b)
			if got != tc.want {
				t.Fatalf("got:%d, want:%d", got, tc.want)
			}
		})
	}

}
