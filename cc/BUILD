load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("//:checksums.bzl", "ARCHITECTURES")
load("//base:distro.bzl", "DISTROS", "PREVIEW_DISTROS")
load("//private/util:deb.bzl", "deb")

package(default_visibility = ["//visibility:public"])

GCC_BASE = {
    "debian12": "gcc-12-base",
    "debian13": "gcc-14-base",
}

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
    for distro in DISTROS + PREVIEW_DISTROS
]

[
    oci_image(
        name = ("cc" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        base = "//base" + (mode if mode else ":base") + "_" + user + "_" + arch + "_" + distro,
        tars = [
            deb.package(
                arch,
                distro,
                GCC_BASE[distro],
            ),
            deb.package(arch, distro, "libgomp1"),
            deb.package(arch, distro, "libstdc++6"),
            deb.package(arch, distro, "libgcc-s1"),
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
    for distro in DISTROS + PREVIEW_DISTROS
]
