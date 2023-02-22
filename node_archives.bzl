load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    node_archive(
        name = "nodejs14_amd64",
        sha256 = "bef2685d9469058c1229cc7789e171861044fe3f70316ec744e9bf3609cd45ed",
        strip_prefix = "node-v14.21.3-linux-x64/",
        urls = ["https://nodejs.org/dist/v14.21.3/node-v14.21.3-linux-x64.tar.gz"],
        version = "14.21.2",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs16_amd64",
        sha256 = "ca63da538e02de15b7e974f7a17ce4732cc0d63023942301d30044c472ed9ddd",
        strip_prefix = "node-v16.19.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v16.19.1/node-v16.19.1-linux-x64.tar.gz"],
        version = "16.19.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "95bdaaf92265eefd40d2055fb9b5cd6cbc3cb2c4495e3ebd4b1b501822d69731",
        strip_prefix = "node-v18.14.2-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.14.2/node-v18.14.2-linux-x64.tar.gz"],
        version = "v18.14.2",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs14_arm64",
        sha256 = "044b7ec3fea04cd3815d26901ee37203dcc942688b72ee6eac96f6a1ca3cc63f",
        strip_prefix = "node-v14.21.3-linux-arm64/",
        urls = ["https://nodejs.org/dist/v14.21.3/node-v14.21.3-linux-arm64.tar.gz"],
        version = "14.21.3",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs16_arm64",
        sha256 = "d4bfa62f5b1aacf74169e8ff58af812d0ef34ef6152c6ad812f220e9bf6cc462",
        strip_prefix = "node-v16.19.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v16.19.1/node-v16.19.1-linux-arm64.tar.gz"],
        version = "16.19.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "e5c5d83e65271260ea4135330309d43fdc26c42457156ff237eeba65c6237f58",
        strip_prefix = "node-v18.14.2-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.14.2/node-v18.14.2-linux-arm64.tar.gz"],
        version = "18.14.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )
