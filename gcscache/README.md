# Distroless Debian Cache on GCS

- Remove our dependency on `snapshots.debian.org`
- Create a daily snapshot of just the packages we want from 
  - https://deb.debian.org/debian (updates and main)
  - https://security.debian.org/debian-security
- This is not a generic cache/mirror for debian, please do not ask to use it that way.

## How is the cache organized

The cache has 2 top level directories: `files` and `indexes`.

#### `files`
contains `.deb` files with their path defined in `Packages.xz`. For example an `openjdk11` deb might live at `https://storage.googleapis.com/distroless-debian-cache/files/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.11+9-1~deb10u1_amd64.deb`

#### `indexes` 
contains all `Packages.xz` organized by version, architecture, channel and sha256 hash of the packge index. For example you could find a package index for buster updates on amd64 at `https://storage.googleapis.com/distroless-debian-cache/indexes/buster-updates-amd64/24a6fcccd67c461bd38b093bbcd3742cdde7a9b4cfa1687f6b442f62cc42d216/Packages.xz`. In addition to the `Packages.xz` file, each permutation will contain a `latest` file pointing to the last `Packages.xz` uploaded like `https://storage.googleapis.com/distroless-debian-cache/indexes/buster-updates-amd64/latest`

## What package indexes are copied

A filtered view (only referencing packages used in distroless) of the `Packages.xz` *(not gz)* for the versions, architectures and channels defined in [internal/dpkg/info.go](internal/dpkg/info.go) and the channels `main`, `updates` and `security` as seen in [internal/dpkg/package_index.go](internal/dpkg/package_index.go)

## What packages are copied

Only debs used by distroless will be copied. This is not a generic cache/mirror for debian, please do not ask to use it that way.
[internal/dpkg/info.go](internal/dpkg/info.go)

## How are these kept in sync with distroless config

These are not currently kept in sync.

TODO: 
An action/check should be written to ensure all packages defined in WORKSPACE are also in internal/dpkg/info.go. When a PR goes up to modify WORKSPACE, it should verify the new file is cached first.

## How are these used with `dpkg_src`

`dpkg_src` rules can be written by referencing the cache's public files directly.
```
dpkg_src(
  name = "distroless-deb-cache",
  package_prefix = "https://storage.googleapis.com/distroless-debian-cache/files/",
  packages_url = "https://storage.googleapis.com/distroless-debian-cache/indexes/buster-updates-amd64/24a6fcccd67c461bd38b093bbcd3742cdde7a9b4cfa1687f6b442f62cc42d216/Packages.xz"
  sha256 = 24a6fcccd67c461bd38b093bbcd3742cdde7a9b4cfa1687f6b442f62cc42d216,
)
```
