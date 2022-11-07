load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "8ae854dac7fa5e7dfd5dae8fe8e001c0599821705f650b32c4819149cfda1d0e",
        strip_prefix = "node-v14.21.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.21.1/node-v14.21.1-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "faca6476cb5b41aa995370fd856d16fcfbbef5c18718a6fa44cc1bae4140849d",
        strip_prefix = "node-v16.18.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.18.0/node-v16.18.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "0699c8e02581a9c312d7157331561d36ef23963766eb47daa702edb6fd6735bd",
        strip_prefix = "node-v18.12.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.12.0/node-v18.12.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "f3e6fb4a833c084863e7dfa3a50ac29f53b421ad070748ff9c9a81291284faf8",
        strip_prefix = "node-v14.21.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.21.1/node-v14.21.1-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "7d495b6e26d26dd3dba64b567383f843f3d6211810182a22973fb83c32b5920b",
        strip_prefix = "node-v16.18.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.18.0/node-v16.18.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "9bb70b30b9d34f2b859cfef73ec3134537408dbf7806d45f104bc1e1d3c832e9",
        strip_prefix = "node-v18.12.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.12.0/node-v18.12.0-linux-arm64.tar.gz"],
    )
