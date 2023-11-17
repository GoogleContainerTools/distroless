load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("//common:variables.bzl", "variables")
load("//private/util:deb.bzl", "deb")

package(default_visibility = ["//visibility:public"])

# An image for C/C++ programs
[
    oci_image_index(
        name = ("cc" if not mode else mode[1:]) + "_" + user + "_" + distro,
        images = [
            ("cc" if not mode else mode[1:]) + "_" + user + "_" + arch + "_" + distro
            for arch in variables.ARCHS
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
    for distro in variables.DISTS
]

[
    oci_image(
        name = ("cc" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        base = "//base" + (mode if mode else ":base") + "_" + user + "_" + arch + "_" + distro,
        tars = [
            deb.package(arch, distro, "libgomp1"),
            deb.package(arch, distro, "libstdcpp6"),
            deb.package(arch, distro, "libgcc-s1"),
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in variables.ARCHS
    for user in [
        "root",
        "nonroot",
    ]
    for distro in variables.DISTS
]
