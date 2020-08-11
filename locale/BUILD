package(default_visibility = ["//:__subpackages__"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load(":locale.bzl", "locale")

[locale(
    name = "locale" + distro_suffix,
    deb = DISTRO_PACKAGES[distro_suffix]["libc-bin"],
) for distro_suffix in DISTRO_SUFFIXES]
