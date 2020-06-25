#/bin/sh

set -o errexit
set -o xtrace

YEAR=`date +"%Y"`
MONTH=`date +"%m"`

# Fetch all the latest snapshot versions for the current month

DEBIAN_SNAPSHOT=`curl -s "https://snapshot.debian.org/archive/debian/?year=$YEAR;month=$MONTH" 2>&1 | grep -oE "[0-9]+T[0-9]+Z" | tail -n1`
DEBIAN_SECURITY_SNAPSHOT=`curl -s "https://snapshot.debian.org/archive/debian-security/?year=$YEAR;month=$MONTH" 2>&1 | grep -oE "[0-9]+T[0-9]+Z" | tail -n1`

# Fetch appropriate SHA256 sums

DEBIAN_STRETCH_SHA256=`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`
DEBIAN_STRETCH_BACKPORTS_SHA256=`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-backports/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`
DEBIAN_STRETCH_UPDATES_SHA256=`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-updates/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`
DEBIAN_STRETCH_SECURITY_SHA256=`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/stretch/updates/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`

DEBIAN_BUSTER_SHA256=`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`
DEBIAN_BUSTER_UPDATES_SHA256=`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster-updates/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`
DEBIAN_BUSTER_SECURITY_SHA256=`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/buster/updates/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`

# Patch workspace

sed -i 's/DEBIAN_SNAPSHOT = "[^"][^"]*"/DEBIAN_SNAPSHOT = "'$DEBIAN_SNAPSHOT'"/' ./WORKSPACE
sed -i 's/DEBIAN_SECURITY_SNAPSHOT = "[^"][^"]*"/DEBIAN_SECURITY_SNAPSHOT = "'$DEBIAN_SECURITY_SNAPSHOT'"/' ./WORKSPACE

sed -i 's/DEBIAN_STRETCH_SHA256 = "[^"][^"]*"/DEBIAN_STRETCH_SHA256 = "'$DEBIAN_STRETCH_SHA256'"/' ./WORKSPACE
sed -i 's/DEBIAN_STRETCH_BACKPORTS_SHA256 = "[^"][^"]*"/DEBIAN_STRETCH_BACKPORTS_SHA256 = "'$DEBIAN_STRETCH_BACKPORTS_SHA256'"/' ./WORKSPACE
sed -i 's/DEBIAN_STRETCH_UPDATES_SHA256 = "[^"][^"]*"/DEBIAN_STRETCH_UPDATES_SHA256 = "'$DEBIAN_STRETCH_UPDATES_SHA256'"/' ./WORKSPACE
sed -i 's/DEBIAN_STRETCH_SECURITY_SHA256 = "[^"][^"]*"/DEBIAN_STRETCH_SECURITY_SHA256 = "'$DEBIAN_STRETCH_SECURITY_SHA256'"/' ./WORKSPACE

sed -i 's/DEBIAN_BUSTER_SHA256 = "[^"][^"]*"/DEBIAN_BUSTER_SHA256 = "'$DEBIAN_BUSTER_SHA256'"/' ./WORKSPACE
sed -i 's/DEBIAN_BUSTER_UPDATES_SHA256 = "[^"][^"]*"/DEBIAN_BUSTER_UPDATES_SHA256 = "'$DEBIAN_BUSTER_UPDATES_SHA256'"/' ./WORKSPACE
sed -i 's/DEBIAN_BUSTER_SECURITY_SHA256 = "[^"][^"]*"/DEBIAN_BUSTER_SECURITY_SHA256 = "'$DEBIAN_BUSTER_SECURITY_SHA256'"/' ./WORKSPACE

# Rebuild package set

bazel clean
bazel build --host_force_python=PY2 //package_manager:dpkg_parser.par
bazel build --host_force_python=PY2 @package_bundle//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_debian10//file:packages.bzl

# Check if any of the version lock files are updated

if git diff-index --quiet HEAD package_bundle.versions; then
    echo "Changes detected to package_bundle.versions"
    exit 0
fi

if git diff-index --quiet HEAD package_bundle_debian10.versions; then
    echo "Changes detected to package_bundle_debian10.versions"
    exit 0
fi

# No version updates required, revert changes to WORKSPACE

echo "No changes detected to *.versions"
git checkout -- WORKSPACE
