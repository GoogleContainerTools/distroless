package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//base:distro.bzl", "DISTROS")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

NODEJS_MAJOR_VERISONS = ("12", "14", "16")

[
    container_image(
        name = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + arch + "_" + distro,
        architecture = arch,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_root_" + arch + "_" + distro,
        entrypoint = ["/nodejs/bin/node"],
        tars = ["@nodejs" + major_version + "_" + arch + "//:tar"],
    )
    for mode in [
        "",
        "_debug",
    ]
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in ARCHITECTURES
    for distro in DISTROS
]

[
    container_test(
        name = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/nodejs" + major_version + ".yaml"],
        image = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in ARCHITECTURES
    for distro in DISTROS
]

exports_files([
    "testdata/check_certificate.js",
])

[
    container_image(
        name = "check_certificate_nodejs" + major_version + ("" if (not mode) else mode) + "_" + arch + "_" + distro,
        base = "nodejs" + major_version + ("" if (not mode) else mode) + "_" + arch + "_" + distro,
        files = ["testdata/check_certificate.js"],
    )
    for mode in [
        "",
        "_debug",
    ]
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in ARCHITECTURES
    for distro in DISTROS
]

[
    container_test(
        name = "check_certificate_nodejs" + major_version + ("" if (not mode) else mode) + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/check_certificate.yaml"],
        image = "check_certificate_nodejs" + major_version + ("" if (not mode) else mode) + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for major_version in NODEJS_MAJOR_VERISONS
    for arch in ARCHITECTURES
    for distro in DISTROS
]
