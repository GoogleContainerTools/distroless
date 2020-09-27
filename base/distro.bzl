load("@package_bundle_amd64_debian9//file:packages.bzl", "packages")
load("@package_bundle_amd64_debian10//file:packages.bzl", packages_debian10 = "packages")

DISTRO_PACKAGES = {
    "_debian9": packages,
    "_debian10": packages_debian10,
}

DISTRO_SUFFIXES = ("_debian9", "_debian10")

DISTRO_REPOSITORY = {
    "_debian9": "@debian9",
    "_debian10": "@debian10",
}
