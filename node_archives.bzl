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
