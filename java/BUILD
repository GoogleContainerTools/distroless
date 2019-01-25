package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("@package_bundle//file:packages.bzl", "packages")
load("//cacerts:java.bzl", "cacerts_java")

cacerts_java(
    name = "cacerts_java",
)

[container_image(
    name = "java8" if (not mode) else mode[1:],
    base = "//cc" + mode,
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
    tars = [":cacerts_java"],
) for mode in [
    "",
    ":debug",
]]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_test(
    name = "java8_test",
    configs = ["testdata/java8.yaml"],
    image = ":java8",
)

container_test(
    name = "java8_debug_test",
    configs = ["testdata/java8_debug.yaml"],
    image = ":debug",
)

java_image(
    name = "check_certs_java8",
    srcs = ["testdata/CheckCerts.java"],
    base = "//java:java8",
    main_class = "testdata.CheckCerts",
)

container_test(
    name = "check_certs_java8_test",
    configs = ["testdata/java8_certs.yaml"],
    image = ":check_certs_java8",
)
