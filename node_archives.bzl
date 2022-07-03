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
        sha256 = "f78a49c0c9c2f546c3a44eb434c49a852125441422a1bcfc433dedc58d6a241c",
        strip_prefix = "node-v16.15.1-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "4e3f5c72ec735aa23d52042be61e32e7279d26d7f05ebb5571c410e81d10c9a3",
        strip_prefix = "node-v18.4.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.4.0/node-v18.4.0-linux-x64.tar.gz"],
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
        sha256 = "84db3f261a02c3d92558fb80a3b597b58175d713b8aa928f6b66e963340f1faf",
        strip_prefix = "node-v16.15.1-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "6926ab0721aee65b6a00f4858a307d736de5f48a511d7e5c6182f87887f76188",
        strip_prefix = "node-v18.4.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.4.0/node-v18.4.0-linux-arm64.tar.gz"],
    )
