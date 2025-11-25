load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//common:variables.bzl", "DEBUG_MODE", "USERS")

def bun_image_index(distro, architectures):
    """bun image index for a distro

    Args:
      distro: name of distribution
      architectures: all architectures included in index
    """
    [
        oci_image_index(
            name = "bun" + mode + "_" + user + "_" + distro,
            images = [
                "bun" + mode + "_" + user + "_" + arch + "_" + distro
                for arch in architectures
            ],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

def _check_certificates_tar():
    # only create once
    if native.existing_rule("check_certificate"):
        return

    pkg_tar(
        name = "check_certificate",
        srcs = ["testdata/check_certificate.js"],
    )

def bun_image(distro, arch):
    """bun and debug image with tests

    Args:
        distro: name of distribution
        arch: the target arch
    """
    [
        oci_image(
            name = "bun" + mode + "_" + user + "_" + arch + "_" + distro,
            base = "//base:base_nossl" + mode + "_" + user + "_" + arch + "_" + distro,
            entrypoint = ["/bun/bun"],
            # Use UTF-8 encoding for file system: match modern Linux
            env = {"LANG": "C.UTF-8"},
            tars = [
                "@bun" + "_" + arch,
            ],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

    _check_certificates_tar()

    [
        container_structure_test(
            name = "bun" + mode + "_" + user + "_" + arch + "_" + distro + "_test",
            configs = [
                "testdata/bun" + ".yaml",
            ],
            image = "bun" + mode + "_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

    [
        oci_image(
            name = "check_certificate_bun" + mode + "_" + user + "_" + arch + "_" + distro,
            base = "bun" + mode + "_" + user + "_" + arch + "_" + distro,
            tars = [
                ":check_certificate",
            ],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

    [
        container_structure_test(
            name = "check_certificate_bun" + mode + "_" + user + "_" + arch + "_" + distro + "_test",
            configs = ["testdata/bun.yaml", "testdata/check_certificate.yaml"],
            image = "check_certificate_bun" + mode + "_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]
