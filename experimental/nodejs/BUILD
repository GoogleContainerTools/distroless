package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

[container_image(
    name = "nodejs" if (not mode) else mode[1:],
    base = "//cc" + mode,
    entrypoint = ["/nodejs/bin/node"],
    tars = ["@nodejs//:tar"],
) for mode in [
    "",
    ":debug",
]]
