package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

DISTRO_SUFFIXES = ("_debian9", "_debian10")

[container_image(
    name = rule_name,
    base = base_image,
    cmd = ["/jetty/start.jar"],
    ports = ["8080"],
    tars = ["@jetty//:tar"],
    workdir = "/jetty",
    # We expect users to add their WAR under /jetty/webapps.
) for (rule_name, base_image) in [
    ("jetty_java8_debian9", "//java:java8_debian9"),
    ("jetty_java8_debug_debian9", "//java:java8_debug_debian9"),
    ("jetty_java11_debian9", "//java:java11_debian9"),
    ("jetty_java11_debug_debian9", "//java:java11_debug_debian9"),
    ("jetty_java11_debian10", "//java:java11_debian10"),
    ("jetty_java11_debug_debian10", "//java:java11_debug_debian10"),
]]

container_test(
    name = "jetty_java8_debian9_test",
    configs = ["testdata/java8.yaml"],
    image = ":jetty_java8_debian9",
)

container_test(
    name = "jetty_java8_debug_debian9_test",
    configs = ["testdata/java8_debug.yaml"],
    image = ":jetty_java8_debug_debian9",
)

[container_test(
    name = "jetty_java11" + distro_suffix + "_test",
    configs = ["testdata/java11.yaml"],
    image = ":jetty_java11" + distro_suffix,
) for distro_suffix in DISTRO_SUFFIXES]

[container_test(
    name = "jetty_java11_debug" + distro_suffix + "_test",
    configs = ["testdata/java11_debug.yaml"],
    image = ":jetty_java11_debug" + distro_suffix,
) for distro_suffix in DISTRO_SUFFIXES]
