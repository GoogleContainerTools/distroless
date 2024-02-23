# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_oci//oci:defs.bzl", "oci_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//base:distro.bzl", "DISTROS")

package(default_visibility = ["//visibility:public"])

# These examples are adapted from:
# https://howtonode.org/hello-node

pkg_tar(
    name = "hello_tar",
    srcs = [
        "hello.js",
    ],
)

pkg_tar(
    name = "hello_http_tar",
    srcs = [
        "hello_http.js",
    ],
)

[
    oci_image(
        name = "hello_" + user + "_" + arch + "_" + distro,
        base = "//nodejs:nodejs18_" + user + "_" + arch + "_" + distro,
        cmd = ["hello.js"],
        tars = [":hello_tar"],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for arch in ARCHITECTURES
    for distro in DISTROS
]

[
    oci_image(
        name = "hello_http_" + user + "_" + arch + "_" + distro,
        base = "//nodejs:nodejs18_" + user + "_" + arch + "_" + distro,
        cmd = ["hello_http.js"],
        tars = [":hello_http_tar"],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for arch in ARCHITECTURES
    for distro in DISTROS
]

[
    container_structure_test(
        name = "hello_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/hello.yaml"],
        image = ":hello_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for arch in ARCHITECTURES
    for distro in DISTROS
]
