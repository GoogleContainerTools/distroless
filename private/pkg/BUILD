load("@io_bazel_rules_go//go:def.bzl", "go_binary")

package(default_visibility = ["//visibility:public"])

go_binary(
    name = "debian_spdx",
    srcs = ["debian_spdx.go"],
)   


go_binary(
    name = "dpkg_status",
    srcs = ["dpkg_status.go"],
    deps = [
        "@com_github_ulikunitz_xz//:xz"
    ]
)   