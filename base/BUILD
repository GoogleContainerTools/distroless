package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_file")
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

load("//cacerts:cacerts.bzl", "cacerts")

cacerts(
    name = "cacerts",
)

load("@package_bundle//file:packages.bzl", "packages")

# Create /tmp, too many things assume it exists.
# tmp.tar has a /tmp with the correct permissions 01777
# A tar is needed because at the moment there is no way to create a diretory with specific permissions

docker_build(
    name = "base",
    debs = [
        packages["libc6"],
        packages["libssl1.0.0"],
        packages["openssl"],
        packages["netbase"],
        packages["tzdata"],
    ],
    tars = [
        ":base_passwd.passwd.tar",
        ":cacerts.tar",
        ":tmp.tar",
        "@debian_jessie//file:os_release.tar",
    ],
)

# A debug image with busybox available.
docker_build(
    name = "debug",
    base = ":base",
    directory = "/",
    entrypoint = ["/busybox/sh"],
    env = {"PATH": "/busybox"},
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
