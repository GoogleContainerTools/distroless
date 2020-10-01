package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

NONROOT = 65532

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

[[[
    container_image(
        name = ("python3" if (not mode) else mode[1:]) + distro_suffix,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + distro_suffix,
        debs = [
            DISTRO_PACKAGES["amd64"][distro_suffix]["dash"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libbz2-1.0"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libc-bin"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libdb5.3"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libexpat1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["liblzma5"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libmpdec2"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libreadline7"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libsqlite3-0"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libssl1.1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["zlib1g"],
        ] + [DISTRO_PACKAGES["amd64"][distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
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
    ),
    container_image(
        name = ("python3" if (not mode) else mode[1:]) + "_nonroot" + distro_suffix,
        base = ("python3" if (not mode) else mode[1:]) + distro_suffix,
        user = "%d" % NONROOT,
        workdir = "/home/nonroot",
    ),
] for mode in [
    "",
    ":debug",
]] for distro_suffix in DISTRO_SUFFIXES]

[container_test(
    name = "python3" + distro_suffix + "_test",
    size = "medium",
    configs = ["testdata/python3.yaml"],
    image = ":python3" + distro_suffix,
    tags = [
        "amd64",
        "manual",
    ],
) for distro_suffix in DISTRO_SUFFIXES]

# tests for version-specific things
[[
    container_test(
        name = "debian9" + user + "_test",
        size = "medium",
        configs = ["testdata/debian9.yaml"],
        image = ":python3" + user + "_debian9",
        tags = [
            "amd64",
            "manual",
        ],
    ),
    container_test(
        name = "debian10" + user + "_test",
        size = "medium",
        configs = ["testdata/debian10.yaml"],
        image = ":python3" + user + "_debian10",
        tags = [
            "amd64",
            "manual",
        ],
    ),
] for user in [
    "",
    "_nonroot",
]]
