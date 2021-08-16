package(default_visibility = ["//visibility:public"])

load(":base.bzl", "NONROOT", "distro_components")
load(":distro.bzl", "DISTRO_SUFFIXES")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//contrib:group.bzl", "group_entry", "group_file")
load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_entry", "passwd_tar")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

NOBODY = 65534

# Create /etc/passwd with the root user
passwd_entry(
    name = "root_user",
    gid = 0,
    home = "/root",
    info = "root",
    shell = "/sbin/nologin",
    uid = 0,
    username = "root",
)

passwd_entry(
    name = "nobody_user",
    create_home = False,
    gid = NOBODY,
    home = "/nonexistent",
    info = "nobody",
    shell = "/sbin/nologin",
    uid = NOBODY,
    username = "nobody",
)

passwd_entry(
    name = "nonroot_user",
    gid = NONROOT,
    home = "/home/nonroot",
    info = "nonroot",
    shell = "/sbin/nologin",
    uid = NONROOT,
    username = "nonroot",
)

passwd_tar(
    name = "passwd",
    entries = [
        ":root_user",
        ":nobody_user",
        ":nonroot_user",
    ],
    passwd_file_pkg_dir = "etc",
)

# Create /etc/group with the root, tty, and staff groups
group_entry(
    name = "root_group",
    gid = 0,
    groupname = "root",
)

group_entry(
    name = "nobody_group",
    gid = NOBODY,
    groupname = "nobody",
)

group_entry(
    name = "nonroot_group",
    gid = NONROOT,
    groupname = "nonroot",
)

group_entry(
    name = "tty_group",
    gid = 5,
    groupname = "tty",
)

group_entry(
    name = "staff_group",
    gid = 50,
    groupname = "staff",
)

group_file(
    name = "group",
    entries = [
        ":root_group",
        ":nobody_group",
        ":tty_group",
        ":staff_group",
        ":nonroot_group",
    ],
)

pkg_tar(
    name = "group_tar",
    srcs = [":group"],
    mode = "0644",
    package_dir = "etc",
)

# TODO once all builds use _debian11, remove this
[distro_components(suffix) for suffix in (DISTRO_SUFFIXES + ["_debian11"])]
