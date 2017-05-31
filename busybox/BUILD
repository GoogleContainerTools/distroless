package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

# For convenience, rename busybox-x86_64 to busybox.
genrule(
    name = "busybox_tar",
    srcs = ["@busybox//file"],
    outs = ["busybox.tar"],
    cmd = "mkdir busybox; cp $(<) busybox/busybox; cd busybox; \
           for cmd in $$(busybox --list); do \
             ln -s busybox $$cmd; \
           done; \
           cd ..; \
           tar -cf $@ busybox",
)

# A debug image with busybox available.
docker_build(
    name = "debug",
    base = "//cc:cc",
    directory = "/",
    entrypoint = ["/busybox/sh"],
    env = {
        "PATH": "/busybox",
    },
    tars = [
        ":busybox.tar",
    ],
)

structure_test(
    name = "debug_test",
    config = "testdata/debug.yaml",
    image = ":debug",
)
