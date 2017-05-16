package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

docker_build(
    name = "java8",
    base = "//base:cc",
    debs = [
        "@zlib//file",
        "@openjdk_jre8//file",
    ],
    entrypoint = [
        "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java",
        "-jar",
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
    ],
)

# The default jetty tarball has a top-level versioned directory. We need to strip this directory
# so that we can unpack directly into /jetty in our final image.
genrule(
    name = "unpacked_jetty",
    srcs = ["@jetty//file"],
    outs = ["_unpacked_jetty.tar.gz"],
    cmd = "mkdir -p $(@D)/jetty && tar --strip-components=1 -xzf $(<) -C $(@D)/jetty && tar -czf $(@) -C $(@D) jetty  && rm -rf $(@D)/jetty",
    visibility = ["//visibility:private"],
)

docker_build(
    name = "jetty",
    base = ":java8",
    cmd = ["/jetty/start.jar"],
    tars = [":_unpacked_jetty.tar.gz"],
    workdir = "/jetty/demo-base/",
)
