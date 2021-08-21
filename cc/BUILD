package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//:checksums.bzl", "ARCHITECTURES")

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "_debian10": [
        "libgcc1",
    ],
    "_debian11": [
        "libgcc-s1",
    ],
}

# An image for C/C++ programs
[
    container_image(
        name = ("cc" if (not mode) else mode[1:]) + "_" + user + "_" + arch + distro_suffix,
        architecture = arch,
        base = "//base" + (mode if mode else ":base") + "_" + user + "_" + arch + distro_suffix,
        debs = [
            DISTRO_PACKAGES[arch][distro_suffix]["libgomp1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libstdc++6"],
        ] + [DISTRO_PACKAGES[arch][distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
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
    for distro_suffix in DISTRO_SUFFIXES + ["_debian11"]
]
