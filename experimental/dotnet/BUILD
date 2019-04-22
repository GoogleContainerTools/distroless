package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@package_bundle//file:packages.bzl", "packages")

[container_image(
    name = "dotnet" if (not mode) else mode[1:],
    base = "//cc" + mode,
    debs = [
        packages["libcurl3"],
        packages["libkrb5-3"],
        packages["libicu57"],
        packages["liblttng-ust0"],
        packages["libssl1.0.2"],
        packages["zlib1g"],
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
