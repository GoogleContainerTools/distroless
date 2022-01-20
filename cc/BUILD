package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", "deb_file")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//:checksums.bzl", "ARCHITECTURES")

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "debian10": [
        "libgcc1",
    ],
    "debian11": [
        "libgcc-s1",
    ],
}

# An image for C/C++ programs
[
    container_image(
        name = ("cc" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = "//base" + (mode if mode else ":base") + "_" + user + "_" + arch + "_" + distro,
        debs = [
            deb_file(arch, distro, "libgomp1"),
            deb_file(arch, distro, "libstdcpp6"),
        ] + [deb_file(arch, distro, deb) for deb in DISTRO_DEBS[distro]],
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
    for distro in DISTROS
]
