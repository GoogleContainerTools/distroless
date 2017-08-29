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

load("//cacerts:cacerts.bzl", "cacerts")

cacerts(
    name = "cacerts",
)

load("@debian_jessie_amd64//debs:deb_packages.bzl", "debian_jessie_amd64")

# Create /tmp, too many things assume it exists.
# tmp.tar has a /tmp with the correct permissions 01777
# A tar is needed because at the moment there is no way to create a diretory with specific permissions

docker_build(
    name = "base",
    debs = [
        debian_jessie_amd64["libc6"],
        debian_jessie_amd64["libssl1.0.0"],
        debian_jessie_amd64["openssl"],
        debian_jessie_amd64["netbase"],
    ],
    tars = [
        ":base_passwd.passwd.tar",
        ":cacerts.tar",
        ":tmp.tar",
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
