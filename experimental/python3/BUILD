package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@package_bundle//file:packages.bzl", "packages")
load("@package_bundle_debian10//file:packages.bzl", packages_debian10 = "packages")

DISTRO_PACKAGES = {
    '': packages,
    '-debian10': packages_debian10,
}

# distribution-specific deb dependencies
DISTRO_DEBS = {
    '': [
        # Different python packages have different transitive dependencies
        # on the different libssl shared library versions.
        "libssl1.0.2",
        "python3.5-minimal",
        "libpython3.5-minimal",
        "libpython3.5-stdlib",
    ],
    '-debian10': [
        "python3.7-minimal",
        "libpython3.7-minimal",
        "libpython3.7-stdlib",
        "libffi6",
    ]
}

DISTRO_VERSION = {
    '': '3.5',
    '-debian10': '3.7',
}

[[container_image(
    name = ("python3" if (not mode) else mode[1:]) + distro_suffix,
    # Based on //cc so that C extensions work properly.
    base = "//cc" + (mode if mode else ":cc") + distro_suffix,
    debs = [
        DISTRO_PACKAGES[distro_suffix]["dash"],
        DISTRO_PACKAGES[distro_suffix]["zlib1g"],
        DISTRO_PACKAGES[distro_suffix]["libbz2-1.0"],
        DISTRO_PACKAGES[distro_suffix]["libc-bin"],
        DISTRO_PACKAGES[distro_suffix]["libncursesw5"],
        DISTRO_PACKAGES[distro_suffix]["liblzma5"],
        DISTRO_PACKAGES[distro_suffix]["libreadline7"],
        DISTRO_PACKAGES[distro_suffix]["libtinfo5"],
        DISTRO_PACKAGES[distro_suffix]["libsqlite3-0"],
        DISTRO_PACKAGES[distro_suffix]["libssl1.1"],
        DISTRO_PACKAGES[distro_suffix]["libexpat1"],
    ] + [DISTRO_PACKAGES[distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
    entrypoint = [
        "/usr/bin/python" + DISTRO_VERSION[distro_suffix],
    ],
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
]] for distro_suffix in ("", "-debian10")]

container_test(
    name = "python3_test",
    size = "medium",
    configs = ["testdata/python3.yaml"],
    image = ":python3",
)
