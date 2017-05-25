package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

docker_build(
    name = "nodejs",
    base = "//cc:cc",
    entrypoint = ["/nodejs/bin/node"],
    tars = ["@nodejs//:tar"],
)
