package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "_debian9": [
        "libncursesw5",
        "libtinfo5",
    ],
    "_debian10": [
        "libncursesw6",
        "libtinfo6",
    ],
}

[container_image(
    name = ("python27" if (not mode) else mode[1:]) + distro_suffix,
    # Based on //cc so that C extensions work properly.
    base = "//cc" + (mode if mode else ":cc") + "_root_amd64" + distro_suffix,
    debs = [
        DISTRO_PACKAGES["amd64"][distro_suffix]["dash"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libbz2-1.0"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libc-bin"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libexpat1"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libdb5.3"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libffi6"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libreadline7"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libsqlite3-0"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libssl1.1"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["mime-support"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["readline-common"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["zlib1g"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["python2.7-minimal"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libpython2.7-minimal"],
        DISTRO_PACKAGES["amd64"][distro_suffix]["libpython2.7-stdlib"],
    ] + [DISTRO_PACKAGES["amd64"][distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
    entrypoint = [
        "/usr/bin/python2.7",
    ],
    # Use UTF-8 encoding for file system and stdout: match modern Linux
    env = {
        "LANG": "C.UTF-8",
        "PYTHONIOENCODING": "UTF-8",
    },
    symlinks = {
        "/usr/bin/python": "/usr/bin/python2.7",
    },
    tars = [
        ":ld_so_cache.tar",
    ],
) for mode in [
    "",
    ":debug",
] for distro_suffix in DISTRO_SUFFIXES]

[container_test(
    name = "python27" + distro_suffix + "_test",
    configs = ["testdata/python27.yaml"],
    image = ":python27" + distro_suffix,
    tags = [
        "amd64",
        "manual",
    ],
) for distro_suffix in DISTRO_SUFFIXES]

# tests for version-specific things
container_test(
    name = "debian9_test",
    size = "medium",
    configs = ["testdata/debian9.yaml"],
    image = ":python27_debian9",
    tags = [
        "amd64",
        "manual",
    ],
)

container_test(
    name = "debian10_test",
    size = "medium",
    configs = ["testdata/debian10.yaml"],
    image = ":python27_debian10",
    tags = [
        "amd64",
        "manual",
    ],
)

genrule(
    name = "ld_so_cache_tar",
    srcs = [":ld.so.cache"],
    outs = ["ld_so_cache.tar"],
    cmd = "$(location :make_ld_so_cache_tar.py) $(SRCS) $(OUTS)",
    tools = [":make_ld_so_cache_tar.py"],
)

sh_binary(
    name = "generate_ldconfig_cache",
    srcs = ["generate_ldconfig_cache.py"],
    data = [":python27_debian9"],
    tags = [
        "amd64",
        "manual",
    ],
)

genrule(
    name = "ld_so_cache_new",
    srcs = [":python27_debian9"],
    outs = ["ld.so.cache.new"],
    cmd = "$(location :generate_ldconfig_cache) $(OUTS)",
    tags = [
        "amd64",
        "manual",
    ],
    tools = [":generate_ldconfig_cache"],
)

sh_test(
    name = "check_ld_so_cache",
    srcs = ["check_ld_so_cache.py"],
    args = [
        "$(location :ld.so.cache)",
        "$(location :ld.so.cache.new)",
    ],
    data = [
        ":ld.so.cache",
        ":ld.so.cache.new",
    ],
    tags = [
        "amd64",
        "manual",
    ],
)
