# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

# Go boilerplate
load("@io_bazel_rules_docker//go:image.bzl", "go_image")

go_image(
    name = "go_example",
    srcs = ["main.go"],
    base = "//base:base_root_amd64_debian11",
)
