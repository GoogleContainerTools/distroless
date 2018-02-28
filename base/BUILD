package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_entry", "passwd_file")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@runtimes_common//structure_tests:tests.bzl", "structure_test")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")

# Create a default passwd_file rule.
passwd_entry(
    name = "root_user",
    gid = 0,
    uid = 0,
    username = "root",
)

passwd_file(
    name = "passwd",
    entries = [
        ":root_user",
    ],
)

pkg_tar(
    name = "passwd_tar",
    srcs = [":passwd"],
    mode = "0644",
    package_dir = "etc",
)

load("@package_bundle//file:packages.bzl", "packages")
load("//cacerts:cacerts.bzl", "cacerts")

cacerts(
    name = "cacerts",
    deb = packages["ca-certificates"],
)

# Create /tmp, too many things assume it exists.
# tmp.tar has a /tmp with the correct permissions 01777
# A tar is needed because at the moment there is no way to create a
# directory with specific permissions.

docker_build(
    name = "base",
    debs = [
        packages["libc6"],
        packages["libssl1.0.2"],
        packages["openssl"],
        packages["netbase"],
        packages["tzdata"],
    ],
    env = {"PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"},
    tars = [
        ":passwd_tar",
        ":cacerts.tar",
        ":tmp.tar",
        "@debian_stretch//file:os_release.tar",
    ],
)

# A debug image with busybox available.
docker_build(
    name = "debug",
    base = ":base",
    directory = "/",
    entrypoint = ["/busybox/sh"],
    env = {"PATH": "$PATH:/busybox"},
    tars = ["//busybox:busybox.tar"],
)

structure_test(
    name = "debug_test",
    config = "testdata/debug.yaml",
    image = ":debug",
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
