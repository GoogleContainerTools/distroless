load("@subpar//:subpar.bzl", "par_binary")

# Requires python3 for lzma system library
par_binary(
    name = "dpkg_parser",
    srcs = [
        "__init__.py",
        "dpkg_parser.py",
    ],
    compiler_args = [
        "--interpreter",
        "/usr/bin/env python3",
    ],
    main = "dpkg_parser.py",
    python_version = "PY3",
    deps = [
        ":parse_metadata",
        ":util",
        ":version_utils",
        "@bazel_tools//third_party/py/six",
    ],
)

sh_binary(
    name = "dpkg_extract",
    srcs = ["dpkg_extract.sh"],
    visibility = ["//:__subpackages__"],
)

py_library(
    name = "parse_metadata",
    srcs = ["parse_metadata.py"],
    deps = ["@bazel_tools//third_party/py/six"],
)

py_library(
    name = "util",
    srcs = [
        "util.py",
        "@rules_pkg//:build_tar",
    ],
)

py_library(
    name = "version_utils",
    srcs = ["version_utils.py"],
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
