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

DISTROS = ["debian10", "debian11"]

DISTRO_PACKAGES = {
    "amd64": {
        "debian10": packages_amd64_debian10,
        "debian11": packages_amd64_debian11,
    },
    "arm": {
        "debian10": packages_arm_debian10,
        "debian11": packages_arm_debian11,
    },
    "arm64": {
        "debian10": packages_arm64_debian10,
        "debian11": packages_arm64_debian11,
    },
    "s390x": {
        "debian10": packages_s390x_debian10,
        "debian11": packages_s390x_debian11,
    },
    "ppc64le": {
        "debian10": packages_ppc64le_debian10,
        "debian11": packages_ppc64le_debian11,
    },
}

DISTRO_REPOSITORY = {
    "amd64": {
        "debian10": "@amd64_debian10",
        "debian11": "@amd64_debian11",
    },
    "arm": {
        "debian10": "@arm_debian10",
        "debian11": "@arm_debian11",
    },
    "arm64": {
        "debian10": "@arm64_debian10",
        "debian11": "@arm64_debian11",
    },
    "s390x": {
        "debian10": "@s390x_debian10",
        "debian11": "@s390x_debian11",
    },
    "ppc64le": {
        "debian10": "@ppc64le_debian10",
        "debian11": "@ppc64le_debian11",
    },
}
