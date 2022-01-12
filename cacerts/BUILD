package(default_visibility = ["//:__subpackages__"])

load("//base:distro.bzl", "DISTROS")
load("//:checksums.bzl", "ARCHITECTURES")
load(":cacerts.bzl", "cacerts")
load(":java.bzl", "cacerts_java")

[
    cacerts_java(
        name = "cacerts_java_" + arch + "_" + distro,
        cacerts_tar = "//base:cacerts_" + arch + "_" + distro,
    )
    for arch in ARCHITECTURES
    for distro in DISTROS
]
