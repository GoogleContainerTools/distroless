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
        sha256 = "4827808e50b8ee42b4dadf056835287dac267b9cff56cea56e70843bf8cecb79",
        strip_prefix = "node-v16.17.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.17.0/node-v16.17.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "7fdbfdb985a48db3d22a2472330db05d94c9aff59192b09d8f9ab5fcedba76d5",
        strip_prefix = "node-v18.9.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.9.0/node-v18.9.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "d2d15363a2f3a0446983d51a90af7942fe8b1dd4a7f16128dfe718b3bf56dc07",
        strip_prefix = "node-v14.20.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.20.0/node-v14.20.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "0e83e93bd3658f4ae516b5f1f174190bd87aaae3d691eb91a8945eed04dc8491",
        strip_prefix = "node-v16.17.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.17.0/node-v16.17.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "0d0e671158e072a63c24714bfc4c19a4bb0a70c89d219b1f23d67cbea9c5ffcf",
        strip_prefix = "node-v18.9.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.9.0/node-v18.9.0-linux-arm64.tar.gz"],
    )
