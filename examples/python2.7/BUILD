load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@subpar//:subpar.bzl", "par_binary")

par_binary(
    name = "hello_py",
    srcs = ["hello.py"],
    main = "hello.py",
)

# This example runs a python program that walks the filesystem under "/etc" and prints every filename.
docker_build(
    name = "hello",
    base = "//python2.7:python27",
    cmd = [
        "/hello_py.par",
        "/etc",
    ],
    files = [":hello_py.par"],
)
