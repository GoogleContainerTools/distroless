load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "a44c3e7f8bf91e852c928e5d8bd67ca316b35e27eec1d8acbe3b9dbe03688dab",
        strip_prefix = "node-v18.18.2-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.18.2/node-v18.18.2-linux-x64.tar.gz"],
        version = "18.18.2",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "0c9a6502b66310cb26e12615b57304e91d92ac03d4adcb91c1906351d7928f0d",
        strip_prefix = "node-v18.18.2-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.18.2/node-v18.18.2-linux-arm64.tar.gz"],
        version = "18.18.2",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "7a3b34a6fdb9514bc2374114ec6df3c36113dc5075c38b22763aa8f106783737",
        strip_prefix = "node-v18.18.2-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.18.2/node-v18.18.2-linux-armv7l.tar.gz"],
        version = "18.18.2",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "dbf0939c2ad50b74f2aaa005473b2e14c1cbe68318b69f4c1b4e6dda8e5aa43a",
        strip_prefix = "node-v18.18.2-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.18.2/node-v18.18.2-linux-ppc64le.tar.gz"],
        version = "18.18.2",
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
        sha256 = "a28a0de05177106d241ef426b3e006022bc7d242224adace7565868bd9ee6c06",
        strip_prefix = "node-v20.9.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.9.0/node-v20.9.0-linux-armv7l.tar.gz"],
        version = "20.9.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "3bdb0552e0056160c7600e2fbb95478538e9a90c158120f758658e51d94512c4",
        strip_prefix = "node-v20.9.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.9.0/node-v20.9.0-linux-ppc64le.tar.gz"],
        version = "20.9.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "da75cc336f59cd0166fb0bbec0437ec8c419f3acfc05b19df39d94f497db6a6c",
        strip_prefix = "node-v20.9.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.9.0/node-v20.9.0-linux-s390x.tar.gz"],
        version = "20.9.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
