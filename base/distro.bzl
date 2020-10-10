load("@packages_amd64_debian9//debs:deb_packages.bzl", "packages_amd64_debian9")
load("@packages_arm64_debian9//debs:deb_packages.bzl", "packages_arm64_debian9")
load("@packages_amd64_debian10//debs:deb_packages.bzl", "packages_amd64_debian10")
load("@packages_arm64_debian10//debs:deb_packages.bzl", "packages_arm64_debian10")

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

DISTRO_REPOSITORY = {
    "amd64": {
        "_debian9": "@amd64_debian9",
        "_debian10": "@amd64_debian10",
    },
    "arm64": {
        "_debian9": "@arm64_debian9",
        "_debian10": "@arm64_debian10",
    },
}
