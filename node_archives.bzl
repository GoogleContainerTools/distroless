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
        sha256 = "8949919fc52543efae3bfd057261927c616978614926682ad642915f98fe1981",
        strip_prefix = "node-v16.18.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.18.1/node-v16.18.1-linux-x64.tar.gz"],
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
        sha256 = "d6caa1439e8f3fbf4855b5cc1d09ae3eee31fc54ec29b7170603222ba6f8dfe6",
        strip_prefix = "node-v16.18.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.18.1/node-v16.18.1-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "9bb70b30b9d34f2b859cfef73ec3134537408dbf7806d45f104bc1e1d3c832e9",
        strip_prefix = "node-v18.12.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.12.0/node-v18.12.0-linux-arm64.tar.gz"],
    )
