load("@io_bazel_rules_docker//go:image.bzl", "go_image")
load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_entry", "passwd_file")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@runtimes_common//structure_tests:tests.bzl", "structure_test")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")

# Create a passwd file with a nonroot user and uid.
passwd_entry(
    name = "nonroot_user",
    info = "nonroot",
    uid = 1002,
    username = "nonroot",
)

passwd_file(
    name = "passwd",
    entries = [
        ":nonroot_user",
    ],
)

pkg_tar(
    name = "passwd_tar",
    srcs = [":passwd"],
    mode = "0644",
    package_dir = "etc",
)

# Include it in our image as a tar.
docker_build(
    name = "passwd_image",
    base = "//base:base",
    tars = [":passwd_tar"],
    user = "nonroot",
    visibility = ["//visibility:private"],
)

# Simple go program to print out the username and uid.
go_binary(
    name = "user",
    srcs = ["testdata/user.go"],
    pure = "on",
)

docker_build(
    name = "check_user_image",
    base = ":passwd_image",
    files = [":user"],
    visibility = ["//visibility:private"],
)

# Test to verify this works :)
structure_test(
    name = "check_user_test",
    config = "testdata/user.yaml",
    image = ":check_user_image",
    visibility = ["//visibility:private"],
)
