# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("//base:distro.bzl", "DISTROS")
load("@contrib_rules_oci//oci:defs.bzl", "structure_test")
load("//private/oci:defs.bzl", "cc_image")

package(default_visibility = ["//visibility:public"])

[cc_image(
    name = "hello_" + distro,
    base = "//cc:cc_root_amd64_" + distro,
    srcs = ["hello.c"],
) for distro in DISTROS]

[cc_image(
    name = "hello_cc_" + distro,
    base = "//cc:cc_root_amd64_" + distro,
    srcs = ["hello_cc.cc"],
) for distro in DISTROS]

[structure_test(
    name = "hello_" + distro + "_test",
    size = "small",
    config = ["testdata/hello.yaml"],
    image = ":hello_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
) for distro in DISTROS]

[structure_test(
    name = "hello_cc_" + distro + "_test",
    size = "small",
    config = ["testdata/hello_cc.yaml"],
    image = ":hello_cc_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
) for distro in DISTROS]
