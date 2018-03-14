package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@package_bundle//file:packages.bzl", "packages")

[docker_build(
    name = "dotnet" if (not mode) else mode[1:],
    base = "//cc" + mode,
    debs = [
        packages["libcurl3"],
        packages["libgssapi-krb5-2"],
        packages["libicu57"],
        packages["liblttng-ust0"],
        packages["libunwind8"],
        packages["libuuid1"],
        packages["liblzma5"],
    ],
    entrypoint = [
        #"/opt/dotnet/dotnet",
    ],
    symlinks = {
        "/usr/bin/dotnet": "/opt/dotnet/dotnet",
    },
    tars = ["@dotnet//:tar"],
) for mode in [
    "",
    ":debug",
]]
