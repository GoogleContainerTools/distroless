load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "153312ae9fe8684f345100e4d141a521dc542b36d8c1e09c31ac290eae98c62a",
        strip_prefix = "node-v18.19.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.19.0/node-v18.19.0-linux-x64.tar.gz"],
        version = "18.19.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "4297548671897a1ba6a9a78726cb3f53458048948b4f71d597886ccf799db603",
        strip_prefix = "node-v18.19.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.19.0/node-v18.19.0-linux-arm64.tar.gz"],
        version = "18.19.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "dadebc4ffccc75e2185ec1d8223745c010a68f6644583eb1396c3ae1f9431b97",
        strip_prefix = "node-v18.19.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.19.0/node-v18.19.0-linux-armv7l.tar.gz"],
        version = "18.19.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "51ef1765099dffdb4c36545e91533aa7ec7bf3b748dac00f79f67d8229708990",
        strip_prefix = "node-v18.19.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.19.0/node-v18.19.0-linux-ppc64le.tar.gz"],
        version = "18.19.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_s390x",
        sha256 = "83a8a3efb96fa7d9002f17d50d871a1a22453307003e57ba1a87713a2b223789",
        strip_prefix = "node-v18.19.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.19.0/node-v18.19.0-linux-s390x.tar.gz"],
        version = "18.19.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "9556262f6cd4c020af027782afba31ca6d1a37e45ac0b56cecd2d5a4daf720e0",
        strip_prefix = "node-v20.11.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.gz"],
        version = "20.11.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "402178cd5438b9ed89bffafc119e2bd4148616390bcdfd7089090ffc4615c981",
        strip_prefix = "node-v20.11.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-arm64.tar.gz"],
        version = "20.11.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "04bc09322f3d71230c32364a6f55d64c67bdb4fe032f07bab5d3cb0a940b6b86",
        strip_prefix = "node-v20.11.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-armv7l.tar.gz"],
        version = "20.11.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "333b51abb06931348640a8707a16ce8a71ac7c1c11ba6a7bd9ce0941f8bbde81",
        strip_prefix = "node-v20.11.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-ppc64le.tar.gz"],
        version = "20.11.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "8d093b2f49017f67cff368fcfeafe036d9c3d0eca2656b379132afef2bf12725",
        strip_prefix = "node-v20.11.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-s390x.tar.gz"],
        version = "20.11.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
