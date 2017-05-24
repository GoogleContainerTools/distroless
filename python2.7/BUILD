package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

docker_build(
    name = "python27",
    base = "//base:base",
    debs = [
        "@zlib//file",
        "@python27//file",
        "@libpython27//file",
        "@libpython27_stdlib//file",
    ],
    entrypoint = [
        "/usr/bin/python2.7",
    ],
)

structure_test(
    name = "python27_test",
    config = "testdata/python27.yaml",
    image = ":python27",
)
