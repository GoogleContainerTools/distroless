package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"strings"

	spdx_json "github.com/spdx/tools-golang/json"
	"github.com/spdx/tools-golang/spdx/common"
	"github.com/spdx/tools-golang/spdx/v2_3"
)

func pkgId(id string) string {
	id = strings.ReplaceAll(id, "/", "-slash-")
	id = strings.ReplaceAll(id, "_", "-underscore-")
	id = strings.ReplaceAll(id, ":", "-colon-")
	id = strings.ReplaceAll(id, "@", "-at-")
	return id
}

func parseSupplier(supplierStr string) *common.Supplier {
	if supplierStr == "" {
		return nil
	}
	s := &common.Supplier{
		Supplier:     supplierStr,
		SupplierType: "Person",
	}
	if strings.HasPrefix(supplierStr, "Organization: ") {
		s.Supplier = strings.TrimPrefix(supplierStr, "Organization: ")
		s.SupplierType = "Organization"
	} else if strings.HasPrefix(supplierStr, "Person: ") {
		s.Supplier = strings.TrimPrefix(supplierStr, "Person: ")
		s.SupplierType = "Person"
	}
	return s
}

func main() {
	var packageName, version, purl, output, sha256, url, id, copyright, generates, homepage, supplierName, description string
	flag.StringVar(&packageName, "package_name", "", "")
	flag.StringVar(&version, "version", "", "")
	flag.StringVar(&purl, "purl", "", "")
	flag.StringVar(&output, "output", "", "")
	flag.StringVar(&sha256, "sha256", "", "")
	flag.StringVar(&id, "id", "", "")
	flag.StringVar(&copyright, "copyright", "", "")
	flag.StringVar(&generates, "generates", "", "")
	flag.StringVar(&url, "url", "", "")
	flag.StringVar(&homepage, "homepage", "", "")
	flag.StringVar(&supplierName, "supplier", "", "")
	flag.StringVar(&description, "description", "", "")
	flag.Parse()

	copyrightText := "NOASSERTION"
	if copyright != "" {
		copyrightBytes, err := os.ReadFile(copyright)
		if err != nil {
			log.Fatalln(err)
		}
		copyrightText = string(copyrightBytes)
	}

	supplier := parseSupplier(supplierName)

	if purl == "" {
		purl = fmt.Sprintf("pkg:generic/%s@%s", packageName, version)
		if url != "" {
			purl += fmt.Sprintf("?download_url=%s", url)
		}
	}

	var summary string
	if description != "" {
		summary = strings.Split(description, "\n")[0]
	}

	pkg := &v2_3.Package{
		PackageSPDXIdentifier:   common.ElementID(pkgId(id)),
		PackageName:             packageName,
		PackageDescription:      description,
		PackageSummary:          summary,
		PackageVersion:          version,
		PackageHomePage:         homepage,
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
				Locator:  purl,
				RefType:  common.TypePackageManagerPURL,
			},
		},
	}
	gen := &v2_3.Package{
		PackageSPDXIdentifier:   common.ElementID(pkgId(generates)),
		PackageName:             generates,
		PackageDescription:      fmt.Sprintf("Generated from %s@%s", pkg.PackageName, pkg.PackageVersion),
		PackageDownloadLocation: "NOASSERTION",
		PackageCopyrightText:    "NOASSERTION",
	}
	doc := &v2_3.Document{
		SPDXIdentifier: gen.PackageSPDXIdentifier,
		Packages: []*v2_3.Package{
			pkg,
			gen,
		},
		Relationships: []*v2_3.Relationship{
			{
				RefA:         common.DocElementID{ElementRefID: gen.PackageSPDXIdentifier},
				RefB:         common.DocElementID{ElementRefID: pkg.PackageSPDXIdentifier},
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
