# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("//base:distro.bzl", "DISTRO_SUFFIXES")

[
    java_image(
        name = "hello_" + user + distro_suffix,
        srcs = ["HelloJava.java"],
        base = "//java:java11_" + user + distro_suffix,
        main_class = "examples.HelloJava",
    )
    for user in [
        "root",
        "nonroot",
    ]
    for distro_suffix in DISTRO_SUFFIXES
]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

[
    container_test(
        name = "hello_" + user + distro_suffix + "_test",
        size = "small",
        configs = ["testdata/hello_" + user + distro_suffix + ".yaml"],
        image = ":hello_" + user + distro_suffix,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for distro_suffix in DISTRO_SUFFIXES
]
