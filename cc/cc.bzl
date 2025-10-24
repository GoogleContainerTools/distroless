load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("//private/util:deb.bzl", "deb")

DEBUG_MODE = ["", "_debug"]
USERS = ["root", "nonroot"]

DISTRO_SPECIFIC_LIBRARIES = {
    "debian12": [
        "gcc-12-base",
    ],
    "debian13": [
        "gcc-14-base",
        "zlib1g",
    ],
}

def cc_image_index(distro, architectures):
    """cc image index for a distro

    Args:
        distro: name of distribution
        architectures: all architectures included in index
    """
    [
        oci_image_index(
            name = "cc" + mode + "_" + user + "_" + distro,
            images = [
                "cc" + mode + "_" + user + "_" + arch + "_" + distro
                for arch in architectures
            ],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

def cc_image(distro, arch):
    """base nossl and debug images and tests for a distro/arch

    Args:
        distro: name of the distribution
        arch: the target architecture
    """
    [
        oci_image(
            name = "cc" + mode + "_" + user + "_" + arch + "_" + distro,
            base = "//base:base" + mode + "_" + user + "_" + arch + "_" + distro,
            tars = [
                deb.package(arch, distro, "libgomp1"),
                deb.package(arch, distro, "libstdc++6"),
                deb.package(arch, distro, "libgcc-s1"),
            ] + [deb.package(arch, distro, library) for library in DISTRO_SPECIFIC_LIBRARIES[distro]],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]
