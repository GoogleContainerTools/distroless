# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@container_structure_test//:defs.bzl", "container_structure_test")
load("//private/oci:defs.bzl", "java_image")

package(default_visibility = ["//visibility:public"])

JAVA_VERSIONS_PER_DISTRO = [
    ("17", "debian12"),
]

[
    java_image(
        name = "hello_java" + java_version + "_" + user + "_" + distro,
        srcs = ["HelloJava.java"],
        base = "//java:java" + java_version + "_" + user + "_amd64" + "_" + distro,
        main_class = "examples.HelloJava",
    )
    for user in [
        "root",
        "nonroot",
    ]
    for java_version, distro in JAVA_VERSIONS_PER_DISTRO
]

[
    container_structure_test(
        name = "hello_java" + java_version + "_" + user + "_" + distro + "_test",
        size = "small",
        configs = ["testdata/hello_" + user + "_" + distro + ".yaml"],
        image = ":hello_java" + java_version + "_" + user + "_" + distro,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for java_version, distro in JAVA_VERSIONS_PER_DISTRO
]
