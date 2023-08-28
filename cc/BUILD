load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", "deb_pkg")
load("//:checksums.bzl", "ARCHITECTURES")

package(default_visibility = ["//visibility:public"])

# An image for C/C++ programs
[
    oci_image_index(
        name = ("cc" if not mode else mode[1:]) + "_" + user + "_" + distro,
        images = [
            ("cc" if not mode else mode[1:]) + "_" + user + "_" + arch + "_" + distro
            for arch in ARCHITECTURES
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for user in [
        "root",
        "nonroot",
    ]
    for distro in DISTROS
]

[
    oci_image(
        name = ("cc" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        base = "//base" + (mode if mode else ":base") + "_" + user + "_" + arch + "_" + distro,
        tars = [
            deb_pkg(arch, distro, "libgomp1"),
            deb_pkg(arch, distro, "libstdcpp6"),
            deb_pkg(arch, distro, "libgcc-s1"),
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
    for distro in DISTROS
]
