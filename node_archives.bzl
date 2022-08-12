load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repositories():
    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life
    http_archive(
        name = "nodejs14_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "921680e244b813d6ffe06a4c22f87f05f39be635973c79486b2ded12a946cb37",
        strip_prefix = "node-v14.20.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.20.0/node-v14.20.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "c85b16d1a4c259d01be7111ecb0361260627e4fc245004a920521eacb28e50df",
        strip_prefix = "node-v16.16.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_amd64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "0bef16a77faed5220c2ea1555f7bd19ea79bfbb848dba62fbe9d43eb1a36fce0",
        strip_prefix = "node-v18.7.0-linux-x64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.7.0/node-v18.7.0-linux-x64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "d2d15363a2f3a0446983d51a90af7942fe8b1dd4a7f16128dfe718b3bf56dc07",
        strip_prefix = "node-v14.20.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.20.0/node-v14.20.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs16_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "378a3998e7c4dabd0cbd96b05a1b08e834c4b607f09c0745072de9423626fca4",
        strip_prefix = "node-v16.16.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs18_arm64",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "d971f644d3143422eb7a517e08c38a45a43cae14d977b3b96ff61b64f3a26b04",
        strip_prefix = "node-v18.7.0-linux-arm64/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.7.0/node-v18.7.0-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "nodejs14_ppc64le",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "b61f6ab4ec04e8b607b692199203ee3f88a6344ffa027dc90aa023b47f3edd95",
        strip_prefix = "node-v14.20.0-linux-ppc64le/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.20.0/node-v14.20.0-linux-ppc64le.tar.gz"],
    )

    http_archive(
        name = "nodejs16_ppc64le",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "3f1c57af5994e4f524d33e0173e5b60a76ad2347bc4b838719bc06cc0a1ef1c3",
        strip_prefix = "node-v16.16.0-linux-ppc64le/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-ppc64le.tar.gz"],
    )

    http_archive(
        name = "nodejs18_ppc64le",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "a5d2a43630f0a381bace91c31a7e7752b64341c3d8b2eaf5515f814fad07a231",
        strip_prefix = "node-v18.7.0-linux-ppc64le/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.7.0/node-v18.7.0-linux-ppc64le.tar.gz"],
    )

    http_archive(
        name = "nodejs14_s390x",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "5d1b24364d7de9ad7cc96250caa897949760ffd41398c1865577183a0b9e1cca",
        strip_prefix = "node-v14.20.0-linux-s390x/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v14.20.0/node-v14.20.0-linux-s390x.tar.gz"],
    )

    http_archive(
        name = "nodejs16_s390x",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "b71b5dd31f398c5467cc3b93a79d5757e7ad286e5ad2bd79d5fda6b775b481c7",
        strip_prefix = "node-v16.16.0-linux-s390x/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-s390x.tar.gz"],
    )

    http_archive(
        name = "nodejs18_s390x",
        build_file = "//nodejs:BUILD.nodejs",
        sha256 = "3d5330337892ff21a5fb7058a68aee3274ab36637b212380cbb78c45cd15244b",
        strip_prefix = "node-v18.7.0-linux-s390x/",
        type = "tar.gz",
        urls = ["https://nodejs.org/dist/v18.7.0/node-v18.7.0-linux-s390x.tar.gz"],
    )
