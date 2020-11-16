#/bin/sh

set -o errexit
set -o xtrace

cp checksums.bzl checksums.bzl~
cp package_bundle_amd64_debian9.versions package_bundle_amd64_debian9.versions~
cp package_bundle_amd64_debian10.versions package_bundle_amd64_debian10.versions~
cp package_bundle_arm_debian9.versions package_bundle_arm_debian9.versions~
cp package_bundle_arm_debian10.versions package_bundle_arm_debian10.versions~
cp package_bundle_arm64_debian9.versions package_bundle_arm64_debian9.versions~
cp package_bundle_arm64_debian10.versions package_bundle_arm64_debian10.versions~
cp package_bundle_s390x_debian9.versions package_bundle_s390x_debian9.versions~
cp package_bundle_s390x_debian10.versions package_bundle_s390x_debian10.versions~
cp package_bundle_ppc64le_debian9.versions package_bundle_ppc64le_debian9.versions~
cp package_bundle_ppc64le_debian10.versions package_bundle_ppc64le_debian10.versions~

YEAR=`date +"%Y"`
MONTH=`date +"%m"`

# Fetch all the latest snapshot versions for the current month

DEBIAN_SNAPSHOT=`curl -s "https://snapshot.debian.org/archive/debian/?year=$YEAR;month=$MONTH" 2>&1 | grep -oE "[0-9]+T[0-9]+Z" | tail -n1`
DEBIAN_SECURITY_SNAPSHOT=`curl -s "https://snapshot.debian.org/archive/debian-security/?year=$YEAR;month=$MONTH" 2>&1 | grep -oE "[0-9]+T[0-9]+Z" | tail -n1`

if [ -z "$DEBIAN_SNAPSHOT" ]
then
    echo "No debian snapshot version found"; 
    exit 0
fi

if [ -z "$DEBIAN_SECURITY_SNAPSHOT" ]
then
    echo "No debian security snapshot version found"; 
    exit 0
fi

cat > checksums.bzl <<EOF
# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

BASE_ARCHITECTURES = ["amd64", "arm64"]

# Exceptions:
# - s390x doesn't have libunwind8.
#   https://github.com/GoogleContainerTools/distroless/pull/612#issue-500157699
# - ppc64le doesn't have stretch security-channel.
#   https://github.com/GoogleContainerTools/distroless/pull/637#issuecomment-728139611
# - arm needs someone with available hardware to generate:
#   //experimental/python2.7/ld.so.arm.cache
ARCHITECTURES = BASE_ARCHITECTURES + ["arm", "s390x", "ppc64le"]

VERSIONS = [
    ("debian9", "stretch"),
    ("debian10", "buster"),
]

DEBIAN_SNAPSHOT = "$DEBIAN_SNAPSHOT"

DEBIAN_SECURITY_SNAPSHOT = "$DEBIAN_SECURITY_SNAPSHOT"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "backports": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-backports/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-updates/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "security": "`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/stretch/updates/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
        "debian10": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster-updates/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "security": "`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/buster/updates/main/binary-amd64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
    },
    "arm": {
        "debian9": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch/main/binary-armhf/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "backports": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-backports/main/binary-armhf/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-updates/main/binary-armhf/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "security": "`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/stretch/updates/main/binary-armhf/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
        "debian10": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster/main/binary-armhf/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster-updates/main/binary-armhf/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "security": "`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/buster/updates/main/binary-armhf/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
    },
    "arm64": {
        "debian9": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch/main/binary-arm64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "backports": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-backports/main/binary-arm64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-updates/main/binary-arm64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "security": "`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/stretch/updates/main/binary-arm64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
        "debian10": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster/main/binary-arm64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster-updates/main/binary-arm64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "security": "`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/buster/updates/main/binary-arm64/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
    },
    "s390x": {
        "debian9": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch/main/binary-s390x/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "backports": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-backports/main/binary-s390x/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-updates/main/binary-s390x/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
        "debian10": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster/main/binary-s390x/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster-updates/main/binary-s390x/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "security": "`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/buster/updates/main/binary-s390x/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
    },
    "ppc64le": {
        "debian9": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch/main/binary-ppc64el/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "backports": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-backports/main/binary-ppc64el/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/stretch-updates/main/binary-ppc64el/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
        "debian10": {
            "main": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster/main/binary-ppc64el/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "updates": "`curl -s https://snapshot.debian.org/archive/debian/$DEBIAN_SNAPSHOT/dists/buster-updates/main/binary-ppc64el/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
            "security": "`curl -s https://snapshot.debian.org/archive/debian-security/$DEBIAN_SECURITY_SNAPSHOT/dists/buster/updates/main/binary-ppc64el/Packages.gz 2>&1 | sha256sum | cut -d " " -f 1`",
        },
    },
}
EOF

# Rebuild package set

bazel clean
bazel build --host_force_python=PY2 //package_manager:dpkg_parser.par
bazel build --host_force_python=PY2 @package_bundle_amd64_debian9//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_amd64_debian10//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_arm_debian9//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_arm_debian10//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_arm64_debian9//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_arm64_debian10//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_s390x_debian9//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_s390x_debian10//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_ppc64le_debian9//file:packages.bzl
bazel build --host_force_python=PY2 @package_bundle_ppc64le_debian10//file:packages.bzl

# Check if any of the version lock files are updated

if diff -w package_bundle_amd64_debian9.versions package_bundle_amd64_debian9.versions~ &&
	diff -w package_bundle_amd64_debian10.versions package_bundle_amd64_debian10.versions~ &&
	diff -w package_bundle_arm_debian9.versions package_bundle_arm_debian9.versions~ &&
	diff -w package_bundle_arm_debian10.versions package_bundle_arm_debian10.versions~ &&
	diff -w package_bundle_arm64_debian9.versions package_bundle_arm64_debian9.versions~ &&
	diff -w package_bundle_arm64_debian10.versions package_bundle_arm64_debian10.versions~ &&
	diff -w package_bundle_s390x_debian9.versions package_bundle_s390x_debian9.versions~ &&
	diff -w package_bundle_s390x_debian10.versions package_bundle_s390x_debian10.versions~ &&
	diff -w package_bundle_ppc64le_debian9.versions package_bundle_ppc64le_debian9.versions~ &&
	diff -w package_bundle_ppc64le_debian10.versions package_bundle_ppc64le_debian10.versions~; then
    echo "No changes detected to package_bundle versions."
    mv checksums.bzl~ checksums.bzl
    mv package_bundle_amd64_debian9.versions~ package_bundle_amd64_debian9.versions
    mv package_bundle_amd64_debian10.versions~ package_bundle_amd64_debian10.versions
    mv package_bundle_arm_debian9.versions~ package_bundle_arm_debian9.versions
    mv package_bundle_arm_debian10.versions~ package_bundle_arm_debian10.versions
    mv package_bundle_arm64_debian9.versions~ package_bundle_arm64_debian9.versions
    mv package_bundle_arm64_debian10.versions~ package_bundle_arm64_debian10.versions
    mv package_bundle_s390x_debian9.versions~ package_bundle_s390x_debian9.versions
    mv package_bundle_s390x_debian10.versions~ package_bundle_s390x_debian10.versions
    mv package_bundle_ppc64le_debian9.versions~ package_bundle_ppc64le_debian9.versions
    mv package_bundle_ppc64le_debian10.versions~ package_bundle_ppc64le_debian10.versions
else
    echo "Changes detected to package_bundle version files. Please update snapshots."
    rm *~
fi
