package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

[container_image(
    name = rule_name,
    base = base_image,
    cmd = ["/jetty/start.jar"],
    ports = ["8080"],
    tars = ["@jetty//:tar"],
    workdir = "/jetty",
    # We expect users to add their WAR under /jetty/webapps.
) for (rule_name, base_image) in [
    ("jetty_java8", "//java:java8"),
    ("jetty_java8_debug", "//java:java8_debug"),
    ("jetty_java11", "//java:java11"),
    ("jetty_java11_debug", "//java:java11_debug"),
]]
