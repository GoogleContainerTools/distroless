load("@io_bazel_rules_docker//python:image.bzl", "py_image")
load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

py_image(
    name = "hello_py",
    srcs = ["hello.py"],
    base = "//experimental/python3:python3",
    main = "hello.py",
)

# This example runs a python program that walks the filesystem under "/etc" and prints every filename.
docker_build(
    name = "hello",
    base = ":hello_py",
    cmd = ["/etc"],
)
