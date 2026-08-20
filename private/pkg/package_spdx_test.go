package main

import (
	"testing"
)

func TestParseSupplier(t *testing.T) {
	tests := []struct {
		input     string
		wantType  string
		wantName  string
		wantIsNil bool
	}{
		{
			input:     "",
			wantIsNil: true,
		},
		{
			input:    "Person: OpenJS Foundation <https://openjsf.org/>",
			wantType: "Person",
			wantName: "OpenJS Foundation <https://openjsf.org/>",
		},
		{
			input:    "Organization: Google",
			wantType: "Organization",
			wantName: "Google",
		},
		{
			input:    "Some Vendor",
			wantType: "Person",
			wantName: "Some Vendor",
		},
	}

	for _, tc := range tests {
		t.Run(tc.input, func(t *testing.T) {
			got := parseSupplier(tc.input)
			if tc.wantIsNil {
				if got != nil {
					t.Errorf("parseSupplier(%q) = %v, want nil", tc.input, got)
				}
				return
			}
			if got == nil {
				t.Fatalf("parseSupplier(%q) = nil, want non-nil", tc.input)
			}
			if got.SupplierType != tc.wantType {
				t.Errorf("got.SupplierType = %q, want %q", got.SupplierType, tc.wantType)
			}
			if got.Supplier != tc.wantName {
				t.Errorf("got.Supplier = %q, want %q", got.Supplier, tc.wantName)
			}
		})
	}
}

func TestPackagePkgId(t *testing.T) {
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
