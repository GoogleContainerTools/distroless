load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "fd72086a1849a428c99d94ef1aca94686c9080792e1586a75ca031a030424544",
        strip_prefix = "node-v14.19.2-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.19.2/node-v14.19.2-linux-x64.tar.gz"],
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
        sha256 = "db3819510007d29516cb45aa65a7cd967de917e40c176bb60de6c3d0cd6440af",
        strip_prefix = "node-v18.1.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.1.0/node-v18.1.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "b972847ccd8a699b72f8ac455d4233fa584972e2ebd3dd99768ff5c95334304d",
        strip_prefix = "node-v14.19.2-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.19.2/node-v14.19.2-linux-arm64.tar.gz"],
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
        sha256 = "95a986b1a9b393061f0976513cc543ab64f822d59d07d229bc21f472f8fad1d2",
        strip_prefix = "node-v18.1.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.1.0/node-v18.1.0-linux-arm64.tar.gz"],
    )
