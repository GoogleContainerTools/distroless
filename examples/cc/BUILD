# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//base:distro.bzl", "DISTRO_SUFFIXES")

[container_image(
    name = "hello" + distro_suffix,
    base = "//cc:cc_root_amd64" + distro_suffix,
    entrypoint = ["./hello"],
    files = [":bin/hello"],
) for distro_suffix in DISTRO_SUFFIXES]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

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
