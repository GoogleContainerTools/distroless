package(default_visibility = ["//:__subpackages__"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("//:checksums.bzl", "ARCHITECTURES")
load(":locale.bzl", "locale")

[
    locale(
        name = "locale_" + arch + distro_suffix,
        deb = DISTRO_PACKAGES[arch][distro_suffix]["libc-bin"],
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]
