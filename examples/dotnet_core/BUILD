# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_commit")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

container_image(
    name = "dotnet_core_base",
    base = "//experimental/dotnet_core_runtime:dotnet_core_runtime",
    cmd = "",
    entrypoint = "",
)

container_run_and_commit(
    name = "dotnet_publish",
    commands = [
        "dotnet restore",
        "dotnet publish --configuration Release",
    ],
    image = ":dotnet_publish.tar",
)

container_image(
    name = "hello",
    base = ":dotnet_core_base.tar",
    # base = "//experimental/dotnet_core_runtime:dotnet_core_runtime",
    cmd = [
        "dotnet",
        "/bin/Release/netcoreapp3.1/Hello.dll",
    ],
    # files = [":bin"],
)

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_test(
    name = "hello_test",
    size = "small",
    configs = ["testdata/hello.yaml"],
    image = ":hello",
)
