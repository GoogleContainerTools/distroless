load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs12_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "ff92a45c4d03e8e270bec1ab337b8fff6e9de293dabfe7e8936a41f2fb0b202e",
        strip_prefix = "node-v12.22.12-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v12.22.12/node-v12.22.12-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "3019e0508145c4c1fc6662f0b9b1c78bb84181aeea4749fac38ca51587aaf82f",
        strip_prefix = "node-v14.19.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.19.1/node-v14.19.1-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "d1c1de461be10bfd9c70ebae47330fb1b4ab0a98ad730823fb1340e34993edee",
        strip_prefix = "node-v16.15.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs12_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "91aefa690914b7f24250f3c0b560b42c6d306315d40009c96b5a6940115895fe",
        strip_prefix = "node-v12.22.12-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v12.22.12/node-v12.22.12-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "b365659aa9f31c984668ac60b70fcfae90ffabb3dd51b031898b050e403c1794",
        strip_prefix = "node-v14.19.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.19.1/node-v14.19.1-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "2aa387e6a57ade663849efdc4fabf7431a38d975db98dcc79293840e6894d28b",
        strip_prefix = "node-v16.15.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-arm64.tar.gz"],
    )
