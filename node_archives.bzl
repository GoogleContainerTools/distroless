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
        sha256 = "d964b4ebc4f6fb2255dfb259f2e2489318c712a3b12ec2f5a1cb36a9ca208180",
        strip_prefix = "node-v20.13.1-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.13.1/node-v20.13.1-linux-ppc64le.tar.gz"],
        version = "20.13.1",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "efabff9fc928821325139b853c8edcd25a828b8f2fdc1e227cc282655424cf90",
        strip_prefix = "node-v20.13.1-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.13.1/node-v20.13.1-linux-s390x.tar.gz"],
        version = "20.13.1",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_amd64",
        sha256 = "2c6eaf8bfd0f886ed8764ffce19c795e909639105e4056b1d9f8f917bad12cf1",
        strip_prefix = "node-v22.2.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v22.2.0/node-v22.2.0-linux-x64.tar.gz"],
        version = "22.2.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm64",
        sha256 = "7fc74ddeb3e2317c905fdebd2b681d565fc2a2980515430d4f01dad4ce312175",
        strip_prefix = "node-v22.2.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v22.2.0/node-v22.2.0-linux-arm64.tar.gz"],
        version = "22.2.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm",
        sha256 = "eb14ff993a1a4b6c0417b5f086b1629c82a3665edfa1c83f3b5ab1250b721307",
        strip_prefix = "node-v22.2.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v22.2.0/node-v22.2.0-linux-armv7l.tar.gz"],
        version = "22.2.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_ppc64le",
        sha256 = "e70cb8c5dde31c5e0ee998124f74f7fb7dc7efd7e1549fa162e7fbc20bd937cc",
        strip_prefix = "node-v22.2.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v22.2.0/node-v22.2.0-linux-ppc64le.tar.gz"],
        version = "22.2.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_s390x",
        sha256 = "48a1999e35c5f8b7cf2240239d588d52fad424635b4dd4933062eb9f2a3608f4",
        strip_prefix = "node-v22.2.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v22.2.0/node-v22.2.0-linux-s390x.tar.gz"],
        version = "22.2.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
