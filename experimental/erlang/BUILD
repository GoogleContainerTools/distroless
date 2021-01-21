package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//base:base.bzl", "NONROOT")

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "_debian10": [
        "libncursesw6",
        "libtinfo6",
        "libodbc1",
        "libsctp1",
        "libsodium23",
    ],
    "_debian9": [
        "libncursesw5",
        "libtinfo5",
        "libodbc1",
        "libsctp1",
        "libsodium18",
    ],
}

[
    container_image(
        name = ("erlang" if (not mode) else mode[1:]) + "_root_" + arch + distro_suffix,
        architecture = arch,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + "_root_" + arch + distro_suffix,
        # base = "//base" + (mode if mode else ":base") + "_root_" + arch + distro_suffix,
        debs = [
            DISTRO_PACKAGES[arch][distro_suffix]["dash"],
            DISTRO_PACKAGES[arch][distro_suffix]["libbz2-1.0"],
            DISTRO_PACKAGES[arch][distro_suffix]["libc-bin"],
            DISTRO_PACKAGES[arch][distro_suffix]["libreadline7"],
            DISTRO_PACKAGES[arch][distro_suffix]["libssl1.1"],
            DISTRO_PACKAGES[arch][distro_suffix]["zlib1g"],
            DISTRO_PACKAGES[arch][distro_suffix]["libselinux1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libacl1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libattr1"],
            DISTRO_PACKAGES[arch][distro_suffix]["sed"],
            DISTRO_PACKAGES[arch][distro_suffix]["libpcre3"],
            DISTRO_PACKAGES[arch][distro_suffix]["coreutils"],
        ] + [DISTRO_PACKAGES[arch][distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
        entrypoint = [
            "/usr/bin/erl",
        ],
        # Use UTF-8 encoding for file system: match modern Linux
        env = {"LANG": "C.UTF-8"},
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
        name = ("erlang" if (not mode) else mode[1:]) + "_nonroot_" + arch + distro_suffix,
        architecture = arch,
        base = ("erlang" if (not mode) else mode[1:]) + "_root_" + arch + distro_suffix,
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

