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
	Channel    string // main, security,etc
	Release    string // buster, bullseye, etc
	Arch       string // amd64, arm64, etc
	PackagesXZ string // url of Packages.xz
	InRelease  string // url of InRelease (gpg signed release info)
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

// secRelease is the name in the url (ex: bullseye -> bullseye-security)
func security(release, secRelease, arch string) PackageIndex {
	return PackageIndex{
		Channel:    "security",
		Release:    release,
		Arch:       arch,
		PackagesXZ: fmt.Sprintf("https://security.debian.org/dists/%s/updates/main/binary-%s/Packages.xz", secRelease, arch),
		InRelease:  fmt.Sprintf("https://security.debian.org/dists/%s/updates/InRelease", secRelease),
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
			urls[i+2] = security(release, sec, arch)
			i += 3
		}
	}
	return urls
}

// PackageNames converts packages from a map[string:list] to a map[string:set]
func PackageNames() map[string]map[string]bool {
	return packageNames(packages)
}

// internal for testing
func packageNames(pkgMap map[string][]string) map[string]map[string]bool {
	all := map[string]map[string]bool{}
	for rel, relPkgs := range pkgMap {
		set := make(map[string]bool, len(relPkgs))
		for _, pkg := range relPkgs {
			set[pkg] = true
		}
		all[rel] = set
	}
	return all
}
