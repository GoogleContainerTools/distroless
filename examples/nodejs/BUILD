# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//base:distro.bzl", "DISTRO_SUFFIXES")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

# These examples are adapted from:
# https://howtonode.org/hello-node
[
    container_image(
        name = "hello_" + arch + distro_suffix,
        architecture = arch,
        base = "//nodejs:nodejs14_" + arch + distro_suffix,
        cmd = ["hello.js"],
        files = [":hello.js"],
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_image(
        name = "hello_http_" + arch + distro_suffix,
        architecture = arch,
        base = "//nodejs:nodejs14_" + arch + distro_suffix,
        cmd = ["hello_http.js"],
        files = [":hello_http.js"],
        ports = ["8000"],
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

[
    container_test(
        name = "hello_" + arch + distro_suffix + "_test",
        configs = ["testdata/hello.yaml"],
        image = ":hello_" + arch + distro_suffix,
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]
