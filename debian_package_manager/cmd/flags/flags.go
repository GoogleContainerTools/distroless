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

package flags

import "flag"

const (
	defaultVersionsFile  = "debian_versions.bzl"
	defaultArchivesFile  = "debian_archives.bzl"
	defaultSnapshotsFile = "debian_snapshots.yaml"
	defaultPackagesFile  = "debian_packages.yaml"
)

func Parse(versionsFile, archivesFile, snapshotsFile, packagesFile *string) {
	flag.StringVar(versionsFile, "versions-out", defaultVersionsFile, "location to generate bazel debian versions configs")
	flag.StringVar(archivesFile, "archives-out", defaultArchivesFile, "location to generate bazel deb archive repository config")
	flag.StringVar(snapshotsFile, "snapshots", defaultSnapshotsFile, "location of snapshots json config file (might be overwritten)")
	flag.StringVar(packagesFile, "packages", defaultPackagesFile, "location of packages json config file")
	flag.Parse()
}
