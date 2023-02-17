load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "bef2685d9469058c1229cc7789e171861044fe3f70316ec744e9bf3609cd45ed",
        strip_prefix = "node-v14.21.3-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.21.3/node-v14.21.3-linux-x64.tar.gz"],
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
        sha256 = "044b7ec3fea04cd3815d26901ee37203dcc942688b72ee6eac96f6a1ca3cc63f",
        strip_prefix = "node-v14.21.3-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.21.3/node-v14.21.3-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "d4bfa62f5b1aacf74169e8ff58af812d0ef34ef6152c6ad812f220e9bf6cc462",
        strip_prefix = "node-v16.19.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.19.1/node-v16.19.1-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "608af6ad3cf5a171c889c022cb51a460bdbf57fbb8fbcd40612ea8063aa95f07",
        strip_prefix = "node-v18.14.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.14.1/node-v18.14.1-linux-arm64.tar.gz"],
    )
