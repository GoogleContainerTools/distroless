load("@package_bundle_amd64_debian10//file:packages.bzl", packages_amd64_debian10 = "packages")
load("@package_bundle_arm_debian10//file:packages.bzl", packages_arm_debian10 = "packages")
load("@package_bundle_arm64_debian10//file:packages.bzl", packages_arm64_debian10 = "packages")
load("@package_bundle_s390x_debian10//file:packages.bzl", packages_s390x_debian10 = "packages")
load("@package_bundle_ppc64le_debian10//file:packages.bzl", packages_ppc64le_debian10 = "packages")
load("@package_bundle_amd64_debian11//file:packages.bzl", packages_amd64_debian11 = "packages")
load("@package_bundle_arm_debian11//file:packages.bzl", packages_arm_debian11 = "packages")
load("@package_bundle_arm64_debian11//file:packages.bzl", packages_arm64_debian11 = "packages")
load("@package_bundle_s390x_debian11//file:packages.bzl", packages_s390x_debian11 = "packages")
load("@package_bundle_ppc64le_debian11//file:packages.bzl", packages_ppc64le_debian11 = "packages")

# debian11 is manually added to the list of distro suffixes in base/BUILD
# update this when debian11 is available for all images
DISTRO_SUFFIXES = ["_debian10"]

DISTRO_PACKAGES = {
    "amd64": {
        "_debian10": packages_amd64_debian10,
        "_debian11": packages_amd64_debian11,
    },
    "arm": {
        "_debian10": packages_arm_debian10,
        "_debian11": packages_arm_debian11,
    },
    "arm64": {
        "_debian10": packages_arm64_debian10,
        "_debian11": packages_arm64_debian11,
    },
    "s390x": {
        "_debian10": packages_s390x_debian10,
        "_debian11": packages_s390x_debian11,
    },
    "ppc64le": {
        "_debian10": packages_ppc64le_debian10,
        "_debian11": packages_ppc64le_debian11,
    },
}

DISTRO_REPOSITORY = {
    "amd64": {
        "_debian10": "@amd64_debian10",
        "_debian11": "@amd64_debian11",
    },
    "arm": {
        "_debian10": "@arm_debian10",
        "_debian11": "@arm_debian11",
    },
    "arm64": {
        "_debian10": "@arm64_debian10",
        "_debian11": "@arm64_debian11",
    },
    "s390x": {
        "_debian10": "@s390x_debian10",
        "_debian11": "@s390x_debian11",
    },
    "ppc64le": {
        "_debian10": "@ppc64le_debian10",
        "_debian11": "@ppc64le_debian11",
    },
}
