package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//:checksums.bzl", "ARCHITECTURES")

# An image for C/C++ programs
[
    container_image(
        name = ("cc" if (not mode) else mode[1:]) + "_" + user + "_" + arch + distro_suffix,
        architecture = arch,
        base = "//base" + (mode if mode else ":base") + "_" + user + "_" + arch + distro_suffix,
        debs = [
            DISTRO_PACKAGES[arch][distro_suffix]["libgcc1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libgomp1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libstdc++6"],
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in ARCHITECTURES
    for user in [
        "root",
        "nonroot",
    ]
    for distro_suffix in DISTRO_SUFFIXES
]
