"repositories for nodejs"

load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    "node archives"
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "262bdd5d59608360cb872cdb3d2aa089867b46963ec7e6a000c1afc7d183db5c",
        strip_prefix = "node-v18.20.3-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.20.3/node-v18.20.3-linux-x64.tar.gz"],
        version = "18.20.3",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "7aab1e72b5f214ae08895ca0cfbf68e1731d53a6ebf945b929446564f2cc80d8",
        strip_prefix = "node-v18.20.3-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.20.3/node-v18.20.3-linux-arm64.tar.gz"],
        version = "18.20.3",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "eb51ef4a1e1a4c33bfeb658547498c676bf467f660169ac0453961e54fd60285",
        strip_prefix = "node-v18.20.3-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.20.3/node-v18.20.3-linux-armv7l.tar.gz"],
        version = "18.20.3",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "7d338eb66e3cd4a89a0682ddc5135a5037fbe2ce20327d467f01ef07ec74b3bf",
        strip_prefix = "node-v18.20.3-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.20.3/node-v18.20.3-linux-ppc64le.tar.gz"],
        version = "18.20.3",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_s390x",
        sha256 = "1e5aedfcb010581ba1527ae159079d7845ef9c0598bf7f915e2c3f8d1d473c11",
        strip_prefix = "node-v18.20.3-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.20.3/node-v18.20.3-linux-s390x.tar.gz"],
        version = "18.20.3",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "3a873874caae30b5a9125fdf8872f7800cc0216eb89d097470110cd267a596e2",
        strip_prefix = "node-v20.15.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.15.0/node-v20.15.0-linux-x64.tar.gz"],
        version = "20.15.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "9e593b61bf2a2e01073eba20508f0adc6daa746f577ec4e8d777032f15b5fa48",
        strip_prefix = "node-v20.15.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.15.0/node-v20.15.0-linux-arm64.tar.gz"],
        version = "20.15.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "63cea18f789b926c35576d721b49e416df40f9d66083a313d7da985dbedabfe2",
        strip_prefix = "node-v20.15.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.15.0/node-v20.15.0-linux-armv7l.tar.gz"],
        version = "20.15.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "445c8f1d4ed6d26629189879d6d4843913c81b48f7e1e4c1eb7586167e8c2027",
        strip_prefix = "node-v20.15.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.15.0/node-v20.15.0-linux-ppc64le.tar.gz"],
        version = "20.15.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "ea1973a743afe834b1ac413922d5cf70a19becc583277b17bf9a6442a58e75cc",
        strip_prefix = "node-v20.15.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.15.0/node-v20.15.0-linux-s390x.tar.gz"],
        version = "20.15.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_amd64",
        sha256 = "407531c82d4ccffa4231b82086f614f2de2e4008146aff124f7d76ebb87ea45a",
        strip_prefix = "node-v22.4.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v22.4.0/node-v22.4.0-linux-x64.tar.gz"],
        version = "22.4.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm64",
        sha256 = "2157b6eca925abae88bd6543b66e2ebefed7106b7ef34fc792553a303309422e",
        strip_prefix = "node-v22.4.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v22.4.0/node-v22.4.0-linux-arm64.tar.gz"],
        version = "22.4.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm",
        sha256 = "3511b88be58a137c2e59507bb1f8023744107f0cfd27fb9714208ffd065615f9",
        strip_prefix = "node-v22.4.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v22.4.0/node-v22.4.0-linux-armv7l.tar.gz"],
        version = "22.4.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_ppc64le",
        sha256 = "0c02a6c722cdb61ba542128073014d5927aa5e068ba7b9f67cce50f1edefc9a9",
        strip_prefix = "node-v22.4.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v22.4.0/node-v22.4.0-linux-ppc64le.tar.gz"],
        version = "22.4.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_s390x",
        sha256 = "c73714c0867c0503fb4516047f76f1305e932dadb76f1f013e70f3f91c47c505",
        strip_prefix = "node-v22.4.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v22.4.0/node-v22.4.0-linux-s390x.tar.gz"],
        version = "22.4.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
