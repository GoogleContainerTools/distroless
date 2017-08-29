package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@debian_jessie_amd64//debs:deb_packages.bzl", "debian_jessie_amd64")

# An intermediate image for Java and other "mostly statically" compiled languages
docker_build(
    name = "cc",
    base = "//base:base",
    debs = [
        debian_jessie_amd64["libgcc1"],
        debian_jessie_amd64["libstdc++6"],
    ],
)
