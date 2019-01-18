package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

# These examples are adapted from:
# https://howtonode.org/hello-node
container_image(
    name = "hello",
    base = "//experimental/nodejs:nodejs",
    cmd = ["hello.js"],
    files = [":hello.js"],
)

container_image(
    name = "hello_http",
    base = "//experimental/nodejs:nodejs",
    cmd = ["hello_http.js"],
    files = [":hello_http.js"],
    ports = ["8000"],
)

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_test(
    name = "hello_test",
    configs = ["testdata/hello.yaml"],
    image = ":hello",
)
