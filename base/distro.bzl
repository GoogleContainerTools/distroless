load("@package_bundle_amd64_debian9//file:packages.bzl", packages_amd64_debian9 = "packages")
load("@package_bundle_amd64_debian10//file:packages.bzl", packages_amd64_debian10 = "packages")
load("@package_bundle_arm64_debian9//file:packages.bzl", packages_arm64_debian9 = "packages")
load("@package_bundle_arm64_debian10//file:packages.bzl", packages_arm64_debian10 = "packages")
load("@package_bundle_s390x_debian9//file:packages.bzl", packages_s390x_debian9 = "packages")
load("@package_bundle_s390x_debian10//file:packages.bzl", packages_s390x_debian10 = "packages")

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
    "s390x": {
        "_debian9": packages_s390x_debian9,
        "_debian10": packages_s390x_debian10,
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
    "s390x": {
        "_debian9": "@s390x_debian9",
        "_debian10": "@s390x_debian10",
    },
}
