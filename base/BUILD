package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@io_bazel_rules_docker//docker/contrib:passwd.bzl", "passwd_file")
load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

# Create a default passwd_file rule.

passwd_file(
    name = "base_passwd",
    gid = 0,
    info = "root",
    uid = 0,
    username = "root",
)

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
    tars = [":base_passwd.passwd.tar"],
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

structure_test(
    name = "base_test",
    config = "testdata/base.yaml",
    image = ":base",
)
