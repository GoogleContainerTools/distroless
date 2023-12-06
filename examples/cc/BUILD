# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("//base:distro.bzl", "DISTROS")
load("@contrib_rules_oci//oci:defs.bzl", "structure_test")
load("//private/oci:defs.bzl", "cc_image")

package(default_visibility = ["//visibility:public"])

[cc_image(
    name = "hello_" + distro,
    srcs = ["hello.c"],
    base = "//cc:cc_root_amd64_" + distro,
) for distro in DISTROS]

[cc_image(
    name = "hello_cc_" + distro,
    srcs = ["hello_cc.cc"],
    base = "//cc:cc_root_amd64_" + distro,
) for distro in DISTROS]

[structure_test(
    name = "hello_" + distro + "_test",
    size = "small",
    config = [
        "testdata/hello_" + distro + ".yaml",
        "testdata/usrmerge.yaml",
    ],
    image = ":hello_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
) for distro in DISTROS]

[structure_test(
    name = "hello_cc_" + distro + "_test",
    size = "small",
    config = [
        "testdata/hello_cc_" + distro + ".yaml",
        "testdata/usrmerge.yaml",
    ],
    image = ":hello_cc_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
) for distro in DISTROS]
