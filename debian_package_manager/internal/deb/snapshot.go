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
	"fmt"
	"io"
	"regexp"
	"time"

	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/build/config"
	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/rhttp"
	"github.com/pkg/errors"
)

func LatestSnapshot() (*config.Snapshots, error) {
	snapshotURL := "https://snapshot.debian.org/archive/debian/?year=%d&month=%d"
	s, err := latest(snapshotURL)
	if err != nil {
		return nil, errors.Wrap(err, "calculating latest snapshot")
	}

	securitySnapshotURL := "https://snapshot.debian.org/archive/debian-security/?year=%d&month=%d"
	ss, err := latest(securitySnapshotURL)
	if err != nil {
		return nil, errors.Wrap(err, "calculating latest security snapshot")
	}

	return &config.Snapshots{
		Debian:   s,
		Security: ss,
	}, nil
}

var (
	reSnapshot = regexp.MustCompile("[0-9]+T[0-9]+Z")
)

// get latest-1 if possible or latest if only one snapshot is available for the month
// sometimes the debian snapshots archive isn't fully realized at latest and results
// in errors
func latest(urltemplate string) (string, error) {
	year, month, _ := time.Now().Date()
	snapshotURL := fmt.Sprintf(urltemplate, year, month)
	resp, err := rhttp.Get(snapshotURL)
	if err != nil {
		return "", err
	}
	body := resp.Body
	defer body.Close()
	content, err := io.ReadAll(body)
	if err != nil {
		return "", err
	}
	matches := reSnapshot.FindAll(content, -1)
	if len(matches) == 0 {
		return "", errors.Errorf("No snapshots found at %q", snapshotURL)
	} else if len(matches) == 1 {
		return string(matches[0]), nil
	} else {
		return string(matches[len(matches)-2]), nil
	}
}

func Main(snapshot string, arch config.Arch, distro config.Distro) *PackageIndex {
	return &PackageIndex{
		URL:      fmt.Sprintf("https://snapshot.debian.org/archive/debian/%s/dists/%s/main/binary-%s/Packages.xz", snapshot, distro.Codename(), arch.DebianName()),
		PoolRoot: fmt.Sprintf("https://snapshot.debian.org/archive/debian/%s/", snapshot),
		Snapshot: snapshot,
		Distro:   distro,
		Arch:     arch,
		Channel:  "main",
	}
}

func Updates(snapshot string, arch config.Arch, distro config.Distro) *PackageIndex {
	return &PackageIndex{
		URL:      fmt.Sprintf("https://snapshot.debian.org/archive/debian/%s/dists/%s-updates/main/binary-%s/Packages.xz", snapshot, distro.Codename(), arch.DebianName()),
		PoolRoot: fmt.Sprintf("https://snapshot.debian.org/archive/debian/%s/", snapshot),
		Snapshot: snapshot,
		Distro:   distro,
		Arch:     arch,
		Channel:  "updates",
	}
}

func Security(snapshot string, arch config.Arch, distro config.Distro) *PackageIndex {
	packageURL := fmt.Sprintf("https://snapshot.debian.org/archive/debian-security/%s/dists/%s-security/main/binary-%s/Packages.xz", snapshot, distro.Codename(), arch.DebianName())
	if distro == config.DEBIAN10 { // the url changed after debian10
		packageURL = fmt.Sprintf("https://snapshot.debian.org/archive/debian-security/%s/dists/%s/updates/main/binary-%s/Packages.xz", snapshot, distro.Codename(), arch.DebianName())
	}
	return &PackageIndex{
		URL:      packageURL,
		PoolRoot: fmt.Sprintf("https://snapshot.debian.org/archive/debian-security/%s/", snapshot),
		Snapshot: snapshot,
		Distro:   distro,
		Arch:     arch,
		Channel:  "security",
	}
}
