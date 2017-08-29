package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@runtimes_common//structure_tests:tests.bzl", "structure_test")
load("@debian_jessie_amd64//debs:deb_packages.bzl", "debian_jessie_amd64")

docker_build(
    name = "python27",
    base = "//base:base",
    debs = [
        debian_jessie_amd64["zlib1g"],
        debian_jessie_amd64["python2.7-minimal"],
        debian_jessie_amd64["libpython2.7-minimal"],
        debian_jessie_amd64["libpython2.7-stdlib"],
    ],
    entrypoint = [
        "/usr/bin/python2.7",
    ],
    symlinks = {
        "/usr/bin/python": "/usr/bin/python2.7",
    },
)

structure_test(
    name = "python27_test",
    config = "testdata/python27.yaml",
    image = ":python27",
)
