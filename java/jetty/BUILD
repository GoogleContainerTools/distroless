package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

[docker_build(
    name = rule_name,
    base = "//java:java8" if (not ("debug" in rule_name)) else "//java:java8_debug",
    cmd = ["/jetty/start.jar"],
    ports = ["8080"],
    tars = ["@jetty//:tar"],
    workdir = "/jetty",
    # We expect users to add their WAR under /jetty/webapps.
) for rule_name in [
    "jetty_java8",
    "jetty_java8_debug",
]]
