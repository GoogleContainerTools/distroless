# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_SUFFIXES")
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
    name = "hello" + distro_suffix,
    base = "//cc:cc_root_amd64" + distro_suffix,
    binary = ":hello",
) for distro_suffix in DISTRO_SUFFIXES]

[cc_image(
    name = "hello_cc" + distro_suffix,
    base = "//cc:cc_root_amd64" + distro_suffix,
    binary = ":hello_cc",
) for distro_suffix in DISTRO_SUFFIXES]

[container_test(
    name = "hello" + distro_suffix + "_test",
    size = "small",
    configs = ["testdata/hello.yaml"],
    image = ":hello" + distro_suffix,
    tags = [
        "amd64",
        "manual",
    ],
) for distro_suffix in DISTRO_SUFFIXES]

[container_test(
    name = "hello_cc" + distro_suffix + "_test",
    size = "small",
    configs = ["testdata/hello_cc.yaml"],
    image = ":hello_cc" + distro_suffix,
    tags = [
        "amd64",
        "manual",
    ],
) for distro_suffix in DISTRO_SUFFIXES]
