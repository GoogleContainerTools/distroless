package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@debian_jessie_amd64//debs:deb_packages.bzl", "debian_jessie_amd64")
load("@debian_jessie_backports_amd64//debs:deb_packages.bzl", "debian_jessie_backports_amd64")

docker_build(
    name = "java8",
    base = "//cc:cc",
    debs = [
        debian_jessie_amd64["zlib1g"],
        debian_jessie_backports_amd64["openjdk-8-jre-headless"],
    ],
    entrypoint = [
        "/usr/bin/java",
        "-jar",
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
    ],
    symlinks = {
        "/usr/bin/java": "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java",
    },
)

load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

structure_test(
    name = "java8_test",
    config = "testdata/java.yaml",
    image = ":java8",
)
