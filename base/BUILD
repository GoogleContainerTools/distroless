package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

# Create /tmp, too many things assume it exists.
docker_build(
    name = "with_tmp",
    directory = "/tmp",
    files = [":empty"],
)

docker_build(
    name = "base",
    base = ":with_tmp",
    debs = [
        "@glibc//file",
        "@libssl//file",
        "@openssl//file",
    ],
)

# An intermediate image for Java and other "mostly statically compiled languages"
docker_build(
    name = "cc",
    base = ":base",
    debs = [
        "@libgcc1//file",
        "@libstdcpp6//file",
    ],
)

load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

structure_test(
    name = "base_test",
    config = "testdata/base.yaml",
    image = ":base",
)

# For convenience, rename busybox-x86_64 to busybox.
genrule(
    name = "_busybox",
    srcs = ["@busybox//file"],
    outs = ["busybox"],
    cmd = "mv $(<) $(@)",
    visibility = ["//visibility:private"],
)

# A debug image with busybox available.
docker_build(
    name = "debug",
    base = ":cc",
    entrypoint = ["/busybox"],
    files = [
        ":busybox",
    ],
)
