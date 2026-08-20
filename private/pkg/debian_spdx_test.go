package main

import (
	"strings"
	"testing"
)

func TestParseDebControl(t *testing.T) {
	tests := []struct {
		name    string
		input   string
		want    map[string]string
		wantErr bool
	}{
		{
			name: "standard debian control",
			input: `Package: libc6
Version: 2.36-9+deb12u7
Architecture: amd64
Maintainer: GNU Libc Maintainers <debian-glibc@lists.debian.org>
Description: GNU C Library: Shared libraries
 An implementation of the standard C libraries.
 .
 Contains the standard libraries.
`,
			want: map[string]string{
				"Package":      "libc6",
				"Version":      "2.36-9+deb12u7",
				"Architecture": "amd64",
				"Maintainer":   "GNU Libc Maintainers <debian-glibc@lists.debian.org>",
				"Description":  "GNU C Library: Shared libraries\nAn implementation of the standard C libraries.\n.\nContains the standard libraries.",
			},
			wantErr: false,
		},
		{
			name: "control with custom Purl",
			input: `Package: nodejs
Version: 22.23.2
Architecture: amd64
Purl: pkg:generic/nodejs@22.23.2?download_url=https://nodejs.org/
Maintainer: OpenJS Foundation <https://openjsf.org/>
Homepage: https://nodejs.org
`,
			want: map[string]string{
				"Package":      "nodejs",
				"Version":      "22.23.2",
				"Architecture": "amd64",
				"Purl":         "pkg:generic/nodejs@22.23.2?download_url=https://nodejs.org/",
				"Maintainer":   "OpenJS Foundation <https://openjsf.org/>",
				"Homepage":     "https://nodejs.org",
			},
			wantErr: false,
		},
		{
			name:    "invalid indentation",
			input:   " leading whitespace without key\n",
			wantErr: true,
		},
		{
			name:    "duplicate key",
			input:   "Package: foo\nPackage: bar\n",
			wantErr: true,
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			got, err := parseDebControl(strings.NewReader(tc.input))
			if (err != nil) != tc.wantErr {
				t.Fatalf("parseDebControl() error = %v, wantErr %v", err, tc.wantErr)
			}
			if tc.wantErr {
				return
			}
			for k, v := range tc.want {
				if got[k] != v {
					t.Errorf("got[%q] = %q, want %q", k, got[k], v)
				}
			}
		})
	}
}

func TestPurl(t *testing.T) {
	tests := []struct {
		name string
		mp   map[string]string
		want string
	}{
		{
			name: "default debian package",
			mp: map[string]string{
				"Package":      "libc6",
				"Version":      "2.36-9+deb12u7",
				"Architecture": "amd64",
			},
			want: "pkg:deb/debian/libc6@2.36-9+deb12u7?arch=amd64",
		},
		{
			name: "custom Purl field",
			mp: map[string]string{
				"Package":      "nodejs",
				"Version":      "22.23.2",
				"Architecture": "amd64",
				"Purl":         "pkg:generic/nodejs@22.23.2?download_url=https://nodejs.org/",
			},
			want: "pkg:generic/nodejs@22.23.2?download_url=https://nodejs.org/",
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			got := purl(tc.mp)
			if got != tc.want {
				t.Errorf("purl() = %q, want %q", got, tc.want)
			}
		})
	}
}

func TestPkgId(t *testing.T) {
	tests := []struct {
		input string
		want  string
	}{
		{"foo/bar:baz@1.0_2", "foo-slash-bar-colon-baz-at-1.0-underscore-2"},
	}
	for _, tc := range tests {
		if got := pkgId(tc.input); got != tc.want {
			t.Errorf("pkgId(%q) = %q, want %q", tc.input, got, tc.want)
		}
	}
}
