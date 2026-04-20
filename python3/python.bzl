"python3 image definitions"

load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("//common:variables.bzl", "DEBUG_MODE", "USERS")
load("//private/util:deb.bzl", "deb")
load("//private/util:tar.bzl", "tar")

DISTRO_VERSION = {
    "debian12": "3.11",
    "debian13": "3.13",
}

def python_alias(distro):
    if native.existing_rule("python_aliases_" + distro):
        return

    tar(
        name = "python_aliases_" + distro,
        extension = "tar.gz",
        symlinks = {
            "/usr/bin/python": "/usr/bin/python" + DISTRO_VERSION[distro],
            "/usr/bin/python3": "/usr/bin/python" + DISTRO_VERSION[distro],
        },
    )

def python3_image_index(distro, architectures):
    """python image index for a distro

    Args:
        distro: name of distribution
        architectures: all architectures included in index
    """
    for mode in DEBUG_MODE:
        for user in USERS:
            oci_image_index(
                name = "python3" + mode + "_" + user + "_" + distro,
                images = [
                    "python3" + mode + "_" + user + "_" + arch + "_" + distro
                    for arch in architectures
                ],
            )

def python3_image(distro, arch, packages):
    """python3 and debug image with tests.

    Args:
        distro: name of distribution
        arch: the target architecture
        packages: list of debian packages to include
    """
    python_alias(distro)

    for mode in DEBUG_MODE:
        for user in USERS:
            oci_image(
                name = "python3" + mode + "_" + user + "_" + arch + "_" + distro,
                # Based on //cc so that C extensions work properly.
                base = "//cc:cc" + mode + "_" + user + "_" + arch + "_" + distro,
                entrypoint = [
                    "/usr/bin/python" + DISTRO_VERSION[distro],
                ],
                # Use UTF-8 encoding for file system: match modern Linux
                env = {"LANG": "C.UTF-8"},
                tars = [
                    deb.package(arch, distro, pkg, "python")
                    for pkg in packages
                ] + [":python_aliases_%s" % distro] + ([":ldconfig_cache_" + arch] if distro == "debian13" else []),
            )

    for user in USERS:
        container_structure_test(
            name = "python3_" + user + "_" + arch + "_" + distro + "_test",
            size = "medium",
            configs = ["testdata/python3.yaml"],
            image = ":python3_" + user + "_" + arch + "_" + distro,
            tags = [
                "manual",
                arch,
            ],
        )

    # tests for version-specific things
    for user in USERS:
        container_structure_test(
            name = "version_specific_" + user + "_" + arch + "_" + distro + "_test",
            size = "medium",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":python3_" + user + "_" + arch + "_" + distro,
            tags = [
                "manual",
                arch,
            ],
        )
