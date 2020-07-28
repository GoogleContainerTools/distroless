package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

NODEJS_MAJOR_VERISONS = ("10", "12", "14")

[
    container_image(
        name = "nodejs" + major_version + ("" if (not mode) else mode),
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug"),
        entrypoint = ["/nodejs/bin/node"],
        tars = ["@nodejs" + major_version + "//:tar"],
    )
    for mode in [
        "",
        "_debug",
    ]
    for major_version in NODEJS_MAJOR_VERISONS
]
