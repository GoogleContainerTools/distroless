package(default_visibility = ["//:__subpackages__"])

load("//:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load(":cacerts.bzl", "cacerts")
load(":java.bzl", "cacerts_java")

[cacerts(
    name = "cacerts" + distro_suffix,
    deb = DISTRO_PACKAGES[distro_suffix]["ca-certificates"],
) for distro_suffix in DISTRO_SUFFIXES]

[cacerts_java(
    name = "cacerts_java" + distro_suffix,
    cacerts_tar = ":cacerts" + distro_suffix,
) for distro_suffix in DISTRO_SUFFIXES]
