package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

docker_build(
    name = "hello",
    base = "//experimental/dotnet:dotnet",
    cmd = [
        "dotnet",
        "/bin/Release/netcoreapp2.0/hello.dll",
    ],
    files = [":bin"],
)

load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

structure_test(
    name = "hello_test",
    size = "small",
    config = "testdata/hello.yaml",
    image = ":hello",
)
