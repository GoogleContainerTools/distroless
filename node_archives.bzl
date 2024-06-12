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
        sha256 = "5b9bf40cfc7c21de14a1b4c367650e3c96eb101156bf9368ffc2f947414b6581",
        strip_prefix = "node-v20.14.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.14.0/node-v20.14.0-linux-x64.tar.gz"],
        version = "20.14.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "d63e83fca4f81801396620c46a42892a2ef26e21a4508f68de373e61a12bd9c5",
        strip_prefix = "node-v20.14.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.14.0/node-v20.14.0-linux-arm64.tar.gz"],
        version = "20.14.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "af45ea0d09e55a4f05c0190636532bdf9f70b2eaf0a1c4d7594207cf21284df0",
        strip_prefix = "node-v20.14.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.14.0/node-v20.14.0-linux-armv7l.tar.gz"],
        version = "20.14.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "2405a23249ddb4d2495f212255f5f5f11892fac77f9835c491b9ffaee1404078",
        strip_prefix = "node-v20.14.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.14.0/node-v20.14.0-linux-ppc64le.tar.gz"],
        version = "20.14.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "74668f3e337980acf1579e31f6f9490ec28d98603bb2ff17390c115606af7806",
        strip_prefix = "node-v20.14.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.14.0/node-v20.14.0-linux-s390x.tar.gz"],
        version = "20.14.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_amd64",
        sha256 = "a6d4fbf4306a883b8e1d235a8a890be84b9d95d2d39b929520bed64da41ce540",
        strip_prefix = "node-v22.3.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v22.3.0/node-v22.3.0-linux-x64.tar.gz"],
        version = "22.3.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm64",
        sha256 = "0e25b9a4bc78080de826a90dff82743bec6d9c5085186e75521dc195c8be9ce3",
        strip_prefix = "node-v22.3.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v22.3.0/node-v22.3.0-linux-arm64.tar.gz"],
        version = "22.3.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm",
        sha256 = "46b640d23708f899689059cc2a8431842c2e3ad50a9144828ddabea5e1a7c3ae",
        strip_prefix = "node-v22.3.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v22.3.0/node-v22.3.0-linux-armv7l.tar.gz"],
        version = "22.3.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_ppc64le",
        sha256 = "a01c2263a01efa7c6efa3607d202487127e268d73b68b6cce9c44a481412ece0",
        strip_prefix = "node-v22.3.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v22.3.0/node-v22.3.0-linux-ppc64le.tar.gz"],
        version = "22.3.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_s390x",
        sha256 = "3aa6a22f525a6f8ddb0fd2ce3646414c316a41cab6bdaac812276196607bc187",
        strip_prefix = "node-v22.3.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v22.3.0/node-v22.3.0-linux-s390x.tar.gz"],
        version = "22.3.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
