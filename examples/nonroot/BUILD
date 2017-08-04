load("@io_bazel_rules_docker//docker/contrib/go:image.bzl", "go_image")
load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@io_bazel_rules_docker//docker/contrib:passwd.bzl", "passwd_file")
load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

# Create a passwd file with a nonroot user and uid.
passwd_file(
    name = "nonroot",
    info = "nonroot",
    uid = 1002,
    username = "nonroot",
)

# Include it in our image as a tar.
docker_build(
    name = "passwd_image",
    base = "//base:base",
    tars = [":nonroot.passwd.tar"],
    user = "nonroot",
    visibility = ["//visibility:private"],
)

# Simple go program to print out the username and uid.
go_image(
    name = "user",
    srcs = ["testdata/user.go"],
    base = ":passwd_image",
    visibility = ["//visibility:private"],
)

# Test to verify this works :)
structure_test(
    name = "passwd_test",
    config = "testdata/user.yaml",
    image = ":user",
    visibility = ["//visibility:private"],
)
