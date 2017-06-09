load("@subpar//:subpar.bzl", "par_binary")

par_binary(
    name = "dpkg_parser",
    srcs = glob(["**/*.py"]),
    main = "dpkg_parser.py",
    visibility = ["//visibility:public"],
    deps = [":parse_metadata"],
)

py_library(
    name = "parse_metadata",
    srcs = ["parse_metadata.py"],
)

py_test(
    name = "parse_metadata_test",
    size = "small",
    srcs = ["parse_metadata_test.py"],
    data = ["testdata/Packages.txt"],
    deps = [":parse_metadata"],
)
