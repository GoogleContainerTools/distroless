# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTROS")
load("@io_bazel_rules_docker//cc:image.bzl", "cc_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

cc_binary(
    name = "hello",
    srcs = ["hello.c"],
)

cc_binary(
    name = "hello_cc",
    srcs = ["hello_cc.cc"],
)

[cc_image(
    name = "hello_" + distro,
    base = "//cc:cc_root_amd64_" + distro,
    binary = ":hello",
) for distro in DISTROS]

[cc_image(
    name = "hello_cc_" + distro,
    base = "//cc:cc_root_amd64_" + distro,
    binary = ":hello_cc",
) for distro in DISTROS]

[container_test(
    name = "hello_" + distro + "_test",
    size = "small",
    configs = ["testdata/hello.yaml"],
    image = ":hello_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
) for distro in DISTROS]

[container_test(
    name = "hello_cc_" + distro + "_test",
    size = "small",
    configs = ["testdata/hello_cc.yaml"],
    image = ":hello_cc_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
) for distro in DISTROS]
