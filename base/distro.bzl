load("@packages_amd64_debian9//debs:deb_packages.bzl", "packages_amd64_debian9")
load("@packages_arm64_debian9//debs:deb_packages.bzl", "packages_arm64_debian9")
load("@packages_amd64_debian10//debs:deb_packages.bzl", "packages_amd64_debian10")
load("@packages_arm64_debian10//debs:deb_packages.bzl", "packages_arm64_debian10")
load("@packages_amd64_debian9//debs:deb_upstream_versions.bzl", "packages_amd64_debian9_upstream_versions")
load("@packages_arm64_debian9//debs:deb_upstream_versions.bzl", "packages_arm64_debian9_upstream_versions")
load("@packages_amd64_debian10//debs:deb_upstream_versions.bzl", "packages_amd64_debian10_upstream_versions")
load("@packages_arm64_debian10//debs:deb_upstream_versions.bzl", "packages_arm64_debian10_upstream_versions")

ARCHITECTURES = ["amd64", "arm64"]

DISTRO_SUFFIXES = ("_debian9", "_debian10")

DISTRO_PACKAGES = {
    "amd64": {
        "_debian9": packages_amd64_debian9,
        "_debian10": packages_amd64_debian10,
    },
    "arm64": {
        "_debian9": packages_arm64_debian9,
        "_debian10": packages_arm64_debian10,
    },
}

DISTRO_VERSIONS = {
    "amd64": {
        "_debian9": packages_amd64_debian9_upstream_versions,
        "_debian10": packages_amd64_debian10_upstream_versions,
    },
    "arm64": {
        "_debian9": packages_arm64_debian9_upstream_versions,
        "_debian10": packages_arm64_debian10_upstream_versions,
    },
}
