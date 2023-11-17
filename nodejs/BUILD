load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_image_index", "structure_test")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//common:variables.bzl", "variables")

package(default_visibility = ["//visibility:public"])

NODEJS_MAJOR_VERISONS = ("18", "20")

MODE = [
    "",
    "_debug",
]

USER = [
    "root",
    "nonroot",
]

[
    oci_image_index(
        name = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + distro,
        images = [
            "nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro
            for arch in variables.ARCHS
        ],
    )
    for mode in MODE
    for user in USER
    for major_version in NODEJS_MAJOR_VERISONS
    for distro in variables.DISTS
]

[
    oci_image(
        name = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_" + user + "_" + arch + "_" + distro,
        entrypoint = ["/nodejs/bin/node"],
        tars = [
            "@nodejs" + major_version + "_" + arch,
        ],
    )
    for mode in MODE
    for user in USER
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in variables.ARCHS
    for distro in variables.DISTS
]

[
    structure_test(
        name = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro + "_test",
        config = [
            "testdata/nodejs" + major_version + ".yaml",
            "testdata/check_npm.yaml",
        ],
        image = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for mode in MODE
    for user in USER
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in variables.ARCHS
    for distro in variables.DISTS
]

pkg_tar(
    name = "check_certificate",
    srcs = ["testdata/check_certificate.js"],
)

[
    oci_image(
        name = "check_certificate_nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro,
        base = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro,
        tars = [
            ":check_certificate",
        ],
    )
    for mode in MODE
    for user in USER
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in variables.ARCHS
    for distro in variables.DISTS
]

[
    structure_test(
        name = "check_certificate_nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro + "_test",
        config = ["testdata/check_certificate.yaml"],
        image = "check_certificate_nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for mode in MODE
    for user in USER
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in variables.ARCHS
    for distro in variables.DISTS
]
