package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

container_image(
    name = "hello",
    base = "//experimental/dotnet:dotnet",
    cmd = [
        "dotnet",
        "/bin/Release/netcoreapp2.0/hello.dll",
    ],
    files = [":bin"],
)

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_test(
    name = "hello_test",
    size = "small",
    configs = ["testdata/hello.yaml"],
    image = ":hello",
)
