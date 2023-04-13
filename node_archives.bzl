load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    node_archive(
        name = "nodejs14_amd64",
        sha256 = "bef2685d9469058c1229cc7789e171861044fe3f70316ec744e9bf3609cd45ed",
        strip_prefix = "node-v14.21.3-linux-x64/",
        urls = ["https://nodejs.org/dist/v14.21.3/node-v14.21.3-linux-x64.tar.gz"],
        version = "14.21.3",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs16_amd64",
        sha256 = "7abc0e558fa3b3c4cc0fd3c7fa5dbe61500ba7213f5e87ed560c65a733c6a5c4",
        strip_prefix = "node-v16.20.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v16.20.0/node-v16.20.0-linux-x64.tar.gz"],
        version = "16.19.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "fc83046a93d2189d919005a348db3b2372b598a145d84eb9781a3a4b0f032e95",
        strip_prefix = "node-v18.16.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.gz"],
        version = "18.15.0",
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
        sha256 = "58ea2f702936832fcf7d9cf1e9249bb7d9769185f8ad2ece05a70a7f61dbf879",
        strip_prefix = "node-v16.20.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v16.20.0/node-v16.20.0-linux-arm64.tar.gz"],
        version = "16.19.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "8ef7aa7a679360ddbf0c7c8511881030b3de9d1f54451d92ba5c8d59a91c7073",
        strip_prefix = "node-v18.15.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-arm64.tar.gz"],
        version = "18.15.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )
