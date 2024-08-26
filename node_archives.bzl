"repositories for nodejs"

load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    "node archives"
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "c4b0827dc47609d0a8379e6de6c74b3934da0b1312c733b5ebdcac16e3f1e954",
        strip_prefix = "node-v18.20.4-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-x64.tar.gz"],
        version = "18.20.4",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "f4e0b8b1a89e5d6529e517d57b42ac5cbab0562d86e88566d8e90578257e2b16",
        strip_prefix = "node-v18.20.4-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-arm64.tar.gz"],
        version = "18.20.4",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "ce311e7167c8cc0392753119dad55291842c2f4aa7a87a093144fc9338f35b61",
        strip_prefix = "node-v18.20.4-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-armv7l.tar.gz"],
        version = "18.20.4",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "2356de20cb33798690c90270b557e690c34cfd67525e32a0a6301a8176ce0bd8",
        strip_prefix = "node-v18.20.4-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-ppc64le.tar.gz"],
        version = "18.20.4",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_s390x",
        sha256 = "654ee94e5695f4c97dc1adc03cf833763ba62865fefb057af7258a20a87be51c",
        strip_prefix = "node-v18.20.4-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-s390x.tar.gz"],
        version = "18.20.4",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "21e656f6f4e34080ddc5d75fbfe58ce8482fe6e70a76aeae14afdcdc1e23079d",
        strip_prefix = "node-v20.17.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-x64.tar.gz"],
        version = "20.17.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "18afbf2781edfcc9918343f4bf74a8c35d74d778b85d40a0c09b232adc0ea82c",
        strip_prefix = "node-v20.17.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-arm64.tar.gz"],
        version = "20.17.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "fcc19311817622f2e4693c3fff488c72fa1ce7c2c423c2bd114c86b24fa8c388",
        strip_prefix = "node-v20.17.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-armv7l.tar.gz"],
        version = "20.17.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "8ab306fa954887bcd9718c61eb91110df37a791dce3097dd249481654b3b663f",
        strip_prefix = "node-v20.17.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-ppc64le.tar.gz"],
        version = "20.17.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "7ad50f3aa8f07e7ef2167fa6bb28c850dc6497b633c4ec8c4815f29c53a124b0",
        strip_prefix = "node-v20.17.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-s390x.tar.gz"],
        version = "20.17.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_amd64",
        sha256 = "f2f4ccbcbc0a443e5fadebd1149a22f96087ec09cef52ff343a15ee835206d96",
        strip_prefix = "node-v22.6.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v22.6.0/node-v22.6.0-linux-x64.tar.gz"],
        version = "22.6.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm64",
        sha256 = "c6c7ee62de3637401c15df9a022afaa248d236d59ceca8c188944cf97d0be372",
        strip_prefix = "node-v22.6.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v22.6.0/node-v22.6.0-linux-arm64.tar.gz"],
        version = "22.6.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm",
        sha256 = "934990b8f2c66853ccefb6a0aa7e7534d9fcc3d5b79cb8034e4fd3120b5c2ae6",
        strip_prefix = "node-v22.6.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v22.6.0/node-v22.6.0-linux-armv7l.tar.gz"],
        version = "22.6.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_ppc64le",
        sha256 = "fd462a633976c680dc37d822c0d820166ca8e0c2aa0257acbf6b04ffcba47a01",
        strip_prefix = "node-v22.6.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v22.6.0/node-v22.6.0-linux-ppc64le.tar.gz"],
        version = "22.6.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_s390x",
        sha256 = "b623fdd2e04ec0a38c5676dc24f9d8e556df4407649f71fef3b70a9be15e340a",
        strip_prefix = "node-v22.6.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v22.6.0/node-v22.6.0-linux-s390x.tar.gz"],
        version = "22.6.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
