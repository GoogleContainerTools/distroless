load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs12_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "860c481f0e7963cbe5afa669d9e5deefa773fb67da571823945ac79a3ea76d3c",
        strip_prefix = "node-v12.22.9-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v12.22.9/node-v12.22.9-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "bd96f88e054801d1368787f7eaf77b49cd052b9543c56bd6bc0bfc90310e2756",
        strip_prefix = "node-v14.18.3-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.18.3/node-v14.18.3-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "a0f23911d5d9c371e95ad19e4e538d19bffc0965700f187840eb39a91b0c3fb0",
        strip_prefix = "node-v16.13.2-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.13.2/node-v16.13.2-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs12_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "307aa26c68600e2f73d699e58a15c59ea06928e4a348cd5a216278d9f2ee0d6c",
        strip_prefix = "node-v12.22.9-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v12.22.9/node-v12.22.9-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "2d071ca1bc1d0ea1eb259e79b81ebb4387237b2f77b3cf616806534e0030eaa8",
        strip_prefix = "node-v14.18.3-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.18.3/node-v14.18.3-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "e87d7c173d7c70672d71cc816ffe0baea2b0458cb7f96c248560410e9cd37522",
        strip_prefix = "node-v16.13.2-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.13.2/node-v16.13.2-linux-arm64.tar.gz"],
    )
