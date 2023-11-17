load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_entry", "passwd_tar")
load("//common:variables.bzl", "variables")
load(":base.bzl", "base_images")

package(default_visibility = ["//visibility:public"])

# TODO: remove these once rules_distroless passwd creates home directories as well
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
    gid = variables.NOBODY,
    home = "/nonexistent",
    info = "nobody",
    shell = "/sbin/nologin",
    uid = variables.NOBODY,
    username = "nobody",
)

passwd_entry(
    name = "nonroot_user",
    gid = variables.NONROOT,
    home = "/home/nonroot",
    info = "nonroot",
    shell = "/sbin/nologin",
    uid = variables.NONROOT,
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

[
    base_images(dist = dist)
    for dist in variables.DISTS
]
