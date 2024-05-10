"repositories for nodejs"

load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    "node archives"
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "a222595d353a7d1e48994a7d9c25e61ab1b8a1b0ce0652029f5cf999978b2e49",
        strip_prefix = "node-v18.20.2-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.20.2/node-v18.20.2-linux-x64.tar.gz"],
        version = "18.20.2",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "0b21ad5a11dd6c59a62eb34d1a0c2af28fe29187fa60da2c993b7cdf2a5a2f28",
        strip_prefix = "node-v18.20.2-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.20.2/node-v18.20.2-linux-arm64.tar.gz"],
        version = "18.20.2",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "adc55a8a594882b72967b05a4e47b4911879eeb44477f9447e05c84d420797ac",
        strip_prefix = "node-v18.20.2-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.20.2/node-v18.20.2-linux-armv7l.tar.gz"],
        version = "18.20.2",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "40193c181756789bb53130d5c96cfacb2e90dff3a5ef196014d4df8d9cecd6ba",
        strip_prefix = "node-v18.20.2-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.20.2/node-v18.20.2-linux-ppc64le.tar.gz"],
        version = "18.20.2",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_s390x",
        sha256 = "3c56d6addf76802c5f4e28dfccf4919c1affdf7d47937b4df902250e72eeca89",
        strip_prefix = "node-v18.20.2-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.20.2/node-v18.20.2-linux-s390x.tar.gz"],
        version = "18.20.2",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "80b978a9fe544b1892e73a4bf89e0b3792b1d459b621874efdc2ddd2270c03fe",
        strip_prefix = "node-v20.13.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.13.1/node-v20.13.1-linux-x64.tar.gz"],
        version = "20.13.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "4f9c2ffb116855d6fa4b6654e453f403e31b53284b81c789b73d1d2e20c6f710",
        strip_prefix = "node-v20.13.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.13.1/node-v20.13.1-linux-arm64.tar.gz"],
        version = "20.13.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "0f65dddc797ce7f76976e3720b7a1bca67d1465b113daf82878b66c541ae649f",
        strip_prefix = "node-v20.13.1-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.13.1/node-v20.13.1-linux-armv7l.tar.gz"],
        version = "20.13.1",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "ceb0c307f12e543d401f388ba6e70a5a35ff5eac491d1d517861681332a69682",
        strip_prefix = "node-v20.13.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.13.0/node-v20.13.0-linux-ppc64le.tar.gz"],
        version = "20.13.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "911d4c0ff6632594508d404d84b8c0e80bbe6ec3a44babb9a9f907306d03385f",
        strip_prefix = "node-v20.13.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.13.0/node-v20.13.0-linux-s390x.tar.gz"],
        version = "20.13.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_amd64",
        sha256 = "d8ae35a9e2bb0c0c0611ee9bacf564ea51cc8291ace1447f95ee6aeaf4f1d61d",
        strip_prefix = "node-v22.1.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v22.1.0/node-v22.1.0-linux-x64.tar.gz"],
        version = "22.1.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm64",
        sha256 = "9c111af1f951e8869615bca3601ce7ab6969374933bdba6397469843b808f222",
        strip_prefix = "node-v22.1.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v22.1.0/node-v22.1.0-linux-arm64.tar.gz"],
        version = "22.1.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm",
        sha256 = "e2d46a045ab4e14e7234162c8167bed96c71ac82fbfae1feac21d77ea44c62d0",
        strip_prefix = "node-v22.1.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v22.1.0/node-v22.1.0-linux-armv7l.tar.gz"],
        version = "22.1.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_ppc64le",
        sha256 = "df47c5506bc865b093cfa0411b4adbb66187da00decd05a83c22b9d5ffdca088",
        strip_prefix = "node-v22.1.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v22.1.0/node-v22.1.0-linux-ppc64le.tar.gz"],
        version = "22.1.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_s390x",
        sha256 = "1961314d0d51cf9c4719705ba809f8451597c577dfb0cb500a058115a05d586a",
        strip_prefix = "node-v22.1.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v22.1.0/node-v22.1.0-linux-s390x.tar.gz"],
        version = "22.1.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
