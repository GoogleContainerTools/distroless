package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@package_bundle//file:packages.bzl", "packages")
load("@package_bundle_debian10//file:packages.bzl", packages_debian10 = "packages")

DISTRO_PACKAGES = {
    "-debian9": packages,
    "-debian10": packages_debian10,
}

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "-debian9": [
        "libncursesw5",
        "libpython3.5-minimal",
        "libpython3.5-stdlib",
        "libtinfo5",
        "python3.5-minimal",
    ],
    "-debian10": [
        "libffi6",
        "libncursesw6",
        "libpython3.7-minimal",
        "libpython3.7-stdlib",
        "libtinfo6",
        "libuuid1",
        "python3.7-minimal",
    ],
}

DISTRO_VERSION = {
    "-debian9": "3.5",
    "-debian10": "3.7",
}

[[container_image(
    name = ("python3" if (not mode) else mode[1:]) + distro_suffix,
    # Based on //cc so that C extensions work properly.
    base = "//cc" + (mode if mode else ":cc") + distro_suffix,
    debs = [
        DISTRO_PACKAGES[distro_suffix]["dash"],
        DISTRO_PACKAGES[distro_suffix]["libbz2-1.0"],
        DISTRO_PACKAGES[distro_suffix]["libc-bin"],
        DISTRO_PACKAGES[distro_suffix]["libdb5.3"],
        DISTRO_PACKAGES[distro_suffix]["libexpat1"],
        DISTRO_PACKAGES[distro_suffix]["liblzma5"],
        DISTRO_PACKAGES[distro_suffix]["libmpdec2"],
        DISTRO_PACKAGES[distro_suffix]["libreadline7"],
        DISTRO_PACKAGES[distro_suffix]["libsqlite3-0"],
        DISTRO_PACKAGES[distro_suffix]["libssl1.1"],
        DISTRO_PACKAGES[distro_suffix]["zlib1g"],
    ] + [DISTRO_PACKAGES[distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
    entrypoint = [
        "/usr/bin/python" + DISTRO_VERSION[distro_suffix],
    ],
    # Use UTF-8 encoding for file system: match modern Linux
    env = {"LANG": "C.UTF-8"},
    symlinks = {
        "/usr/bin/python": "/usr/bin/python" + DISTRO_VERSION[distro_suffix],
        "/usr/bin/python3": "/usr/bin/python" + DISTRO_VERSION[distro_suffix],
    },
    tars = [
        "//experimental/python2.7:ld_so_cache.tar",
    ],
) for mode in [
    "",
    ":debug",
]] for distro_suffix in ("-debian9", "-debian10")]

[container_test(
    name = "python3" + distro_suffix + "_test",
    size = "medium",
    configs = ["testdata/python3.yaml"],
    image = ":python3" + distro_suffix,
) for distro_suffix in ("-debian9", "-debian10")]

# tests for version-specific things
container_test(
    name = "debian9_test",
    size = "medium",
    configs = ["testdata/debian9.yaml"],
    image = ":python3-debian9",
)

container_test(
    name = "debian10_test",
    size = "medium",
    configs = ["testdata/debian10.yaml"],
    image = ":python3-debian10",
)

# Provide aliases so the default images use debian9
alias(
    name = "python3",
    actual = ":python3-debian9",
)

alias(
    name = "debug",
    actual = ":debug-debian9",
)
