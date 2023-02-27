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

package build

import (
	"fmt"
	"io"
	"os"
	"path/filepath"
	"regexp"
	"strings"
	"text/template"

	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/deb"
)

var archivesTemplate = `# AUTO GENERATED
load("@distroless//private/remote:debian_archive.bzl", "debian_archive")

def repositories():
{{- range $arch,$dm := . }}{{ range $distro,$pm := $dm }}{{ range $pn,$pi := $pm }}
    debian_archive(
        name = "{{ printf "%s_%s_" $arch $distro }}{{ bazelify $pi.Name }}",
        package_name = "{{ $pi.Name }}",
        sha256 = "{{ $pi.SHA256 }}",
        urls = ["{{ $pi.URL }}"],
    )
{{- end }}{{ end }}{{ end }}
`

var versionsTemplate = `# AUTO GENERATED
DEBIAN_PACKAGE_VERSIONS = {
{{- range $arch,$dm := . }}
    {{ printf "%q: {" $arch }}
	{{- range $distro,$pm := $dm }}
        {{ printf "%q: {" $distro }}
		{{- range $pn,$pi := $pm }}{{ $n := bazelify $pn }}
            {{ printf "%q: %q," $n $pi.Version.String }}
		{{- end }}
        {{ printf "}," }}
	{{- end }}
    {{ printf "}," }}
{{- end }}
{{ printf "}" }}
`

// replacement of characters not allowed in the bazel's naming schemes
var replacementMap = map[string]string{"+": "p"}
var nameRegex = regexp.MustCompile("^[A-Za-z0-9._-]+$")

func writeArchivesBzl(target string, pkgInfo map[string]map[string]map[string]*deb.Package) error {
	f, err := os.OpenFile(target, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0644)
	if err != nil {
		return err
	}
	defer f.Close()
	if err := writeArchivesBzl2(f, pkgInfo); err != nil {
		return err
	}
	return f.Sync()
}
func writeArchivesBzl2(w io.Writer, pkgInfo map[string]map[string]map[string]*deb.Package) error {
	converted := map[string]string{}
	t := template.New("t")
	t.Funcs(template.FuncMap{
		"filename": filepath.Base,
		"bazelify": func(in string) string {
			out := bazelify(in)
			if out != in {
				converted[in] = out
			}
			return out
		},
	})
	t, err := t.Parse(archivesTemplate)
	if err != nil {
		panic(err)
	}
	return t.ExecuteTemplate(w, "t", pkgInfo)
}

func writeVersionsBzl(target string, pkgInfo map[string]map[string]map[string]*deb.Package) error {
	f, err := os.OpenFile(target, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0644)
	if err != nil {
		return err
	}
	defer f.Close()
	if err := writeVersionsBzl2(f, pkgInfo); err != nil {
		return err
	}
	return f.Sync()
}
func writeVersionsBzl2(w io.Writer, pkgInfo map[string]map[string]map[string]*deb.Package) error {
	t := template.New("t")
	t.Funcs(template.FuncMap{
		"filename": filepath.Base,
		"bazelify": bazelify,
	})
	t, err := t.Parse(versionsTemplate)
	if err != nil {
		panic(err)
	}
	return t.ExecuteTemplate(w, "t", pkgInfo)
}

func bazelify(name string) string {
	converted := name
	if !nameRegex.MatchString(name) {
		for o, n := range replacementMap {
			converted = strings.Replace(converted, o, n, -1)
		}
		return converted
	}
	if !nameRegex.MatchString(converted) {
		panic(fmt.Sprintf("invalid name and no replacement directive: %q -> %q ->", name, converted))
	}
	return name
}
