package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@io_bazel_rules_docker//docker/contrib:passwd.bzl", "passwd_file")
load("@runtimes_common//structure_tests:tests.bzl", "structure_test")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")

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

load("//cacerts:cacerts.bzl", "cacerts")

cacerts(
    name = "cacerts",
)

docker_build(
    name = "with_certs",
    base = ":with_tmp",
    directory = "/etc/ssl/certs",
    files = [":cacerts"],
)

docker_build(
    name = "base",
    base = ":with_certs",
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

go_binary(
    name = "check_certs",
    srcs = ["testdata/check_certs.go"],
)

docker_build(
    name = "check_certs_image",
    base = "//base:base",
    files = [":check_certs"],
    visibility = ["//visibility:private"],
)

structure_test(
    name = "certs_test",
    config = "testdata/certs.yaml",
    image = ":check_certs_image",
)
