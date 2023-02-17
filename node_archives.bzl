load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "951d64432d1c7e026a585d1c6ec8822a268faa3c9b71e1b8d36dc812c51b661e",
        strip_prefix = "node-v14.21.2-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.21.2/node-v14.21.2-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "ca63da538e02de15b7e974f7a17ce4732cc0d63023942301d30044c472ed9ddd",
        strip_prefix = "node-v16.19.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.19.1/node-v16.19.1-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "6a7c6862b86cb01b892ca5967dba14bd3122dbfed9d5c9fedd30585d5974f1f6",
        strip_prefix = "node-v18.14.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.14.1/node-v18.14.1-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "bb7ac11ee8ff3a06773028d53443769c4b0c0f0e85ece68921645882b181cf80",
        strip_prefix = "node-v14.21.2-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.21.2/node-v14.21.2-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "1d5e66db4e23a4ab2380dfa7cfebea1f960438db6bd2a7095020acfc64545542",
        strip_prefix = "node-v16.19.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.19.0/node-v16.19.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "608af6ad3cf5a171c889c022cb51a460bdbf57fbb8fbcd40612ea8063aa95f07",
        strip_prefix = "node-v18.14.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.14.1/node-v18.14.1-linux-arm64.tar.gz"],
    )
