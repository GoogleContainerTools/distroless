# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@io_bazel_rules_docker//python:image.bzl", "py_image")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

py_image(
    name = "hello_py",
    srcs = ["hello.py"],
    base = "//experimental/python3:python3_root_amd64_debian11",
    main = "hello.py",
)

# This example runs a python program that walks the filesystem under "/etc" and prints every filename.
container_image(
    name = "hello",
    base = ":hello_py",
    cmd = ["/etc"],
)
