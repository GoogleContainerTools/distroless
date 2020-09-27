load("@package_bundle_amd64_debian9//file:packages.bzl", packages_amd64_debian9 = "packages")
load("@package_bundle_amd64_debian10//file:packages.bzl", packages_amd64_debian10 = "packages")

DISTRO_PACKAGES = {
    "_debian9": packages_amd64_debian9,
    "_debian10": packages_amd64_debian10,
}

DISTRO_SUFFIXES = ("_debian9", "_debian10")

DISTRO_REPOSITORY = {
    "_debian9": "@amd64_debian9",
    "_debian10": "@amd64_debian10",
}
