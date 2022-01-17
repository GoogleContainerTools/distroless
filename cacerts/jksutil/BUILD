load(
    "@io_bazel_rules_go//go:def.bzl",
    "go_binary",
    "go_library",
    "go_test",
)

go_library(
    name = "go_default_library",
    srcs = [
        "certificate.go",
        "jks.go",
    ],
    importpath = "github.com/distroless/cacerts/jksutil",
)

go_test(
    name = "test",
    size = "small",
    srcs = [
        "certificate_test.go",
    ],
    embed = [":go_default_library"],
)

go_binary(
    name = "jksutil",
    srcs = [
        "certificate.go",
        "jks.go",
        "main.go",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        ":go_default_library",
    ],
)

sh_test(
    name = "test_sh",
    size = "small",
    srcs = ["test_jks.sh"],
    args = ["$(location :jksutil)"],
    data = [
        "test.crt",
        ":jksutil",
    ],
)
