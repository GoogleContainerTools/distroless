"repositories for nodejs"

load("//private/remote:node_archive.bzl", "node_archive")

def repositories():
    "node archives"
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs18_amd64",
        sha256 = "d226c39c5546dca97567db8f8ca7f92fca6572d44f181b1f85af83eee5d6f9e1",
        strip_prefix = "node-v18.20.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v18.20.1/node-v18.20.1-linux-x64.tar.gz"],
        version = "18.20.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm64",
        sha256 = "52896372b3b151f639be7efa8662d68aaeb065cae2c15d61d14e2b73ada79597",
        strip_prefix = "node-v18.20.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v18.20.1/node-v18.20.1-linux-arm64.tar.gz"],
        version = "18.20.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_arm",
        sha256 = "b61392490e84cc6050967bbfc59cfd9ad6e737b6db9ef9d479b0d79c900aef64",
        strip_prefix = "node-v18.20.1-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v18.20.1/node-v18.20.1-linux-armv7l.tar.gz"],
        version = "18.20.1",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_ppc64le",
        sha256 = "69e0c2d291c0838f01f157fc4713cc86c803396c6c25524397339946cf31a4cb",
        strip_prefix = "node-v18.20.1-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v18.20.1/node-v18.20.1-linux-ppc64le.tar.gz"],
        version = "18.20.1",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs18_s390x",
        sha256 = "39793752b0ef9abe39ff942bbd3e442d71990f0592b3b0805252adb1b9c78e21",
        strip_prefix = "node-v18.20.1-linux-s390x/",
        urls = ["https://nodejs.org/dist/v18.20.1/node-v18.20.1-linux-s390x.tar.gz"],
        version = "18.20.1",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "da2f590a39717792dcf8c4bf6b9e4b269601e6ce3a3f150a3c4b379f7eea6d83",
        strip_prefix = "node-v20.12.1-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.12.1/node-v20.12.1-linux-x64.tar.gz"],
        version = "20.12.1",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "6eb199eaa4f83a729242c69792a126cb58ca6a60d791dffd9cedb4cfd32b96c0",
        strip_prefix = "node-v20.12.1-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.12.1/node-v20.12.1-linux-arm64.tar.gz"],
        version = "20.12.1",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "d4058aee344df896215eabbf367bbc9bf6504531e75016081565416c6e335e2a",
        strip_prefix = "node-v20.12.1-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.12.1/node-v20.12.1-linux-armv7l.tar.gz"],
        version = "20.12.1",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "f79c53a39c559e35da24e67a9ca85557bc54a0560a34bea67c4610ac7007ac0c",
        strip_prefix = "node-v20.12.1-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.12.1/node-v20.12.1-linux-ppc64le.tar.gz"],
        version = "20.12.1",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "2cc1c25374995aed79194a50166927dcb2b10473683407a173119d45c42de419",
        strip_prefix = "node-v20.12.1-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.12.1/node-v20.12.1-linux-s390x.tar.gz"],
        version = "20.12.1",
        architecture = "s390x",
        control = "//nodejs:control",
    )
