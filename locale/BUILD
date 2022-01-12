package(default_visibility = ["//:__subpackages__"])

load("//base:distro.bzl", "DISTROS", "DISTRO_PACKAGES")
load("//:checksums.bzl", "ARCHITECTURES")
load(":locale.bzl", "locale")

[
    locale(
        name = "locale_" + arch + "_" + distro,
        deb = DISTRO_PACKAGES[arch][distro]["libc-bin"],
    )
    for arch in ARCHITECTURES
    for distro in DISTROS
]
