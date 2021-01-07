package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

[
    container_image(
        name = rule_name,
        architecture = arch,
        base = base_image,
        cmd = ["/jetty/start.jar"],
        ports = ["8080"],
        tars = ["@jetty//:tar"],
        workdir = "/jetty",
        # We expect users to add their WAR under /jetty/webapps.
    )
    for arch in ARCHITECTURES
    for (rule_name, base_image) in [
        (
            "jetty_java8_" + arch + "_debian9",
            "//java:java8_root_" + arch + "_debian9",
        ),
        (
            "jetty_java8_debug_" + arch + "_debian9",
            "//java:java8_debug_root_" + arch + "_debian9",
        ),
        (
            "jetty_java11_" + arch + "_debian9",
            "//java:java11_root_" + arch + "_debian9",
        ),
        (
            "jetty_java11_debug_" + arch + "_debian9",
            "//java:java11_debug_root_" + arch + "_debian9",
        ),
        (
            "jetty_java11_" + arch + "_debian10",
            "//java:java11_root_" + arch + "_debian10",
        ),
        (
            "jetty_java11_debug_" + arch + "_debian10",
            "//java:java11_debug_root_" + arch + "_debian10",
        ),
    ]
]

[
    container_test(
        name = "jetty_java8_" + arch + "_debian9_test",
        configs = ["testdata/java8.yaml"],
        image = ":jetty_java8_" + arch + "_debian9",
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
]

[
    container_test(
        name = "jetty_java8_debug_" + arch + "_debian9_test",
        configs = ["testdata/java8_debug.yaml"],
        image = ":jetty_java8_debug_" + arch + "_debian9",
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
]

[
    container_test(
        name = "jetty_java11" + "_" + arch + distro_suffix + "_test",
        configs = ["testdata/java11.yaml"],
        image = ":jetty_java11" + "_" + arch + distro_suffix,
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_test(
        name = "jetty_java11_debug" + "_" + arch + distro_suffix + "_test",
        configs = ["testdata/java11_debug.yaml"],
        image = ":jetty_java11_debug" + "_" + arch + distro_suffix,
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for distro_suffix in DISTRO_SUFFIXES
]
