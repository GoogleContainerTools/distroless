load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs16_amd64",
        sha256 = "7abc0e558fa3b3c4cc0fd3c7fa5dbe61500ba7213f5e87ed560c65a733c6a5c4",
        strip_prefix = "node-v16.20.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v16.20.0/node-v16.20.0-linux-x64.tar.gz"],
        version = "16.20.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "fc83046a93d2189d919005a348db3b2372b598a145d84eb9781a3a4b0f032e95",
        strip_prefix = "node-v18.16.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.gz"],
        version = "18.16.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "80238ee1a9dee6b0d5d1081503c6fdd1c7f81bdf4ca6abd90aa5a568712a2eaa",
        strip_prefix = "node-v20.3.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.3.0/node-v20.3.0-linux-x64.tar.gz"],
        version = "20.3.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs16_arm64",
        sha256 = "58ea2f702936832fcf7d9cf1e9249bb7d9769185f8ad2ece05a70a7f61dbf879",
        strip_prefix = "node-v16.20.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v16.20.0/node-v16.20.0-linux-arm64.tar.gz"],
        version = "16.20.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "dc3dfaee899ed21682e47eaf15525f85aff29013c392490e9b25219cd95b1c35",
        strip_prefix = "node-v18.16.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-arm64.tar.gz"],
        version = "18.16.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "c3476b293f3b26a14163184171896ef17dc33ee26a208256170556b493a2b2c5",
        strip_prefix = "node-v20.3.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.3.0/node-v20.3.0-linux-arm64.tar.gz"],
        version = "20.3.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )
