package(default_visibility = ["//visibility:public"])

# Go boilerplate
load("@io_bazel_rules_docker//docker/contrib/go:image.bzl", "go_image")

go_image(
    name = "go_example",
    srcs = ["main.go"],
    base = "//base:base",
)
