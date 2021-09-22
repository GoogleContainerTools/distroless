package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//base:base.bzl", "NONROOT")

# TODO: Use DISTRO_SUFFIXES when debian11 is enabled for all
PY_DISTRO_SUFFIXES = DISTRO_SUFFIXES + ["_debian11"]

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "_debian10": [
        "libffi6",
        "libmpdec2",
        "libpython3.7-minimal",
        "libpython3.7-stdlib",
        "libreadline7",
        "python3.7-minimal",
    ],
    "_debian11": [
        "libcom-err2",
        "libcrypt1",
        "libffi7",
        "libgssapi-krb5-2",
        "libk5crypto3",
        "libkeyutils1",
        "libkrb5-3",
        "libkrb5support0",
        "libmpdec3",
        "libnsl2",
        "libpython3.9-minimal",
        "libpython3.9-stdlib",
        "libreadline8",
        "libtirpc3",
        "python3.9-minimal",
    ],
}

DISTRO_VERSION = {
    "_debian10": "3.7",
    "_debian11": "3.9",
}

[
    container_image(
        name = ("python3" if (not mode) else mode[1:]) + "_root_" + arch + distro_suffix,
        architecture = arch,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + "_root_" + arch + distro_suffix,
        debs = [
            DISTRO_PACKAGES[arch][distro_suffix]["dash"],
            DISTRO_PACKAGES[arch][distro_suffix]["libbz2-1.0"],
            DISTRO_PACKAGES[arch][distro_suffix]["libc-bin"],  # for ctypes.find_library
            DISTRO_PACKAGES[arch][distro_suffix]["libdb5.3"],
            DISTRO_PACKAGES[arch][distro_suffix]["libexpat1"],
            DISTRO_PACKAGES[arch][distro_suffix]["liblzma5"],
            DISTRO_PACKAGES[arch][distro_suffix]["libsqlite3-0"],
            DISTRO_PACKAGES[arch][distro_suffix]["libuuid1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libncursesw6"],
            DISTRO_PACKAGES[arch][distro_suffix]["libtinfo6"],
            DISTRO_PACKAGES[arch][distro_suffix]["python3-distutils"],
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
            "ld_so_" + arch + "_cache.tar",
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in ARCHITECTURES
    for distro_suffix in PY_DISTRO_SUFFIXES
]

[
    # TODO(mattmoor): Base this on the //cc:nonroot varietals instead
    container_image(
        name = ("python3" if (not mode) else mode[1:]) + "_nonroot_" + arch + distro_suffix,
        architecture = arch,
        base = ("python3" if (not mode) else mode[1:]) + "_root_" + arch + distro_suffix,
        user = "%d" % NONROOT,
        workdir = "/home/nonroot",
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in ARCHITECTURES
    for distro_suffix in PY_DISTRO_SUFFIXES
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
    sh_binary(
        name = "generate_ldconfig_" + arch + "_cache",
        srcs = ["generate_ldconfig_cache.py"],
        data = [":python3_root_" + arch + "_debian10"],
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
]

[
    genrule(
        name = "ld_so_cache_" + arch + "_new",
        srcs = [":python3_root_" + arch + "_debian10"],
        outs = ["ld.so.cache." + arch + ".new"],
        cmd = "$(location :generate_ldconfig_" + arch + "_cache) " + arch + " $(OUTS)",
        tags = [
            "manual",
            arch,
        ],
        tools = [":generate_ldconfig_" + arch + "_cache"],
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

[
    container_test(
        name = "python3_" + user + "_" + arch + distro_suffix + "_test",
        size = "medium",
        configs = ["testdata/python3.yaml"],
        image = ":python3_" + user + "_" + arch + distro_suffix,
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
    for user in [
        "root",
        "nonroot",
    ]
    for distro_suffix in PY_DISTRO_SUFFIXES
]

# tests for version-specific things
[
    container_test(
        name = "version_specific_" + user + "_" + arch + distro_suffix + "_test",
        size = "medium",
        configs = ["testdata/" + distro_suffix[1:] + ".yaml"],
        image = ":python3_" + user + "_" + arch + distro_suffix,
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in ARCHITECTURES
    for user in [
        "root",
        "nonroot",
    ]
    for distro_suffix in PY_DISTRO_SUFFIXES
]
