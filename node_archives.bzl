load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs16_amd64",
        sha256 = "c76d2aabd2d02542505fd24e18876fb8515e23638531249277272def42ab54e3",
        strip_prefix = "node-v16.20.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v16.20.1/node-v16.20.1-linux-x64.tar.gz"],
        version = "16.20.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "59582f51570d0857de6333620323bdeee5ae36107318f86ce5eca24747cabf5b",
        strip_prefix = "node-v18.16.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.16.1/node-v18.16.1-linux-x64.tar.gz"],
        version = "18.16.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "2a9b03dd17fa6d9241b93e244d7e8f2524c4019fb5cfe3a99e59da1ee983cb9a",
        strip_prefix = "node-v20.4.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.4.0/node-v20.4.0-linux-x64.tar.gz"],
        version = "20.4.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs16_arm64",
        sha256 = "e67a75da24bd72da5b60568774ee9814bf034959e3768fe6f16eb6cfb3fc4158",
        strip_prefix = "node-v16.20.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v16.20.1/node-v16.20.1-linux-arm64.tar.gz"],
        version = "16.20.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "555b5c521e068acc976e672978ba0f5b1a0c030192b50639384c88143f4460bc",
        strip_prefix = "node-v18.16.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.16.1/node-v18.16.1-linux-arm64.tar.gz"],
        version = "18.16.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "6ed340475a8bd5db5f04fe943b8fb89b7b2a8fd919f91217c6386dfa59865ba3",
        strip_prefix = "node-v20.4.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.4.0/node-v20.4.0-linux-arm64.tar.gz"],
        version = "20.4.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )
