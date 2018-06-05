package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

# These examples are adapted from:
# https://howtonode.org/hello-node
docker_build(
    name = "hello",
    base = "//experimental/nodejs:nodejs",
    cmd = ["hello.js"],
    files = [":hello.js"],
)

docker_build(
    name = "hello_http",
    base = "//experimental/nodejs:nodejs",
    cmd = ["hello_http.js"],
    files = [":hello_http.js"],
    ports = ["8000"],
)

load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

structure_test(
    name = "hello_test",
    config = "testdata/hello.yaml",
    image = ":hello",
)
