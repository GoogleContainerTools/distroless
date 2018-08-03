load("@subpar//:subpar.bzl", "par_binary")

par_binary(
    name = "dpkg_parser",
    srcs = glob(["**/*.py"]),
    main = "dpkg_parser.py",
    visibility = ["//visibility:public"],
    deps = [
        ":parse_metadata",
        ":util",
        "@bazel_tools//third_party/py/six",
    ],
)

py_library(
    name = "parse_metadata",
    srcs = ["parse_metadata.py"],
    deps = ["@bazel_tools//third_party/py/six"],
)

py_library(
    name = "util",
    srcs = ["util.py"],
)

py_test(
    name = "parse_metadata_test",
    size = "small",
    srcs = ["parse_metadata_test.py"],
    data = ["testdata/Packages.txt"],
    deps = [":parse_metadata"],
)

py_test(
    name = "util_test",
    size = "small",
    srcs = ["util_test.py"],
    data = ["testdata/checksum.txt"],
    deps = [
        ":util",
        "@bazel_tools//third_party/py/six",
    ],
)
