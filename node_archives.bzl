load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    node_archive(
        name = "nodejs14_amd64",
        sha256 = "951d64432d1c7e026a585d1c6ec8822a268faa3c9b71e1b8d36dc812c51b661e",
        strip_prefix = "node-v14.21.2-linux-x64/",
        urls = ["https://nodejs.org/dist/v14.21.2/node-v14.21.2-linux-x64.tar.gz"],
        version = "14.21.2",
        architecture = "amd64",
        control = "//nodejs:control"
    )

    node_archive(
        name = "nodejs16_amd64",
        sha256 = "23770ba26a52cb8fedd1096613bbc419b8a033d774a457d9024bb5a0159f3585",
        strip_prefix = "node-v16.19.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v16.19.0/node-v16.19.0-linux-x64.tar.gz"],
        version = "16.19.0",
        architecture = "amd64",
        control = "//nodejs:control"
    )

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "2d2881cf860624b9fa9866670a65708c747d458213bdccaa8e7266b105d404ad",
        strip_prefix = "node-v18.13.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-x64.tar.gz"],
        version = "18.13.0",
        architecture = "amd64",
        control = "//nodejs:control"
    )

    node_archive(
        name = "nodejs14_arm64",
        sha256 = "bb7ac11ee8ff3a06773028d53443769c4b0c0f0e85ece68921645882b181cf80",
        strip_prefix = "node-v14.21.2-linux-arm64/",
        urls = ["https://nodejs.org/dist/v14.21.2/node-v14.21.2-linux-arm64.tar.gz"],
        version = "14.21.2",
        architecture = "arm64",
        control = "//nodejs:control"
    )

    node_archive(
        name = "nodejs16_arm64",
        sha256 = "1d5e66db4e23a4ab2380dfa7cfebea1f960438db6bd2a7095020acfc64545542",
        strip_prefix = "node-v16.19.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v16.19.0/node-v16.19.0-linux-arm64.tar.gz"],
        version = "16.19.0",
        architecture = "arm64",
        control = "//nodejs:control"
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "dc68e229425b941eeae0b1d59c66c680b56fd536d0ad2311e3fb009bd83661e4",
        strip_prefix = "node-v18.13.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-arm64.tar.gz"],
        version = "18.13.0",
        architecture = "arm64",
        control = "//nodejs:control"
    )
