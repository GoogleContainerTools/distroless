load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_image_index", "oci_tarball", "structure_test")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//common:variables.bzl", "variables")
load("//private/util:deb.bzl", "deb")

package(default_visibility = ["//visibility:public"])

DISTRO_VERSION = {
    "debian11": "3.9",
}

[
    pkg_tar(
        name = "python_aliases_%s" % distro,
        symlinks = {
            "/usr/bin/python": "/usr/bin/python" + DISTRO_VERSION[distro],
            "/usr/bin/python3": "/usr/bin/python" + DISTRO_VERSION[distro],
        },
    )
    for distro in variables.LANG_DISTS
]

# root
[
    oci_image_index(
        name = ("python3" if (not mode) else mode[1:]) + "_root_" + distro,
        images = [
            ("python3" if (not mode) else mode[1:]) + "_root_" + arch + "_" + distro
            for arch in variables.BASE_ARCHS
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for distro in variables.LANG_DISTS
]

[
    oci_image(
        name = ("python3" if (not mode) else mode[1:]) + "_root_" + arch + "_" + distro,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + "_root_" + arch + "_" + distro,
        entrypoint = [
            "/usr/bin/python" + DISTRO_VERSION[distro],
        ],
        # Use UTF-8 encoding for file system: match modern Linux
        env = {"LANG": "C.UTF-8"},
        tars = [
            deb.package(arch, distro, "dash"),
            deb.package(arch, distro, "libbz2-1.0"),
            deb.package(arch, distro, "libc-bin"),  # for ctypes.find_library
            deb.package(arch, distro, "libdb5.3"),
            deb.package(arch, distro, "libexpat1"),
            deb.package(arch, distro, "liblzma5"),
            deb.package(arch, distro, "libsqlite3-0"),
            deb.package(arch, distro, "libuuid1"),
            deb.package(arch, distro, "libncursesw6"),
            deb.package(arch, distro, "libtinfo6"),
            deb.package(arch, distro, "python3-distutils"),
            deb.package(arch, distro, "zlib1g"),
            deb.package(arch, distro, "libcom-err2"),
            deb.package(arch, distro, "libcrypt1"),
            deb.package(arch, distro, "libffi7"),
            deb.package(arch, distro, "libgssapi-krb5-2"),
            deb.package(arch, distro, "libk5crypto3"),
            deb.package(arch, distro, "libkeyutils1"),
            deb.package(arch, distro, "libkrb5-3"),
            deb.package(arch, distro, "libkrb5support0"),
            deb.package(arch, distro, "libmpdec3"),
            deb.package(arch, distro, "libnsl2"),
            deb.package(arch, distro, "libpython3.9-minimal"),
            deb.package(arch, distro, "libpython3.9-stdlib"),
            deb.package(arch, distro, "libreadline8"),
            deb.package(arch, distro, "libtirpc3"),
            deb.package(arch, distro, "python3.9-minimal"),
            "ld_so_" + arch + "_cache.tar",
            ":python_aliases_%s" % distro,
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in variables.BASE_ARCHS
    for distro in variables.LANG_DISTS
]

# nonroot
[
    oci_image_index(
        name = ("python3" if (not mode) else mode[1:]) + "_nonroot_" + distro,
        images = [
            ("python3" if (not mode) else mode[1:]) + "_nonroot_" + arch + "_" + distro
            for arch in variables.BASE_ARCHS
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for distro in variables.LANG_DISTS
]

[
    # TODO(mattmoor): Base this on the //cc:nonroot varietals instead
    oci_image(
        name = ("python3" if (not mode) else mode[1:]) + "_nonroot_" + arch + "_" + distro,
        base = ("python3" if (not mode) else mode[1:]) + "_root_" + arch + "_" + distro,
        user = "%d" % variables.NONROOT,
        workdir = "/home/nonroot",
    )
    for mode in [
        "",
        ":debug",
    ]
    for arch in variables.BASE_ARCHS
    for distro in variables.LANG_DISTS
]

[
    genrule(
        name = "ld_so_cache_" + arch + "_tar",
        srcs = [":ld.so." + arch + ".cache"],
        outs = ["ld_so_" + arch + "_cache.tar"],
        cmd = "$(location :make_ld_so_cache_tar.py) $(SRCS) $(OUTS)",
        tools = [":make_ld_so_cache_tar.py"],
    )
    for arch in variables.BASE_ARCHS
]

[
    oci_tarball(
        name = "python3_root_" + arch + "_debian11_tarball",
        image = ":python3_root_" + arch + "_debian11",
        repotags = ["distroless/gen/python3_root_%s_debian11_tarball:gen" % arch],
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in variables.BASE_ARCHS
]

[
    genrule(
        name = "ld_so_cache_" + arch + "_new",
        srcs = [":python3_root_" + arch + "_debian11_tarball"],
        outs = ["ld.so.cache." + arch + ".new"],
        cmd = """
#!/usr/bin/env bash
set -o errexit

TARBALL="$(location :python3_root_{arch}_debian11_tarball)"
TAG="distroless/gen/python3_root_{arch}_debian11_tarball:gen"
DOCKER="docker"

export HOME="$$(realpath ~)"
$$DOCKER load -i "$$TARBALL"
REF=$$($$DOCKER create --entrypoint=/sbin/ldconfig $$TAG -C /tmp/ld.so.cache)
$$DOCKER start $$REF
$$DOCKER export $$REF -o ./data.tar
tar -xf ./data.tar tmp/ld.so.cache
mv tmp/ld.so.cache $(OUTS)
""".format(arch = arch),
        # Required as this target depends on installed docker or podman
        local = True,
        tags = [
            "manual",
            arch,
        ],
    )
    for arch in variables.BASE_ARCHS
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
    for arch in variables.BASE_ARCHS
]

[
    structure_test(
        name = "python3_" + user + "_" + arch + "_" + distro + "_test",
        size = "medium",
        config = ["testdata/python3.yaml"],
        image = ":python3_" + user + "_" + arch + "_" + distro,
        tags = [
            "manual",
            arch,
        ],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for arch in variables.BASE_ARCHS
    for distro in variables.LANG_DISTS
]

# tests for version-specific things
[
    structure_test(
        name = "version_specific_" + user + "_" + arch + "_" + distro + "_test",
        size = "medium",
        config = ["testdata/" + distro + ".yaml"],
        image = ":python3_" + user + "_" + arch + "_" + distro,
        tags = [
            "manual",
            arch,
        ],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for arch in variables.BASE_ARCHS
    for distro in variables.LANG_DISTS
]
