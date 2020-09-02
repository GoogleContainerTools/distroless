# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//base:distro.bzl", "DISTRO_SUFFIXES")

# These examples are adapted from:
# https://howtonode.org/hello-node
[
    container_image(
        name = "hello" + distro_suffix,
        base = "//experimental/nodejs:nodejs14" + distro_suffix,
        cmd = ["hello.js"],
        files = [":hello.js"],
    )
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_image(
        name = "hello_http" + distro_suffix,
        base = "//experimental/nodejs:nodejs14" + distro_suffix,
        cmd = ["hello_http.js"],
        files = [":hello_http.js"],
        ports = ["8000"],
    )
    for distro_suffix in DISTRO_SUFFIXES
]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_test(
    name = "hello_test",
    configs = ["testdata/hello.yaml"],
    image = ":hello",
)
