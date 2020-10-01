package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("//base:distro.bzl", "DISTRO_SUFFIXES")

NODEJS_MAJOR_VERISONS = ("10", "12", "14")

[
    container_image(
        name = "nodejs" + major_version + ("" if (not mode) else mode) + distro_suffix,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_root_amd64" + distro_suffix,
        entrypoint = ["/nodejs/bin/node"],
        tars = ["@nodejs" + major_version + "//:tar"],
    )
    for mode in [
        "",
        "_debug",
    ]
    for major_version in NODEJS_MAJOR_VERISONS
    for distro_suffix in DISTRO_SUFFIXES
]
