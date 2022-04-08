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

package deb

import (
	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/build/config"
)

func PackageIndexGroup(snapshots *config.Snapshots, arch config.Arch, distro config.Distro) []*PackageIndex {
	phpArchitectures := [2]string{"amd64", "arm64"}
	for _, phpArchitecture := range phpArchitectures {
		if phpArchitecture == arch.DebianName() {
			return []*PackageIndex{
				Main(snapshots.Debian, arch, distro),
				Updates(snapshots.Debian, arch, distro),
				Security(snapshots.Security, arch, distro),
				Sury(arch, distro),
			}
		}
	}

	return []*PackageIndex{
		Main(snapshots.Debian, arch, distro),
		Updates(snapshots.Debian, arch, distro),
		Security(snapshots.Security, arch, distro),
	}
}

type PackageIndex struct {
	URL      string
	PoolRoot string
	Snapshot string
	Distro   config.Distro
	Arch     config.Arch
}
