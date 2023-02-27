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
	id = strings.ReplaceAll(id, "_", "-underscore-")
	id = strings.ReplaceAll(id, ":", "-colon-")
	id = strings.ReplaceAll(id, "@", "-at-")
	return id
}

type ArrayFlags []string

func (i *ArrayFlags) String() string {
	return "my string representation"
}

func (i *ArrayFlags) Set(value string) error {
	*i = append(*i, value)
	return nil
}

func main() {
	var label, output string
	var contains ArrayFlags
	flag.StringVar(&output, "output", "", "")
	flag.StringVar(&label, "label", "", "")
	flag.Var(&contains, "contains", "")
	flag.Parse()

	id := pkgId(label)
	doc := v2_3.Document{
		SPDXIdentifier:    "SPDXRef-DOCUMENT",
		SPDXVersion:       "SPDX-2.3",
		DocumentName:      label,
		DataLicense:       "CC0-1.0",
		DocumentNamespace: "http://spdx.org/spdxdocs/distroless/" + id,
		CreationInfo: &v2_3.CreationInfo{
			Created: "1970-01-01T00:00:00Z",
			Creators: []common.Creator{
				common.Creator{
					Creator: "distroless", CreatorType: "Organization",
				},
			},
			LicenseListVersion: "NOASSERTION",
		},
		Packages: []*v2_3.Package{
			{
				PackageSPDXIdentifier:   common.ElementID(id),
				PackageName:             label,
				PackageDownloadLocation: "NOASSERTION",
				PackageCopyrightText:    "NOASSERTION",
			},
		},
		Relationships: []*v2_3.Relationship{
			{
				RefA:         common.MakeDocElementID("", "DOCUMENT"),
				RefB:         common.MakeDocElementID("", id),
				Relationship: "DESCRIBES",
			},
		},
	}
	spdxs := flag.Args()
	for _, p := range spdxs {
		bytes, err := os.Open(p)
		if err != nil {
			log.Fatalln(err)
		}
		subdoc, err := spdx_json.Load2_3(bytes)
		if err != nil {
			log.Fatalln(err)
		}
		doc.Packages = append(doc.Packages, subdoc.Packages...)
		for _, rel := range subdoc.Relationships {
			if rel.Relationship == "DESCRIBES" && rel.RefA.ElementRefID == "DOCUMENT" {
				continue
			}
			doc.Relationships = append(doc.Relationships, rel)
		}
		doc.Relationships = append(doc.Relationships, &v2_3.Relationship{
			RefA:         common.MakeDocElementID("", id),
			RefB:         common.DocElementID{ElementRefID: subdoc.SPDXIdentifier},
			Relationship: "DEPENDS_ON",
		})
	}

	for _, contain := range contains {
		bytes, err := os.Open(contain)
		if err != nil {
			log.Fatalln(err)
		}
		subdoc, err := spdx_json.Load2_3(bytes)
		if err != nil {
			log.Fatalln(err)
		}
		doc.Packages = append(doc.Packages, subdoc.Packages...)

		var describedBy *common.DocElementID = nil
		for _, rel := range subdoc.Relationships {
			if rel.Relationship == "DESCRIBES" && rel.RefA.ElementRefID == "DOCUMENT" {
				if rel.RefA.ElementRefID == subdoc.SPDXIdentifier {
					describedBy = &rel.RefB
				}
				continue
			}
			doc.Relationships = append(doc.Relationships, rel)
		}
		if describedBy == nil {
			log.Fatalln(fmt.Errorf("%s: can not determine which package describes %s", contain, subdoc.SPDXIdentifier))
		}
		doc.Relationships = append(doc.Relationships, &v2_3.Relationship{
			RefA:         common.MakeDocElementID("", id),
			RefB:         *describedBy,
			Relationship: "CONTAINS",
		})
	}

	outputFile, err := os.Create(output)
	if err != nil {
		log.Fatalln(err)
	}

	if err := spdx_json.Save2_3(&doc, outputFile); err != nil {
		log.Fatalln(err)
	}
}
