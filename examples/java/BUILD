# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "structure_test")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//base:distro.bzl", DISTROS = "LANGUAGE_DISTROS")

package(default_visibility = ["//visibility:public"])

java_binary(
    name = "hello",
    srcs = ["HelloJava.java"],
    main_class = "examples.HelloJava",
)

pkg_tar(
    name = "hello_tar",
    srcs = [
        ":hello"
    ]
)

[
    oci_image(
        name = "hello_" + user + "_" + distro,
        base = "//java:java11_" + user + "_arm64" + "_" + distro,
        cmd = [
            "/hello.jar"
        ],
        tars = [
            ":hello_tar"
        ]
    )
    for user in [
        "root",
        "nonroot",
    ]
    for distro in DISTROS
]

[
    structure_test(
        name = "hello_" + user + "_" + distro + "_test",
        size = "small",
        config = ["testdata/hello_" + user + "_" + distro + ".yaml"],
        image = ":hello_" + user + "_" + distro,
        tags = [
            "arm64"
        ],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for distro in DISTROS
]
