package build

import (
	"bytes"
	"testing"

	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/deb"
	"github.com/google/go-cmp/cmp"
)

func testdata() map[string]map[string]map[string]*deb.Package {
	pkgInfo := map[string]map[string]map[string]*deb.Package{}
	pkgInfo["cccc"] = map[string]map[string]*deb.Package{}
	pkgInfo["aaaa"] = map[string]map[string]*deb.Package{}
	pkgInfo["aaaa"]["1111"] = map[string]*deb.Package{
		"xxxx": {
			Name:    "xxxx",
			SHA256:  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
			Version: deb.MustParseVersion("1"),
			URL:     "https://example.com/xxxx-aaaa-1111.deb",
		},
		"ssss": {
			Name:    "ssss",
			SHA256:  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
			Version: deb.MustParseVersion("2"),
			URL:     "https://example.com/ssss-aaaa-1111.deb",
		},
	}
	pkgInfo["cccc"]["2222"] = map[string]*deb.Package{
		"xxxx": {
			Name:    "xxxx",
			SHA256:  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
			Version: deb.MustParseVersion("3"),
			URL:     "https://example.com/xxxx-cccc-2222.deb",
		},
	}
	pkgInfo["cccc"]["1111"] = map[string]*deb.Package{
		"xxxx++": {
			Name:    "xxxx++",
			SHA256:  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
			Version: deb.MustParseVersion("4"),
			URL:     "https://example.com/xxxx++-cccc-1111.deb",
		},
	}
	return pkgInfo
}

func TestWriteArchiveBazel(t *testing.T) {
	pkgInfo := testdata()

	got := bytes.Buffer{}
	if err := writeArchivesBzl2(&got, pkgInfo); err != nil {
		t.Fatal(err)
	}
	want := `# AUTO GENERATED
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def repositories():
    http_file(
        name = "aaaa_1111_ssss",
        downloaded_file_path = "ssss-aaaa-1111.deb",
        sha256 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        urls = ["https://example.com/ssss-aaaa-1111.deb"],
    )
    http_file(
        name = "aaaa_1111_xxxx",
        downloaded_file_path = "xxxx-aaaa-1111.deb",
        sha256 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        urls = ["https://example.com/xxxx-aaaa-1111.deb"],
    )
    http_file(
        name = "cccc_1111_xxxxpp",
        downloaded_file_path = "xxxx++-cccc-1111.deb",
        sha256 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        urls = ["https://example.com/xxxx++-cccc-1111.deb"],
    )
    http_file(
        name = "cccc_2222_xxxx",
        downloaded_file_path = "xxxx-cccc-2222.deb",
        sha256 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
        urls = ["https://example.com/xxxx-cccc-2222.deb"],
    )
`
	if diff := cmp.Diff(got.String(), want); diff != "" {
		t.Fatal(diff)
	}
}

func TestWriteVersionsBazel(t *testing.T) {
	pkgInfo := testdata()

	got := bytes.Buffer{}
	if err := writeVersionsBzl2(&got, pkgInfo); err != nil {
		t.Fatal(err)
	}
	want := `# AUTO GENERATED
DEBIAN_PACKAGE_VERSIONS = {
    "aaaa": {
        "1111": {
            "ssss": "2",
            "xxxx": "1",
        },
    },
    "cccc": {
        "1111": {
            "xxxxpp": "4",
        },
        "2222": {
            "xxxx": "3",
        },
    },
}
`
	if diff := cmp.Diff(got.String(), want); diff != "" {
		t.Fatal(diff)
	}
}
