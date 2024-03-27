load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "80620426d177141aa99376de2ad1cb5ed461104cc53c0a5334df91467c60cac3",
        strip_prefix = "node-v18.20.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.20.0/node-v18.20.0-linux-x64.tar.gz"],
        version = "18.20.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "2913e8544d95c8be9e6034c539ec0584014532166a088bf742629756c3ec42e2",
        strip_prefix = "node-v18.19.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.19.1/node-v18.19.1-linux-arm64.tar.gz"],
        version = "18.19.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "bbe61134fb41d96a335ad36a6dbfd0a05cfcb14b31046263de72a7e487b348d5",
        strip_prefix = "node-v18.19.1-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.19.1/node-v18.19.1-linux-armv7l.tar.gz"],
        version = "18.19.1",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "1dee4b0c95ee00ab81b01db908eff22c51fb8da91cab6e71e3f48fd1b3fd9d16",
        strip_prefix = "node-v18.19.1-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.19.1/node-v18.19.1-linux-ppc64le.tar.gz"],
        version = "18.19.1",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_s390x",
        sha256 = "3d06ceb2be850f3d0e72e7bb6402c058f8dcc809fb3f9458400e93967c433ec5",
        strip_prefix = "node-v18.19.1-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.19.1/node-v18.19.1-linux-s390x.tar.gz"],
        version = "18.19.1",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "bf3a779bef19452da90fb88358ec2c57e0d2f882839b20dc6afc297b6aafc0d7",
        strip_prefix = "node-v20.11.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.gz"],
        version = "20.11.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "e34ab2fc2726b4abd896bcbff0250e9b2da737cbd9d24267518a802ed0606f3b",
        strip_prefix = "node-v20.11.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-arm64.tar.gz"],
        version = "20.11.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "e42791f76ece283c7a4b97fbf716da72c5128c54a9779f10f03ae74a4bcfb8f6",
        strip_prefix = "node-v20.11.1-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-armv7l.tar.gz"],
        version = "20.11.1",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "9823305ac3a66925a9b61d8032f6bbb4c3e33c28e7f957ebb27e49732feffb23",
        strip_prefix = "node-v20.11.1-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-ppc64le.tar.gz"],
        version = "20.11.1",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "4c66b2f247fdd8720853321526d7cda483018fcb32014b75c30f3a54ecacaea7",
        strip_prefix = "node-v20.11.1-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-s390x.tar.gz"],
        version = "20.11.1",
        architecture = "s390x",
        control = "//nodejs:control",
    )
