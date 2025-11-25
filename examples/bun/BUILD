
# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_oci//oci:defs.bzl", "oci_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

package(default_visibility = ["//visibility:public"])

ARCHITECTURES = [
    "amd64",
    "arm64",
]

DISTROS = [
    "debian12",
    "debian13",
]

pkg_tar(
    name = "hello_tar",
    srcs = [
        "hello.ts",
    ],
)

pkg_tar(
    name = "hello_serve_tar",
    srcs = [
        "hello_serve.ts",
    ],
)

[
    oci_image(
        name = "hello_" + user + "_" + arch + "_" + distro,
        base = "//bun:bun_" + user + "_" + arch + "_" + distro,
        cmd = ["hello.ts"],
        tars = [":hello_tar"],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for arch in ARCHITECTURES
    for distro in DISTROS
]

[
    oci_image(
        name = "hello_serve_" + user + "_" + arch + "_" + distro,
        base = "//bun:bun_" + user + "_" + arch + "_" + distro,
        cmd = ["hello_serve.ts"],
        tars = [":hello_serve_tar"],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for arch in ARCHITECTURES
    for distro in DISTROS
]

[
    container_structure_test(
        name = "hello_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/hello.yaml"],
        image = ":hello_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for user in [
        "root",
        "nonroot",
    ]
    for arch in ARCHITECTURES
    for distro in DISTROS
]
