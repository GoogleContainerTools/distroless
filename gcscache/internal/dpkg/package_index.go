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

import "fmt"

type PackageIndex struct {
	Channel    string // main,security,etc
	Release    string // buster, bullseye, etc
	Arch       string // amd64, arm64, etc
	PackagesXZ string // url of packages.xz
	InRelease  string // gpg signed release info
	PoolParent string // url to the "pool" for example "https://deb.debian.org/debian/" which contains a pool directory
}

func main(release, arch string) PackageIndex {
	return PackageIndex{
		Channel:    "main",
		Release:    release,
		Arch:       arch,
		PackagesXZ: fmt.Sprintf("https://deb.debian.org/debian/dists/%s/main/binary-%s/Packages.xz", release, arch),
		InRelease:  fmt.Sprintf("https://deb.debian.org/debian/dists/%s/InRelease", release),
		PoolParent: "https://deb.debian.org/debian/",
	}
}

func updates(release, arch string) PackageIndex {
	return PackageIndex{
		Channel:    "updates",
		Release:    release,
		Arch:       arch,
		PackagesXZ: fmt.Sprintf("https://deb.debian.org/debian/dists/%s-updates/main/binary-%s/Packages.xz", release, arch),
		InRelease:  fmt.Sprintf("https://deb.debian.org/debian/dists/%s-updates/InRelease", release),
		PoolParent: "https://deb.debian.org/debian/",
	}
}

func security(release, arch string) PackageIndex {
	return PackageIndex{
		Channel:    "security",
		Release:    release,
		Arch:       arch,
		PackagesXZ: fmt.Sprintf("https://security.debian.org/dists/%s/updates/main/binary-%s/Packages.xz", release, arch),
		InRelease:  fmt.Sprintf("https://security.debian.org/dists/%s/updates/InRelease", release),
		PoolParent: "https://security.debian.org/debian-security/",
	}
}

func PackageIndexes() []PackageIndex {
	urls := make([]PackageIndex, 3*len(releases)*len(archs))
	i := 0
	for release, sec := range releases {
		for _, arch := range archs {
			urls[i] = main(release, arch)
			urls[i+1] = updates(release, arch)
			urls[i+2] = security(sec, arch)
			i += 3
		}
	}
	return urls
}

func PackageNames() map[string]bool {
	set := make(map[string]bool, len(packages))
	for _, pkg := range packages {
		set[pkg] = true
	}
	return set
}
