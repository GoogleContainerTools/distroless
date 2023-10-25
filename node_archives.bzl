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
        sha256 = "f0919f092fbf74544438907fa083c21e76b2d7a4bc287f0607ada1553ef16f60",
        strip_prefix = "node-v20.9.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.9.0/node-v20.9.0-linux-x64.tar.gz"],
        version = "20.9.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "d2a7dbeeb274bfd16b579d2cafb92f673010df36c83a5b55de3916aad6806a6a",
        strip_prefix = "node-v20.9.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.9.0/node-v20.9.0-linux-arm64.tar.gz"],
        version = "20.9.0",
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
        sha256 = "d6a384293f18ba49b7507b67ce2ca1958050930768cae817d4705c3d3e672af2",
        strip_prefix = "node-v20.8.1-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.8.1/node-v20.8.1-linux-s390x.tar.gz"],
        version = "20.8.1",
        architecture = "s390x",
        control = "//nodejs:control",
    )
