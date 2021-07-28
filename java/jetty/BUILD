package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

[container_image(
    name = rule_name,
    base = base_image,
    cmd = ["/jetty/start.jar"],
    ports = ["8080"],
    tars = ["@jetty//:tar"],
    workdir = "/jetty",
    # We expect users to add their WAR under /jetty/webapps.
) for (rule_name, base_image) in [
    ("jetty_java11_debian10", "//java:java11_root_debian10"),
    ("jetty_java11_debug_debian10", "//java:java11_debug_root_debian10"),
]]

[container_test(
    name = "jetty_java11" + distro_suffix + "_test",
    configs = ["testdata/java11.yaml"],
    image = ":jetty_java11" + distro_suffix,
    tags = [
        "amd64",
        "manual",
    ],
) for distro_suffix in DISTRO_SUFFIXES]

[container_test(
    name = "jetty_java11_debug" + distro_suffix + "_test",
    configs = ["testdata/java11_debug.yaml"],
    image = ":jetty_java11_debug" + distro_suffix,
    tags = [
        "amd64",
        "manual",
    ],
) for distro_suffix in DISTRO_SUFFIXES]
