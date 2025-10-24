"defines a function to replicate the container images for different distributions"

load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_go//go:def.bzl", "go_binary")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//:checksums.bzl", "VARIANTS")
load("//common:variables.bzl", "NONROOT")
load("//private/util:deb.bzl", "deb")

USERS = ["root", "nonroot"]
DEBUG_MODE = ["", "_debug"]

def base_nossl_image_index(distro, architectures):
    """base nossl image index for a distro

    Args:
        distro: name of distribution
        architectures: all architectures included in index
    """
    [
        oci_image_index(
            name = "base_nossl" + mode + "_" + user + "_" + distro,
            images = [
                "base_nossl" + mode + "_" + user + "_" + arch + "_" + distro
                for arch in architectures
            ],
        )
        for user in USERS
        for mode in DEBUG_MODE
    ]

def base_image_index(distro, architectures):
    """base image index for a distro

    Args:
        distro: name of distribution
        architectures: all architectures included in index
    """
    [
        oci_image_index(
            name = "base" + mode + "_" + user + "_" + distro,
            images = [
                "base" + mode + "_" + user + "_" + arch + "_" + distro
                for arch in architectures
            ],
        )
        for user in USERS
        for mode in DEBUG_MODE
    ]

def base_nossl_image(distro, arch):
    """base nossl and debug images and tests for a distro/arch

    Args:
        distro: name of the distribution
        arch: the target architecture
    """

    [
        oci_image(
            name = "base_nossl" + mode + "_" + user + "_" + arch + "_" + distro,
            base = "//static:static" + mode + "_" + user + "_" + arch + "_" + distro,
            tars = [
                deb.package(arch, distro, "libc6"),
            ],
        )
        for user in USERS
        for mode in DEBUG_MODE
    ]

    # Check for common base files.
    container_structure_test(
        name = "base_nossl_" + arch + "_" + distro + "_test",
        configs = ["testdata/base.yaml"],
        image = ":base_nossl_root_" + arch + "_" + distro,
        tags = ["manual", arch],
    )

    # Check for busybox
    container_structure_test(
        name = "base_nossl_debug_" + arch + "_" + distro + "_test",
        configs = ["testdata/debug.yaml"],
        image = ":base_nossl_debug_root_" + arch + "_" + distro,
        tags = ["manual", arch],
    )

def base_image(distro, arch):
    """base and debug images and tests for a distro/arch

    Args:
        distro: name of the distribution
        arch: the target architecture
    """
    LIBSSL = {
        "debian12": "libssl3",
        "debian13": "libssl3t64",
    }

    [
        oci_image(
            name = "base" + mode + "_" + user + "_" + arch + "_" + distro,
            base = "//static:static" + mode + "_" + user + "_" + arch + "_" + distro,
            tars = [
                deb.package(arch, distro, "libc6"),
                deb.package(arch, distro, LIBSSL[distro]),
            ],
        )
        for user in USERS
        for mode in DEBUG_MODE
    ]

    # Check for common base files.
    container_structure_test(
        name = "base_" + arch + "_" + distro + "_test",
        configs = ["testdata/base.yaml"],
        image = ":base_root_" + arch + "_" + distro,
        tags = ["manual", arch],
    )

    # Check for busybox
    container_structure_test(
        name = "base_debug_" + arch + "_" + distro + "_test",
        configs = ["testdata/debug.yaml"],
        image = ":base_debug_root_" + arch + "_" + distro,
        tags = ["manual", arch],
    )
