//
// Copyright 2021 Google LLC
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

package dpkg

// release name and security subpath (which changed between buster and bullseye)
var releases = map[string]string{
	"buster":   "buster",
	"bullseye": "bullseye-security",
}

// architectures to support
var archs = []string{
	"amd64",
	"arm64",
	"armhf",
	"s390x",
	"ppc64el",
}

// alphabetical order of packages to cache, grouped by debian release
var packages = map[string][]string{
	"buster": {
		"base-files",
		"ca-certificates",
		"dash",
		"fontconfig-config",
		"fonts-dejavu-core",
		"libbz2-1.0",
		"libc-bin",
		"libc6",
		"libdb5.3",
		"libexpat1",
		"libffi6",
		"libfontconfig1",
		"libfreetype6",
		"libgcc1",
		"libglib2.0-0",
		"libgomp1",
		"libgraphite2-3",
		"libharfbuzz0b",
		"libjpeg62-turbo",
		"liblcms2-2",
		"liblzma5",
		"libmpdec2",
		"libncursesw6",
		"libpcre3",
		"libpng16-16",
		"libpython2.7-minimal",
		"libpython2.7-stdlib",
		"libpython3.7-minimal",
		"libpython3.7-stdlib",
		"libreadline7",
		"libsqlite3-0",
		"libssl1.1",
		"libstdc++6",
		"libtinfo6",
		"libunwind8",
		"libuuid1",
		"mime-support",
		"netbase",
		"openjdk-11-jdk-headless",
		"openjdk-11-jre-headless",
		"openssl",
		"python2.7-minimal",
		"python3-distutils",
		"python3.7-minimal",
		"readline-common",
		"tzdata",
		"zlib1g",
	},
	"bullseye": {
		"base-files",
		"ca-certificates",
		"libc6",
		"libssl1.1",
		"netbase",
		"openssl",
		"tzdata",
	},
}
