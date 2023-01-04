package main

import (
	"bufio"
	"encoding/json"
	"flag"
	"fmt"
	"io"
	"os"
	"regexp"
	"strings"
)

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

func generateSpdx() {
	var control, output, sha256, url, id, copyright, generates string
	flag.StringVar(&control, "control", "", "")
	flag.StringVar(&output, "output", "", "")
	flag.StringVar(&sha256, "sha256", "", "")
	flag.StringVar(&id, "id", "", "")
	flag.StringVar(&copyright, "copyright", "", "")
	flag.StringVar(&generates, "generates", "", "")
	// TODO: multiple urls. it is not required at the moment since .deb are fetched without a fallback mirror.
	flag.StringVar(&url, "url", "", "")
	if err := flag.CommandLine.Parse(os.Args[2:]); err != nil {
		panic(err)
	}

	read, err := os.Open(control)
	if err != nil {
		panic(err)
	}
	mp, err := parseDebControl(read)
	if err != nil {
		panic(err)
	}

	copyrightText := NOASSERTION
	if copyright != "" {
		copyrightBytes, err := os.ReadFile(copyright)
		if err != nil {
			panic(err)
		}
		copyrightText = string(copyrightBytes)
	}

	supplier := ""
	if mp["Maintainer"] != "" {
		supplier = fmt.Sprintf("Person: %s", mp["Maintainer"])
	}

	deb := Package{
		ID:               pkgId(id),
		Name:             mp["Package"],
		Description:      mp["Description"],
		Summary:          strings.Split(mp["Description"], "\n")[0],
		Version:          mp["Version"],
		SourceInfo:       mp["Source"],
		Homepage:         mp["Homepage"],
		BuiltDate:        mp["Date"],
		ReleaseDate:      mp["Date"],
		DownloadLocation: url,
		Supplier:         supplier,
		CopyrightText:    copyrightText,
		LicenseDeclared:  NOASSERTION,
		LicenseConcluded: NOASSERTION,
		Checksums: []Checksum{
			{
				Algorithm: "SHA256",
				Value:     sha256,
			},
		},
		ExternalRefs: []ExternalRef{
			{
				Category: "PACKAGE-MANAGER",
				Locator:  fmt.Sprintf("pkg:deb/debian/%s@%s?arch=%s", mp["Package"], mp["Version"], mp["Architecture"]),
				Type:     "purl",
			},
		},
	}
	gen := Package{
		ID:               pkgId(generates),
		Name:             generates,
		LicenseDeclared:  NOASSERTION,
		LicenseConcluded: NOASSERTION,
		CopyrightText:    NOASSERTION,
		DownloadLocation: NONE,
		Description:      fmt.Sprintf("Generated from %s@%s", deb.Name, deb.Version),
	}
	doc := Document{
		ID: gen.ID,
		Packages: []Package{
			deb,
			gen,
		},
		Relationships: []Relationship{
			{
				Element: gen.ID,
				Type:    "GENERATED_FROM",
				Related: deb.ID,
			},
		},
	}
	b, err := json.Marshal(doc)
	if err != nil {
		panic(err)
	}
	os.WriteFile(output, b, 0644)
}

func bundle() {
	var label, output, contains string
	flag.StringVar(&output, "output", "", "")
	flag.StringVar(&label, "label", "", "")
	flag.StringVar(&contains, "contains", "", "")
	if err := flag.CommandLine.Parse(os.Args[2:]); err != nil {
		panic(err)
	}
	id := pkgId(label)
	doc := Document{
		ID:          "SPDXRef-DOCUMENT",
		Version:     "SPDX-2.3",
		Name:        label,
		DataLicense: "CC0-1.0",
		Namespace:   "http://spdx.org/spdxdocs/distroless/" + id,
		CreationInfo: CreationInfo{
			Created:  "1970-01-01T00:00:00Z",
			Creators: []string{"Organization: distroless"},
		},
		DocumentDescribes: []string{
			id,
		},
		Packages: []Package{
			{
				ID:               id,
				Name:             label,
				Version:          NOASSERTION,
				LicenseDeclared:  NOASSERTION,
				LicenseConcluded: NOASSERTION,
				DownloadLocation: NOASSERTION,
			},
		},
		Relationships: []Relationship{
			{
				Element: "SPDXRef-DOCUMENT",
				Type:    "DESCRIBES",
				Related: id,
			},
		},
	}
	spdxs := flag.Args()
	for _, p := range spdxs {
		bytes, err := os.ReadFile(p)
		if err != nil {
			panic(err)
		}
		subdoc := Document{}
		if json.Unmarshal(bytes, &subdoc) != nil {
			panic(err)
		}
		doc.Packages = append(doc.Packages, subdoc.Packages...)
		for _, rel := range subdoc.Relationships {
			if rel.Type == "DESCRIBES" && rel.Element == "SPDXRef-DOCUMENT" {
				continue
			}
			doc.Relationships = append(doc.Relationships, rel)
		}
		doc.Relationships = append(doc.Relationships, Relationship{
			Element: id,
			Type:    "DEPENDS_ON",
			Related: subdoc.ID,
		})
	}

	if contains != "" {
		bytes, err := os.ReadFile(contains)
		if err != nil {
			panic(err)
		}
		subdoc := Document{}
		if json.Unmarshal(bytes, &subdoc) != nil {
			panic(err)
		}
		doc.Packages = append(doc.Packages, subdoc.Packages...)
		for _, rel := range subdoc.Relationships {
			if rel.Type == "DESCRIBES" && rel.Element == "SPDXRef-DOCUMENT" {
				continue
			}
			doc.Relationships = append(doc.Relationships, rel)
		}
		doc.Relationships = append(doc.Relationships, Relationship{
			Element: id,
			Type:    "CONTAINS",
			Related: subdoc.DocumentDescribes[0],
		})
	}

	b, err := json.MarshalIndent(doc, "", "  ")
	if err != nil {
		panic(err)
	}
	os.WriteFile(output, b, 0644)
}

func main() {
	cmd := os.Args[1]
	switch cmd {
	case "generate":
		generateSpdx()
	case "bundle":
		bundle()
	default:
		panic(fmt.Errorf("uknown command. available commands: generate, bundle"))
	}
}

func dump(data interface{}) {
	b, _ := json.MarshalIndent(data, "", "  ")
	fmt.Print(string(b))
}

func pkgId(id string) string {
	id = strings.ReplaceAll(id, "/", "-slash-")
	id = strings.ReplaceAll(id, "_", "-underscore-")
	id = strings.ReplaceAll(id, "_", "-underscore-")
	id = strings.ReplaceAll(id, ":", "-colon-")
	id = strings.ReplaceAll(id, "@", "-at-")
	return fmt.Sprintf("SPDXRef-Package-%s", id)
}

// Below this is forked from here:
// https://github.com/kubernetes-sigs/bom/blob/main/pkg/spdx/json/v2.2.2/types.go

/*
Copyright 2022 The Kubernetes Authors.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

const (
	NOASSERTION = "NOASSERTION"
	NONE        = "NONE"
	Version     = "SPDX-2.3"
)

type Document struct {
	ID                   string                `json:"SPDXID"`
	Name                 string                `json:"name"`
	Version              string                `json:"spdxVersion"`
	CreationInfo         CreationInfo          `json:"creationInfo"`
	DataLicense          string                `json:"dataLicense"`
	Namespace            string                `json:"documentNamespace"`
	DocumentDescribes    []string              `json:"documentDescribes,omitempty"`
	Files                []File                `json:"files,omitempty"`
	Packages             []Package             `json:"packages,omitempty"`
	Relationships        []Relationship        `json:"relationships,omitempty"`
	ExternalDocumentRefs []ExternalDocumentRef `json:"externalDocumentRefs,omitempty"`
}

type CreationInfo struct {
	Created            string   `json:"created"` // Date
	Creators           []string `json:"creators,omitempty"`
	LicenseListVersion string   `json:"licenseListVersion,omitempty"`
}

type Package struct {
	ID                   string                   `json:"SPDXID"`
	Name                 string                   `json:"name"`
	Version              string                   `json:"versionInfo,omitempty"`
	FilesAnalyzed        bool                     `json:"filesAnalyzed"`
	LicenseDeclared      string                   `json:"licenseDeclared"`
	LicenseConcluded     string                   `json:"licenseConcluded"`
	Description          string                   `json:"description,omitempty"`
	Summary              string                   `json:"summary,omitempty"`
	DownloadLocation     string                   `json:"downloadLocation"`
	Originator           string                   `json:"originator,omitempty"`
	SourceInfo           string                   `json:"sourceInfo,omitempty"`
	CopyrightText        string                   `json:"copyrightText"`
	PrimaryPurpose       string                   `json:"primaryPackagePurpose,omitempty"`
	Supplier             string                   `json:"supplier,omitempty"`
	Homepage             string                   `json:"homepage,omitempty"`
	BuiltDate            string                   `json:"builtDate,omitempty"`
	ReleaseDate          string                   `json:"releaseDate,omitempty"`
	HasFiles             []string                 `json:"hasFiles,omitempty"`
	LicenseInfoFromFiles []string                 `json:"licenseInfoFromFiles,omitempty"`
	Checksums            []Checksum               `json:"checksums,omitempty"`
	ExternalRefs         []ExternalRef            `json:"externalRefs,omitempty"`
	VerificationCode     *PackageVerificationCode `json:"packageVerificationCode,omitempty"`
}

type PackageVerificationCode struct {
	Value         string   `json:"packageVerificationCodeValue"`
	ExcludedFiles []string `json:"packageVerificationCodeExcludedFiles,omitempty"`
}

type File struct {
	ID                string     `json:"SPDXID"`
	Name              string     `json:"fileName"`
	CopyrightText     string     `json:"copyrightText"`
	NoticeText        string     `json:"noticeText,omitempty"`
	LicenseConcluded  string     `json:"licenseConcluded"`
	Description       string     `json:"description,omitempty"`
	FileTypes         []string   `json:"fileTypes,omitempty"`
	LicenseInfoInFile []string   `json:"licenseInfoInFiles"` // List of licenses
	Checksums         []Checksum `json:"checksums"`
}

type Checksum struct {
	Algorithm string `json:"algorithm"`
	Value     string `json:"checksumValue"`
}

type ExternalRef struct {
	Category string `json:"referenceCategory"`
	Locator  string `json:"referenceLocator"`
	Type     string `json:"referenceType"`
}

type Relationship struct {
	Element string `json:"spdxElementId"`
	Type    string `json:"relationshipType"`
	Related string `json:"relatedSpdxElement"`
}

type ExternalDocumentRef struct {
	Checksum           Checksum `json:"checksum"`
	ExternalDocumentID string   `json:"externalDocumentId"`
	SPDXDocument       string   `json:"spdxDocument"`
}
