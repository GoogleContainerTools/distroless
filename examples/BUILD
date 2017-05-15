package(default_visibility = ["//visibility:public"])

# Go boilerplate
load("@io_bazel_rules_go//go:def.bzl", "go_binary")
load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

go_binary(
    name = "hello_go",
    srcs = ["main.go"],
)

docker_build(
    name = "go_example",
    base = "//base:base",
    cmd = ["./hello_go"],
    files = [":hello_go"],
)
