package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", "ARCHITECTURES")
load("//base:base.bzl", "NONROOT")

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "_debian9": [
        "libncursesw5",
        "libpython3.5-minimal",
        "libpython3.5-stdlib",
        "libtinfo5",
        "python3.5-minimal",
    ],
    "_debian10": [
        "libffi6",
        "libncursesw6",
        "libpython3.7-minimal",
        "libpython3.7-stdlib",
        "libtinfo6",
        "libuuid1",
        "python3-distutils",
        "python3.7-minimal",
    ],
}

DISTRO_VERSION = {
    "_debian9": "3.5",
    "_debian10": "3.7",
}

ARCHITECTURES = [arch for arch in ARCHITECTURES if arch != "s390x"]

[
    container_image(
        name = ("python3" if (not mode) else mode[1:]) + "_" + arch + distro_suffix,
        architecture = arch,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + "_root_" + arch + distro_suffix,
        debs = [
            DISTRO_PACKAGES[arch][distro_suffix]["dash"],
            DISTRO_PACKAGES[arch][distro_suffix]["libbz2-1.0"],
            DISTRO_PACKAGES[arch][distro_suffix]["libc-bin"],
            DISTRO_PACKAGES[arch][distro_suffix]["libdb5.3"],
            DISTRO_PACKAGES[arch][distro_suffix]["libexpat1"],
            DISTRO_PACKAGES[arch][distro_suffix]["liblzma5"],
            DISTRO_PACKAGES[arch][distro_suffix]["libmpdec2"],
            DISTRO_PACKAGES[arch][distro_suffix]["libreadline7"],
            DISTRO_PACKAGES[arch][distro_suffix]["libsqlite3-0"],
            DISTRO_PACKAGES[arch][distro_suffix]["libssl1.1"],
            DISTRO_PACKAGES[arch][distro_suffix]["zlib1g"],
        ] + [DISTRO_PACKAGES[arch][distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
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
            "//experimental/python2.7:ld_so_" + arch + "_cache.tar",
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]

[
    # TODO(mattmoor): Base this on the //cc:nonroot varietals instead
    container_image(
        name = ("python3" if (not mode) else mode[1:]) + "_nonroot_" + arch + distro_suffix,
        architecture = arch,
        base = ("python3" if (not mode) else mode[1:]) + "_" + arch + distro_suffix,
        user = "%d" % NONROOT,
        workdir = "/home/nonroot",
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_test(
        name = "python3_" + arch + distro_suffix + "_test",
        size = "medium",
        configs = ["testdata/python3.yaml"],
        image = ":python3_" + arch + distro_suffix,
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]

# tests for version-specific things
[
    container_test(
        name = "debian9" + user + "_" + arch + "_test",
        size = "medium",
        configs = ["testdata/debian9.yaml"],
        image = ":python3" + user + "_" + arch + "_debian9",
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
    for user in [
        "",
        "_nonroot",
    ]
]

[
    container_test(
        name = "debian10" + user + "_" + arch + "_test",
        size = "medium",
        configs = ["testdata/debian10.yaml"],
        image = ":python3" + user + "_" + arch + "_debian10",
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
    for user in [
        "",
        "_nonroot",
    ]
]
