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
        sha256 = "f8f9b6877778ed2d5f920a5bd853f0f8a8be1c42f6d448c763a95625cbbb4b0d",
        strip_prefix = "node-v20.12.2-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-x64.tar.gz"],
        version = "20.12.2",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "2dc8ffa0da135bf493f881d2d38aac610772c801bb7b6208fcc5de9350f119f7",
        strip_prefix = "node-v20.12.2-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-arm64.tar.gz"],
        version = "20.12.2",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "5861b891815ae8d42835db52bc57191858f348e0521b162c670c8ed4df417f1c",
        strip_prefix = "node-v20.12.2-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-armv7l.tar.gz"],
        version = "20.12.2",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "c33968d78e06af64bd8d89a74781fef71ff126f862f7ed0ff2417d612dd64abb",
        strip_prefix = "node-v20.12.2-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-ppc64le.tar.gz"],
        version = "20.12.2",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "29fe0d5142a3f3d7957d6ccf03cc08cd1c76c41d0460c92dd5800d46caa08d31",
        strip_prefix = "node-v20.12.2-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-s390x.tar.gz"],
        version = "20.12.2",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_amd64",
        sha256 = "74bb0f3a80307c529421c3ed84517b8f543867709f41e53cd73df99e6442af4d",
        strip_prefix = "node-v22.0.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v22.0.0/node-v22.0.0-linux-x64.tar.gz"],
        version = "22.0.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm64",
        sha256 = "1d3547226be7e59aceee5c7d01a9f8fc18de67e015c5a15d8cf385b6e02d062b",
        strip_prefix = "node-v22.0.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v22.0.0/node-v22.0.0-linux-arm64.tar.gz"],
        version = "22.0.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm",
        sha256 = "d21db7f57c5ce182aec2b9a83e3295abc37e1731abb73995d3d573e04409977c",
        strip_prefix = "node-v22.0.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v22.0.0/node-v22.0.0-linux-armv7l.tar.gz"],
        version = "22.0.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_ppc64le",
        sha256 = "3b098dccf56d446bbb80845d35bbecbdb74612860d1690f3a216387c99c9d620",
        strip_prefix = "node-v22.0.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v22.0.0/node-v22.0.0-linux-ppc64le.tar.gz"],
        version = "22.0.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_s390x",
        sha256 = "7ec5fdad0c819eea17900eb43c1de948d620a783b1ac94062caa438778a92b30",
        strip_prefix = "node-v22.0.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v22.0.0/node-v22.0.0-linux-s390x.tar.gz"],
        version = "22.0.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
