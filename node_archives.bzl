load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "8aae62b6b3a5d659459c35c51e4373b950d11595a273db16c6162c712c5533a2",
        strip_prefix = "node-v18.18.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-x64.tar.gz"],
        version = "18.18.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "26dd13a6f7253f0ab9bcab561353985a297d927840771d905566735b792868da",
        strip_prefix = "node-v20.6.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.6.1/node-v20.6.1-linux-x64.tar.gz"],
        version = "20.6.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "54037e72a2676db610f0a9d66055a23241adf07f336cd0c9289a7b301eae9060",
        strip_prefix = "node-v18.18.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-arm64.tar.gz"],
        version = "18.18.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "d38fe2e41e3fe8ae81b517b4cf49521f500e181e54f4c3d05e2b2d691a57b2ca",
        strip_prefix = "node-v20.6.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.6.1/node-v20.6.1-linux-arm64.tar.gz"],
        version = "20.6.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )
