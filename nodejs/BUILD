load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//base:distro.bzl", "DISTROS")
load("//nodejs:node_arch.bzl", "node_arch")

package(default_visibility = ["//visibility:public"])

NODEJS_MAJOR_VERISONS = ("20", "22", "24")

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
            for arch in node_arch(major_version)
        ],
    )
    for mode in MODE
    for user in USER
    for major_version in NODEJS_MAJOR_VERISONS
    for distro in DISTROS
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
    for arch in node_arch(major_version)
    for distro in DISTROS
]

[
    container_structure_test(
        name = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = [
            "testdata/nodejs" + major_version + ".yaml",
            "testdata/check_headers.yaml",
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
    for arch in node_arch(major_version)
    for distro in DISTROS
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
    for arch in node_arch(major_version)
    for distro in DISTROS
]

[
    container_structure_test(
        name = "check_certificate_nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/check_certificate.yaml"],
        image = "check_certificate_nodejs" + major_version + ("" if (not mode) else mode) + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for mode in MODE
    for user in USER
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in node_arch(major_version)
    for distro in DISTROS
]
