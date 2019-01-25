package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

[container_image(
    name = "jetty" if (mode == ":java8") else mode[1:],
    base = "//java" + mode,
    cmd = ["/jetty/start.jar"],
    ports = ["8080"],
    tars = ["@jetty//:tar"],
    workdir = "/jetty",
    # We expect users to add their WAR under /jetty/webapps.
) for mode in [
    ":java8",
    ":debug",
]]
