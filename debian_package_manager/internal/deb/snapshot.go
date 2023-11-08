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
	"strings"
	"time"

	"github.com/GoogleContainerTools/distroless/debian_package_manager/internal/build/config"
	"github.com/hashicorp/go-retryablehttp"
	"github.com/pkg/errors"
)

func LatestSnapshot() (*config.Snapshots, error) {
	snapshotURL := "https://snapshot.debian.org/archive/debian/?year=%d&month=%d"
	s, err := latest(snapshotURL, 2)
	if err != nil {
		return nil, errors.Wrap(err, "calculating latest snapshot")
	}

	securitySnapshotURL := "https://snapshot.debian.org/archive/debian-security/?year=%d&month=%d"
	ss, err := latest(securitySnapshotURL, 2)
	if err != nil {
		return nil, errors.Wrap(err, "calculating latest security snapshot")
	}

	return &config.Snapshots{
		Debian:   s,
		Security: ss,
	}, nil
}

var (
	reSnapshot     = regexp.MustCompile("[0-9]+T[0-9]+Z")
	dateFormat     = "20060102T150405Z0700"
	dateOnlyFormat = "20060102"
)

// Get the latest snapshot from (today - daysBack), sometimes
// the debian snapshots archive isn't fully realized at latest and
// results in errors
func latest(urltemplate string, daysBack int) (string, error) {
	targetDate := time.Now().AddDate(0, 0, -1*daysBack)
	year, month, _ := targetDate.Date()
	snapshots, err := findSnapshots(urltemplate, year, month)
	if err != nil {
		return "", err
	}
	// if no snapshots were found for a month, go back a month
	if len(snapshots) == 0 {
		year, month, _ := targetDate.AddDate(0, 0, -targetDate.Day()).Date()
		snapshots, err = findSnapshots(urltemplate, year, month)
		if err != nil {
			return "", err
		}
		if len(snapshots) == 0 {
			return "", errors.Errorf("No snapshots found")
		}
	}
	return findSnapshot(snapshots, targetDate)
}

func findSnapshots(urltemplate string, year int, month time.Month) ([][]byte, error) {
	snapshotURL := fmt.Sprintf(urltemplate, year, month)
	resp, err := retryablehttp.Get(snapshotURL)
	if err != nil {
		return nil, err
	}
	body := resp.Body
	defer body.Close()
	content, err := io.ReadAll(body)
	if err != nil {
		return nil, err
	}
	matches := reSnapshot.FindAll(content, -1)
	return matches, nil
}

// find a snapshot =< targetDate, snapshots is excepted to be a monotonically increasing list of dates
func findSnapshot(snapshots [][]byte, targetDate time.Time) (string, error) {
	for i := len(snapshots) - 1; i >= 0; i-- {
		snapshotDate := string(snapshots[i])
		if t, err := time.Parse(dateFormat, snapshotDate); err != nil {
			return "", errors.Errorf("Could not parse snapshot date %v", snapshotDate)
		} else {
			targetDatePrefix := targetDate.Format(dateOnlyFormat)
			// check if the prefix matches (same day) or if its earlier (no snapshots were found for targetDate)
			if strings.HasPrefix(snapshotDate, targetDatePrefix) || t.Before(targetDate) {
				return snapshotDate, nil
			}
		}
	}
	// I don't think we should be here, but we could just pick the earliest snapshot we found even if it is later
	// than the target date
	return string(snapshots[0]), nil
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
