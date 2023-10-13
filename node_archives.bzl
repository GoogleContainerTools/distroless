load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "9ce4db11f1d8399f6b58aab6858a688b2e09405127b47ebc4594dc8262a5e29f",
        strip_prefix = "node-v18.18.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.18.1/node-v18.18.1-linux-x64.tar.gz"],
        version = "18.18.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "ae6f288a21a3bc7a82b79d3f00c52216df6de09c45eac0ea754243a9c7fb5e69",
        strip_prefix = "node-v20.8.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.8.0/node-v20.8.0-linux-x64.tar.gz"],
        version = "20.8.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "1d3ef02cfefc9c87a010ec9ac9a21cafc71096e8159b9f35b419d6e5f71e2f92",
        strip_prefix = "node-v18.18.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.18.1/node-v18.18.1-linux-arm64.tar.gz"],
        version = "18.18.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "cec9be5a060f63bfda7ef5b5a368cba5cfa0ce673b117bae8c146ec5df767cbe",
        strip_prefix = "node-v20.8.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.8.0/node-v20.8.0-linux-arm64.tar.gz"],
        version = "20.8.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )
