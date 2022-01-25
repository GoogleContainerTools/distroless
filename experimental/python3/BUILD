package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", "deb_file")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", "NONROOT")

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "debian10": [
        "libffi6",
        "libmpdec2",
        "libpython3.7-minimal",
        "libpython3.7-stdlib",
        "libreadline7",
        "python3.7-minimal",
    ],
    "debian11": [
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
    "debian10": "3.7",
    "debian11": "3.9",
}

[
    container_image(
        name = ("python3" if (not mode) else mode[1:]) + "_root_" + arch + "_" + distro,
        architecture = arch,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + "_root_" + arch + "_" + distro,
        debs = [
            deb_file(arch, distro, "dash"),
            deb_file(arch, distro, "libbz2-1.0"),
            deb_file(arch, distro, "libc-bin"),  # for ctypes.find_library
            deb_file(arch, distro, "libdb5.3"),
            deb_file(arch, distro, "libexpat1"),
            deb_file(arch, distro, "liblzma5"),
            deb_file(arch, distro, "libsqlite3-0"),
            deb_file(arch, distro, "libuuid1"),
            deb_file(arch, distro, "libncursesw6"),
            deb_file(arch, distro, "libtinfo6"),
            deb_file(arch, distro, "python3-distutils"),
            deb_file(arch, distro, "zlib1g"),
        ] + [deb_file(arch, distro, deb) for deb in DISTRO_DEBS[distro]],
        entrypoint = [
            "/usr/bin/python" + DISTRO_VERSION[distro],
        ],
        # Use UTF-8 encoding for file system: match modern Linux
        env = {"LANG": "C.UTF-8"},
        symlinks = {
            "/usr/bin/python": "/usr/bin/python" + DISTRO_VERSION[distro],
            "/usr/bin/python3": "/usr/bin/python" + DISTRO_VERSION[distro],
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
    for distro in DISTROS
]

[
    # TODO(mattmoor): Base this on the //cc:nonroot varietals instead
    container_image(
        name = ("python3" if (not mode) else mode[1:]) + "_nonroot_" + arch + "_" + distro,
        architecture = arch,
        base = ("python3" if (not mode) else mode[1:]) + "_root_" + arch + "_" + distro,
        user = "%d" % NONROOT,
        workdir = "/home/nonroot",
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in ARCHITECTURES
    for distro in DISTROS
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
        name = "python3_" + user + "_" + arch + "_" + distro + "_test",
        size = "medium",
        configs = ["testdata/python3.yaml"],
        image = ":python3_" + user + "_" + arch + "_" + distro,
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
    for distro in DISTROS
]

# tests for version-specific things
[
    container_test(
        name = "version_specific_" + user + "_" + arch + "_" + distro + "_test",
        size = "medium",
        configs = ["testdata/" + distro + ".yaml"],
        image = ":python3_" + user + "_" + arch + "_" + distro,
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
    for distro in DISTROS
]
