load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//private/util:deb.bzl", "deb")

package(default_visibility = ["//visibility:public"])

USERS = [
    "root",
    "nonroot",
]

DISTROS = [
    "debian12",
]

DISTRO_VERSION = {
    "debian12": "3.11",
}

[
    pkg_tar(
        name = "python_aliases_%s" % distro,
        symlinks = {
            "/usr/bin/python": "/usr/bin/python" + DISTRO_VERSION[distro],
            "/usr/bin/python3": "/usr/bin/python" + DISTRO_VERSION[distro],
        },
    )
    for distro in DISTROS
]

[
    oci_image_index(
        name = ("python3" if (not mode) else mode[1:]) + "_" + user + "_" + distro,
        images = [
            ("python3" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro
            for arch in ARCHITECTURES
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for user in USERS
    for distro in DISTROS
]

[
    oci_image(
        name = ("python3" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + "_" + user + "_" + arch + "_" + distro,
        entrypoint = [
            "/usr/bin/python" + DISTRO_VERSION[distro],
        ],
        # Use UTF-8 encoding for file system: match modern Linux
        env = {"LANG": "C.UTF-8"},
        tars = [
            deb.package(arch, distro, "libbz2-1.0"),
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
            deb.package(arch, distro, "libgssapi-krb5-2"),
            deb.package(arch, distro, "libk5crypto3"),
            deb.package(arch, distro, "libkeyutils1"),
            deb.package(arch, distro, "libkrb5-3"),
            deb.package(arch, distro, "libkrb5support0"),
            deb.package(arch, distro, "libnsl2"),
            deb.package(arch, distro, "libreadline8"),
            deb.package(arch, distro, "libtirpc3"),
            deb.package(arch, distro, "libffi8"),
            deb.package(arch, distro, "libpython3.11-minimal"),
            deb.package(arch, distro, "libpython3.11-stdlib"),
            deb.package(arch, distro, "python3.11-minimal"),
            ":python_aliases_%s" % distro,
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for user in USERS
    for arch in ARCHITECTURES
    for distro in DISTROS
]

[
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
    for user in USERS
    for arch in ARCHITECTURES
    for distro in DISTROS
]

# tests for version-specific things
[
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
    for user in USERS
    for arch in ARCHITECTURES
    for distro in DISTROS
]
