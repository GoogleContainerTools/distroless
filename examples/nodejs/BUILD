# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//base:distro.bzl", "DISTROS")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

# These examples are adapted from:
# https://howtonode.org/hello-node
[
    container_image(
        name = "hello_" + arch + "_" + distro,
        architecture = arch,
        base = "//nodejs:nodejs16_" + arch + "_" + distro,
        cmd = ["hello.js"],
        files = [":hello.js"],
    )
    for arch in ARCHITECTURES
    for distro in DISTROS
]

[
    container_image(
        name = "hello_http_" + arch + "_" + distro,
        architecture = arch,
        base = "//nodejs:nodejs16_" + arch + "_" + distro,
        cmd = ["hello_http.js"],
        files = [":hello_http.js"],
        ports = ["8000"],
    )
    for arch in ARCHITECTURES
    for distro in DISTROS
]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

[
    container_test(
        name = "hello_" + arch + "_" + distro + "_test",
        configs = ["testdata/hello.yaml"],
        image = ":hello_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for distro in DISTROS
]
