package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@package_bundle//file:packages.bzl", "packages")
load("//cacerts:java.bzl", "cacerts_java")

cacerts_java(
    name = "cacerts_java.tar",
)

docker_build(
    name = "java8",
    base = "//cc:cc",
    debs = [
        packages["zlib1g"],
        packages["openjdk-8-jre-headless"],
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
    tars = [":cacerts_java.tar"],
)

load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

structure_test(
    name = "java8_test",
    config = "testdata/java.yaml",
    image = ":java8",
)
