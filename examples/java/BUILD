# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("//base:distro.bzl", "DISTROS")

[
    java_image(
        name = "hello_" + user + "_" + distro,
        srcs = ["HelloJava.java"],
        base = "//java:java11_" + user + "_amd64" + "_" + distro,
        main_class = "examples.HelloJava",
    )
    for user in [
        "root",
        "nonroot",
    ]
    for distro in DISTROS
]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

[
    container_test(
        name = "hello_" + user + "_" + distro + "_test",
        size = "small",
        configs = ["testdata/hello_" + user + "_" + distro + ".yaml"],
        image = ":hello_" + user + "_" + distro,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for distro in DISTROS
]
