load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "cc9d17834eb383565a3368f4222b825f341190813537c677973fc913dcc7bdd1",
        strip_prefix = "node-v14.19.3-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.19.3/node-v14.19.3-linux-x64.tar.gz"],
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
        name = "nodejs18_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "73d3f98e96e098587c2154dcaa82a6469a510e89a4881663dc4c86985acf245e",
        strip_prefix = "node-v18.2.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.2.0/node-v18.2.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "a1c837c7ec8a5ab0c4d5028695b05749adf216851fe0b84ef09a9c6eab86ba5d",
        strip_prefix = "node-v14.19.3-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.19.3/node-v14.19.3-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "2aa387e6a57ade663849efdc4fabf7431a38d975db98dcc79293840e6894d28b",
        strip_prefix = "node-v16.15.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "9dc8ca472c79e842d4faf600876b643ab485936fe4870fbafaa7c19b2d153353",
        strip_prefix = "node-v18.2.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.2.0/node-v18.2.0-linux-arm64.tar.gz"],
    )
