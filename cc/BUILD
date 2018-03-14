package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@package_bundle//file:packages.bzl", "packages")

# An intermediate image for Java and other "mostly statically" compiled languages
[docker_build(
    name = "cc" if (not mode) else mode[1:],
    base = "//base" + mode,
    debs = [
        packages["libgcc1"],
        packages["libgomp1"],
        packages["libstdc++6"],
    ],
) for mode in [
    "",
    ":debug",
]]
