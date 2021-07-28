package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "_debian10": [
        "libncursesw6",
        "libtinfo6",
    ],
}

[
    container_image(
        name = ("python27" if (not mode) else mode[1:]) + "_" + arch + distro_suffix,
        architecture = arch,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + "_root_" + arch + distro_suffix,
        debs = [
            DISTRO_PACKAGES[arch][distro_suffix]["dash"],
            DISTRO_PACKAGES[arch][distro_suffix]["libbz2-1.0"],
            DISTRO_PACKAGES[arch][distro_suffix]["libc-bin"],
            DISTRO_PACKAGES[arch][distro_suffix]["libexpat1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libdb5.3"],
            DISTRO_PACKAGES[arch][distro_suffix]["libffi6"],
            DISTRO_PACKAGES[arch][distro_suffix]["libreadline7"],
            DISTRO_PACKAGES[arch][distro_suffix]["libsqlite3-0"],
            DISTRO_PACKAGES[arch][distro_suffix]["libssl1.1"],
            DISTRO_PACKAGES[arch][distro_suffix]["mime-support"],
            DISTRO_PACKAGES[arch][distro_suffix]["readline-common"],
            DISTRO_PACKAGES[arch][distro_suffix]["zlib1g"],
            DISTRO_PACKAGES[arch][distro_suffix]["python2.7-minimal"],
            DISTRO_PACKAGES[arch][distro_suffix]["libpython2.7-minimal"],
            DISTRO_PACKAGES[arch][distro_suffix]["libpython2.7-stdlib"],
        ] + [DISTRO_PACKAGES[arch][distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
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
            ":ld_so_" + arch + "_cache.tar",
        ],
    )
    for arch in ARCHITECTURES
    for mode in [
        "",
        ":debug",
    ]
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_test(
        name = "python27_" + arch + distro_suffix + "_test",
        configs = ["testdata/python27.yaml"],
        image = ":python27_" + arch + distro_suffix,
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
        name = "debian10_" + arch + "_test",
        size = "medium",
        configs = ["testdata/debian10.yaml"],
        image = ":python27_" + arch + "_debian10",
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
]

[
    genrule(
        name = "ld_so_cache_" + arch + "_tar",
        srcs = [":ld.so." + arch + ".cache"],
        outs = ["ld_so_" + arch + "_cache.tar"],
        cmd = "$(location :make_ld_so_cache_tar.py) $(SRCS) $(OUTS)",
        tools = [":make_ld_so_cache_tar.py"],
    )
    for arch in ARCHITECTURES
]

[
    sh_test(
        name = "check_ld_so_" + arch + "_cache",
        srcs = ["check_ld_so_cache.py"],
        args = [
            "$(location :ld.so." + arch + ".cache)",
            "$(location :ld.so.cache." + arch + ".new)",
        ],
        data = [
            ":ld.so." + arch + ".cache",
            ":ld.so.cache." + arch + ".new",
        ],
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
]
