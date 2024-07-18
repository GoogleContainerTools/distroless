"repositories for nodejs"

load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    "node archives"
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "c4b0827dc47609d0a8379e6de6c74b3934da0b1312c733b5ebdcac16e3f1e954",
        strip_prefix = "node-v18.20.4-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-x64.tar.gz"],
        version = "18.20.4",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "f4e0b8b1a89e5d6529e517d57b42ac5cbab0562d86e88566d8e90578257e2b16",
        strip_prefix = "node-v18.20.4-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-arm64.tar.gz"],
        version = "18.20.4",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "ce311e7167c8cc0392753119dad55291842c2f4aa7a87a093144fc9338f35b61",
        strip_prefix = "node-v18.20.4-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-armv7l.tar.gz"],
        version = "18.20.4",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "2356de20cb33798690c90270b557e690c34cfd67525e32a0a6301a8176ce0bd8",
        strip_prefix = "node-v18.20.4-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-ppc64le.tar.gz"],
        version = "18.20.4",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_s390x",
        sha256 = "654ee94e5695f4c97dc1adc03cf833763ba62865fefb057af7258a20a87be51c",
        strip_prefix = "node-v18.20.4-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-s390x.tar.gz"],
        version = "18.20.4",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "a9db028c0a1c63e3aa0d97de24b0966bc507d8239b3aedc4e752eea6b0580665",
        strip_prefix = "node-v20.15.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-x64.tar.gz"],
        version = "20.15.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "8554c91ccd32782351035d3a9b168ad01c6922480800a21870fc5d6d86c2bb70",
        strip_prefix = "node-v20.15.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-arm64.tar.gz"],
        version = "20.15.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "2c16717da7d2d7b00f6af146cdf436a0297cbcee52c85b754e4c9ed7cee34b51",
        strip_prefix = "node-v20.15.1-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-armv7l.tar.gz"],
        version = "20.15.1",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "b91df4971b428f9cb2fbe427c919ad382c4cd206a85e5c918c60c15f1e3d2e32",
        strip_prefix = "node-v20.15.1-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-ppc64le.tar.gz"],
        version = "20.15.1",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "393f511b5623c8a872e58203914a54bc7e086b8ca870d34833766d4f9c4e2448",
        strip_prefix = "node-v20.15.1-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-s390x.tar.gz"],
        version = "20.15.1",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_amd64",
        sha256 = "f1a2eadec1f7ae92a98252eda0579b581d9a592792a1a3c391a073b38d5f036c",
        strip_prefix = "node-v22.5.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v22.5.0/node-v22.5.0-linux-x64.tar.gz"],
        version = "22.5.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm64",
        sha256 = "f64000dcdb279f056dc574db13494d61fd85f2928c99ffa2e6dd2e5843ce6299",
        strip_prefix = "node-v22.5.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v22.5.0/node-v22.5.0-linux-arm64.tar.gz"],
        version = "22.5.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm",
        sha256 = "73b4d63ca3fc958910a6a7155ad7f584c60d26998ef36ebadcde7f0fae5c97fc",
        strip_prefix = "node-v22.5.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v22.5.0/node-v22.5.0-linux-armv7l.tar.gz"],
        version = "22.5.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_ppc64le",
        sha256 = "8e0bde5839c81cd2c6e536fe5e2f4de58ee644c92e1cddd4f5e29365b716d798",
        strip_prefix = "node-v22.5.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v22.5.0/node-v22.5.0-linux-ppc64le.tar.gz"],
        version = "22.5.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_s390x",
        sha256 = "73af14a5da0eda93abe1beb8b30278ca88f49ba3699bacb218a062d19a6de0aa",
        strip_prefix = "node-v22.5.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v22.5.0/node-v22.5.0-linux-s390x.tar.gz"],
        version = "22.5.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )
