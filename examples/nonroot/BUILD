# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "structure_test")
load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_entry", "passwd_file")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")
load("//base:distro.bzl", "DISTROS")

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
oci_image(
    name = "passwd_image",
    base = "//base:base_root_amd64_debian11",
    tars = [":passwd_tar"],
    user = "nonroot",
    visibility = ["//visibility:private"],
)

# Simple go program to print out the username and uid.
go_binary(
    name = "user",
    srcs = ["testdata/user.go"],
    goarch = "amd64",
    # Test image is linux based
    goos = "linux",
    pure = "on",
)


pkg_tar(
    name = "user_tar",
    srcs = [":user"]
)


[oci_image(
    name = "check_user_image_" + distro,
    base = ":passwd_image",
    tars = [":user_tar"],
    visibility = ["//visibility:private"],
) for distro in DISTROS]

# Test to verify this works :)
[structure_test(
    name = "check_user_" + distro + "_test",
    config = ["testdata/user.yaml"],
    image = ":check_user_image_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
    visibility = ["//visibility:private"],
) for distro in DISTROS]
