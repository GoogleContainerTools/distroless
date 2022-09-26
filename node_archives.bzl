load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "0aab09a55c11fbd1e6c40356809a86eaaf3330fc96e26f9443f82d46d8f8da5f",
        strip_prefix = "node-v14.20.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.20.1/node-v14.20.1-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "da5658693243b3ecf6a4cba6751a71df1eb9e9703ca93b42a9404aed85f58ad0",
        strip_prefix = "node-v16.17.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.17.1/node-v16.17.1-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "33ecf5f39618f4beb90a9be98880325cb4f06e33b52e315040a54fd0700f2434",
        strip_prefix = "node-v18.9.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.9.1/node-v18.9.1-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "05fe791367dbce8d76be7e18bac0c9b88a0ed6ab721c31321b96a2dbc31355ce",
        strip_prefix = "node-v14.20.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.20.1/node-v14.20.1-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "adc7032888d4e672a4aac886baede8c04fccdd1a2e7ab4bcf325e3f336f44a3d",
        strip_prefix = "node-v16.17.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.17.1/node-v16.17.1-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "a1610d6f75f45fb0dc73164231c63308d653c09a57dd14a989cf4de9b96e965b",
        strip_prefix = "node-v18.9.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.9.1/node-v18.9.1-linux-arm64.tar.gz"],
    )
