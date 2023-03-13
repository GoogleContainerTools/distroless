package main

import (
	"bufio"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"regexp"
	"strings"

	spdx_json "github.com/spdx/tools-golang/json"
	"github.com/spdx/tools-golang/spdx/common"
	"github.com/spdx/tools-golang/spdx/v2_3"
)

func pkgId(id string) string {
	id = strings.ReplaceAll(id, "/", "-slash-")
	id = strings.ReplaceAll(id, "_", "-underscore-")
	id = strings.ReplaceAll(id, "_", "-underscore-")
	id = strings.ReplaceAll(id, ":", "-colon-")
	id = strings.ReplaceAll(id, "@", "-at-")
	return id
}

// TODO: make part of debian_package_manager
func parseDebControl(r io.Reader) (map[string]string, error) {
	const (
		separator = ":"
	)
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

		if continuation.MatchString(line) {
			if currentKey == "" || len(currentEntry) == 0 {
				return nil, fmt.Errorf("bad indentation on line %d: %q", ln, line)
			}
			currentEntry[currentKey] += "\n" + strings.TrimSpace(line)
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

	}
	if s.Err() != nil {
		return nil, s.Err()
	}

	return currentEntry, nil
}

func main() {
	var control, output, sha256, url, id, copyright, generates string
	flag.StringVar(&control, "control", "", "")
	flag.StringVar(&output, "output", "", "")
	flag.StringVar(&sha256, "sha256", "", "")
	flag.StringVar(&id, "id", "", "")
	flag.StringVar(&copyright, "copyright", "", "")
	flag.StringVar(&generates, "generates", "", "")
	// TODO: multiple urls. it is not required at the moment since .deb are fetched without a fallback mirror.
	flag.StringVar(&url, "url", "", "")
	flag.Parse()

	read, err := os.Open(control)
	if err != nil {
		log.Fatalln(err)
	}
	mp, err := parseDebControl(read)
	if err != nil {
		log.Fatalln(err)
	}

	copyrightText := "NOASSERTION"
	if copyright != "" {
		copyrightBytes, err := os.ReadFile(copyright)
		if err != nil {
			log.Fatalln(err)
		}
		copyrightText = string(copyrightBytes)
	}

	supplier := &common.Supplier{}
	if mp["Maintainer"] != "" {
		supplier.Supplier = mp["Maintainer"]
		supplier.SupplierType = "Person"
	}

	deb := &v2_3.Package{
		PackageSPDXIdentifier:   common.ElementID(pkgId(id)),
		PackageName:             mp["Package"],
		PackageDescription:      mp["Description"],
		PackageSummary:          strings.Split(mp["Description"], "\n")[0],
		PackageVersion:          mp["Version"],
		PackageSourceInfo:       mp["Source"],
		PackageHomePage:         mp["Homepage"],
		BuiltDate:               mp["Date"],
		ReleaseDate:             mp["Date"],
		PackageDownloadLocation: url,
		PackageSupplier:         supplier,
		PackageCopyrightText:    copyrightText,
		PackageChecksums: []common.Checksum{
			{
				Algorithm: common.SHA256,
				Value:     sha256,
			},
		},
		PackageExternalReferences: []*v2_3.PackageExternalReference{
			{

				Category: "PACKAGE-MANAGER",
				Locator:  fmt.Sprintf("pkg:deb/debian/%s@%s?arch=%s", mp["Package"], mp["Version"], mp["Architecture"]),
				RefType:  common.TypePackageManagerPURL,
			},
		},
	}
	gen := &v2_3.Package{
		PackageSPDXIdentifier:   common.ElementID(pkgId(generates)),
		PackageName:             generates,
		PackageDescription:      fmt.Sprintf("Generated from %s@%s", deb.PackageName, deb.PackageVersion),
		PackageDownloadLocation: "NOASSERTION",
		PackageCopyrightText:    "NOASSERTION",
	}
	doc := &v2_3.Document{
		SPDXIdentifier: gen.PackageSPDXIdentifier,
		Packages: []*v2_3.Package{
			deb,
			gen,
		},
		Relationships: []*v2_3.Relationship{
			&v2_3.Relationship{
				RefA:         common.DocElementID{ElementRefID: gen.PackageSPDXIdentifier},
				RefB:         common.DocElementID{ElementRefID: deb.PackageSPDXIdentifier},
				Relationship: common.TypeRelationshipGeneratedFrom,
			},
		},
	}
	outputFile, err := os.Create(output)
	if err != nil {
		log.Fatalln(err)
	}
	if err := spdx_json.Save2_3(doc, outputFile); err != nil {
		log.Fatalln(err)
	}
}
