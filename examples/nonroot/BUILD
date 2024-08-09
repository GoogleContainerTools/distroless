# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_go//go:def.bzl", "go_binary")
load("@rules_distroless//distroless:defs.bzl", "home", "passwd")
load("@rules_oci//oci:defs.bzl", "oci_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//base:distro.bzl", "DISTROS")

# Create a passwd file and home directory with a nonroot user and uid.
passwd(
    name = "passwd",
    entries = [
        {
            "gecos": ["nonroot"],
            "gid": 1000,
            "home": "/home",
            "shell": "/bin/bash",
            "uid": 1002,
            "username": "nonroot",
        },
    ],
)

home(
    name = "home",
    dirs = [
        {
            "home": "/home",
            "uid": 1002,
            "gid": 1000,
        },
    ],
)

# Include it in our image as a tar.
oci_image(
    name = "passwd_image",
    base = "//base:base_root_amd64_debian12",
    tars = [
        ":passwd",
        ":home",
    ],
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
    srcs = [":user"],
)

[oci_image(
    name = "check_user_image_" + distro,
    base = ":passwd_image",
    tars = [":user_tar"],
    visibility = ["//visibility:private"],
) for distro in DISTROS]

# Test to verify this works :)
[container_structure_test(
    name = "check_user_" + distro + "_test",
    configs = ["testdata/user.yaml"],
    image = ":check_user_image_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
    visibility = ["//visibility:private"],
) for distro in DISTROS]
