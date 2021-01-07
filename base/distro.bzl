load("@package_bundle_amd64_debian9//file:packages.bzl", packages_amd64_debian9 = "packages", versions_amd64_debian9 = "versions")
load("@package_bundle_amd64_debian10//file:packages.bzl", packages_amd64_debian10 = "packages", versions_amd64_debian10 = "versions")
load("@package_bundle_arm_debian9//file:packages.bzl", packages_arm_debian9 = "packages", versions_arm_debian9 = "versions")
load("@package_bundle_arm_debian10//file:packages.bzl", packages_arm_debian10 = "packages", versions_arm_debian10 = "versions")
load("@package_bundle_arm64_debian9//file:packages.bzl", packages_arm64_debian9 = "packages", versions_arm64_debian9 = "versions")
load("@package_bundle_arm64_debian10//file:packages.bzl", packages_arm64_debian10 = "packages", versions_arm64_debian10 = "versions")
load("@package_bundle_s390x_debian9//file:packages.bzl", packages_s390x_debian9 = "packages", versions_s390x_debian9 = "versions")
load("@package_bundle_s390x_debian10//file:packages.bzl", packages_s390x_debian10 = "packages", versions_s390x_debian10 = "versions")
load("@package_bundle_ppc64le_debian9//file:packages.bzl", packages_ppc64le_debian9 = "packages", versions_ppc64le_debian9 = "versions")
load("@package_bundle_ppc64le_debian10//file:packages.bzl", packages_ppc64le_debian10 = "packages", versions_ppc64le_debian10 = "versions")

DISTRO_SUFFIXES = ("_debian9", "_debian10")

DISTRO_PACKAGES = {
    "amd64": {
        "_debian9": packages_amd64_debian9,
        "_debian10": packages_amd64_debian10,
    },
    "arm": {
        "_debian9": packages_arm_debian9,
        "_debian10": packages_arm_debian10,
    },
    "arm64": {
        "_debian9": packages_arm64_debian9,
        "_debian10": packages_arm64_debian10,
    },
    "s390x": {
        "_debian9": packages_s390x_debian9,
        "_debian10": packages_s390x_debian10,
    },
    "ppc64le": {
        "_debian9": packages_ppc64le_debian9,
        "_debian10": packages_ppc64le_debian10,
    },
}

DISTRO_VERSIONS = {
    "amd64": {
        "_debian9": versions_amd64_debian9,
        "_debian10": versions_amd64_debian10,
    },
    "arm": {
        "_debian9": versions_arm_debian9,
        "_debian10": versions_arm_debian10,
    },
    "arm64": {
        "_debian9": versions_arm64_debian9,
        "_debian10": versions_arm64_debian10,
    },
    "s390x": {
        "_debian9": versions_s390x_debian9,
        "_debian10": versions_s390x_debian10,
    },
    "ppc64le": {
        "_debian9": versions_ppc64le_debian9,
        "_debian10": versions_ppc64le_debian10,
    },
}

DISTRO_REPOSITORY = {
    "amd64": {
        "_debian9": "@amd64_debian9",
        "_debian10": "@amd64_debian10",
    },
    "arm": {
        "_debian9": "@arm_debian9",
        "_debian10": "@arm_debian10",
    },
    "arm64": {
        "_debian9": "@arm64_debian9",
        "_debian10": "@arm64_debian10",
    },
    "s390x": {
        "_debian9": "@s390x_debian9",
        "_debian10": "@s390x_debian10",
    },
    "ppc64le": {
        "_debian9": "@ppc64le_debian9",
        "_debian10": "@ppc64le_debian10",
    },
}
