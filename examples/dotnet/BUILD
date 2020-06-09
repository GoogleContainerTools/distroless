# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

[container_image(
    name = "hello" + suffix,
    base = "//experimental/dotnet:dotnet" + suffix,
    cmd = [
        "dotnet",
        "/bin/Release/netcoreapp" + version + "/hello.dll",
    ],
    files = [":bin"],
) for (version, suffix) in (
    ("2.0", ""),
    ("3.1", "_core_aspnet_debian10"),
    ("3.1", "_core_runtime_debian10"),
    ("3.1", "_core_sdk_debian10"),
)]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

[container_test(
    name = "hello" + suffix + "_test",
    size = "small",
    configs = ["testdata/hello" + suffix + ".yaml"],
    image = ":hello" + suffix,
) for suffix in ("", "_core_aspnet_debian10", "_core_runtime_debian10", "_core_sdk_debian10")]
