#/bin/sh

set -o errexit
set -o xtrace

cp WORKSPACE WORKSPACE~
cp packages_amd64_debian9.bzl packages_amd64_debian9.bzl~
cp packages_amd64_debian10.bzl packages_amd64_debian10.bzl~
cp packages_arm64_debian9.bzl packages_arm64_debian9.bzl~
cp packages_arm64_debian10.bzl packages_arm64_debian10.bzl~

# Rebuild package set

bazel run update_deb_packages

# Check if any of the version lock files are updated

if diff -w WORKSPACE WORKSPACE~ &&
    diff -w packages_amd64_debian9.bzl packages_amd64_debian9.bzl~ &&
	diff -w packages_amd64_debian10.bzl packages_amd64_debian10.bzl~ &&
	diff -w packages_arm64_debian9.bzl packages_arm64_debian9.bzl~ &&
	diff -w packages_arm64_debian10.bzl packages_arm64_debian10.bzl~; then
    echo "No changes detected to package_bundle versions."
    mv WORKSPACE~ WORKSPACE
    mv packages_amd64_debian9.bzl~ packages_amd64_debian9.bzl
    mv packages_amd64_debian10.bzl~ packages_amd64_debian10.bzl
    mv packages_arm64_debian9.bzl~ packages_arm64_debian9.bzl
    mv packages_arm64_debian10.bzl~ packages_arm64_debian10.bzl
else
    echo "Changes detected to package_bundle version files. Please update snapshots."
    rm *~
fi
