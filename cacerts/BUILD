package(default_visibility = ["//:__subpackages__"])

load("//base:distro.bzl", "DISTRO_SUFFIXES")
load(":cacerts.bzl", "cacerts")
load(":java.bzl", "cacerts_java")

[alias(
    name = "cacerts" + distro_suffix,
    actual = "//base:cacerts" + distro_suffix,
) for distro_suffix in DISTRO_SUFFIXES]

[cacerts_java(
    name = "cacerts_java" + distro_suffix,
    cacerts_tar = ":cacerts" + distro_suffix,
) for distro_suffix in DISTRO_SUFFIXES]
