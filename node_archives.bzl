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
        name = "nodejs20_amd64",
        sha256 = "a42ac1f81704b14c7d07ddde989a8e290087b0487ee3f47185eb0240ba518195",
        strip_prefix = "node-v20.8.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.8.1/node-v20.8.1-linux-x64.tar.gz"],
        version = "20.8.1",
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
        name = "nodejs20_arm64",
        sha256 = "c0420fef5f6e637888be3f400e99297bb844932166fbad5ffa4f188ce59cfcdf",
        strip_prefix = "node-v20.8.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.8.1/node-v20.8.1-linux-arm64.tar.gz"],
        version = "20.8.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "a84bf4ae2cd25a4d6aa5d562b6f7a62a8270221f94a5bbc9e4380494f0ee474d",
        strip_prefix = "node-v18.18.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-armv7l.tar.gz"],
        version = "18.18.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "1922c4ff0c710b18bc6946e4efcc592b832e8c22853066b70a74181ac6d92a36",
        strip_prefix = "node-v20.8.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.8.0/node-v20.8.0-linux-armv7l.tar.gz"],
        version = "20.8.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "f2ca5c856a4bb6a26e14d24ef69e249b078c8057ee92b6a268adbf6d2ef3b095",
        strip_prefix = "node-v18.18.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-ppc64le.tar.gz"],
        version = "18.18.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "44beb7fb1ebacedf5a4c08cc4cd5d346820058a3f3316d9f34bc2fa16a29fd8c",
        strip_prefix = "node-v20.8.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.8.0/node-v20.8.0-linux-ppc64le.tar.gz"],
        version = "20.8.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_s390x",
        sha256 = "a61865c5ad92a9affab43279db6a2fefbeb6f3a57732cc72354fb8a9edd66364",
        strip_prefix = "node-v18.18.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-s390x.tar.gz"],
        version = "18.18.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "7f1c1f515eb4a93ef00ef8630de6f1e308c21969ce4b3ff482269cedb7929595",
        strip_prefix = "node-v20.8.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.8.0/node-v20.8.0-linux-s390x.tar.gz"],
        version = "20.8.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
