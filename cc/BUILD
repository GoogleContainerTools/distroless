package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

# An image for C/C++ programs
[
    container_image(
        name = ("cc" if (not mode) else mode[1:]) + distro_suffix,
        base = "//base" + (mode if mode else ":base") + "_root_amd64" + distro_suffix,
        debs = [
            DISTRO_PACKAGES["amd64"][distro_suffix]["libgcc1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libgomp1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libstdc++6"],
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for distro_suffix in DISTRO_SUFFIXES
]
