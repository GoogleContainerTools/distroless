package(default_visibility = ["//:__subpackages__"])

load("//base:distro.bzl", "DISTRO_SUFFIXES")
load("//:checksums.bzl", "ARCHITECTURES")
load(":cacerts.bzl", "cacerts")
load(":java.bzl", "cacerts_java")

[
    cacerts_java(
        name = "cacerts_java_" + arch + distro_suffix,
        cacerts_tar = "//base:cacerts_" + arch + distro_suffix,
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]
