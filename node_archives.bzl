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
        sha256 = "c5ed8da4272740190ce2a477096cb8486ade0d15e2b830f298d7d599c2e6cd97",
        strip_prefix = "node-v18.18.2-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.18.2/node-v18.18.2-linux-s390x.tar.gz"],
        version = "18.18.2",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "d3f0908a9d9190a8525c5b9a716ed91bb57e908555841b0c47f75b2a001ff91b",
        strip_prefix = "node-v20.10.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-x64.tar.gz"],
        version = "20.10.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "8354cdb7cb2ad585ee6bb24819f5229bb48c118c5dabb282dfed153d766a68a4",
        strip_prefix = "node-v20.10.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-arm64.tar.gz"],
        version = "20.10.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "cf0c2838a6bb4aa9422084c89fd9447dfc61915754859ac9b1178ea57c953baf",
        strip_prefix = "node-v20.10.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-armv7l.tar.gz"],
        version = "20.10.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "4ebedbc3a02e620aa4f1460cb336bcc93c958a2720c14e339f13cd9bc0be606b",
        strip_prefix = "node-v20.10.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-ppc64le.tar.gz"],
        version = "20.10.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "70c6279156bc28f410d5c1d89d777c8a447621c5f9e1c4a3a270a3c3245e9a38",
        strip_prefix = "node-v20.10.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-s390x.tar.gz"],
        version = "20.10.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
