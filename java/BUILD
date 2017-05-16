package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

docker_build(
    name = "java8",
    base = "//base:cc",
    debs = [
        "@zlib//file",
        "@openjdk_jre8//file",
    ],
    entrypoint = [
        "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java",
        "-jar",
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
    ],
)
