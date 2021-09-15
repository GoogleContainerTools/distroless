# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

BASE_ARCHITECTURES = ["amd64", "arm64"]

# Exceptions:
# - s390x doesn't have libunwind8.
#   https://github.com/GoogleContainerTools/distroless/pull/612#issue-500157699
# - ppc64le doesn't have stretch security-channel.
#   https://github.com/GoogleContainerTools/distroless/pull/637#issuecomment-728139611
# - arm needs someone with available hardware to generate:
#   //experimental/python2.7/ld.so.arm.cache
ARCHITECTURES = BASE_ARCHITECTURES + ["arm", "s390x", "ppc64le"]

VERSIONS = [
    ("debian10", "buster"),
    ("debian11", "bullseye"),
]

DEBIAN_SNAPSHOT = "20210915T024357Z"

DEBIAN_SECURITY_SNAPSHOT = "20210913T160424Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "d9c9c7624856a0b66caabdc7596d7e1dd98c3795652728f72c153417fa1aa441",
            "security": "105384496a5d64caf1da9f903c8ac79d8279373626eca55a8915b2ef56436b3a",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "fa9f4ebda926a83241f590ec0e7362860c719d6ec7a3c8d3bf9f5f7d7d169823",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "aee652955e83b5aa1cd4a4b8c48c68f8fce8d22cc7ab07ea51c58e022a10c8a7",
            "security": "a08435f58400351d572896886b85502179a32485abb77886d60cb1de08eb9e43",
        },
        "debian11": {
            "main": "d9dc9d75483fccd9f6f47d6baf1cf3bae166eb8d706de87241fee649d165c0bd",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "f8a767584ef2a02604aaa7e07dd3b461a1c876b23cb9687f5eae7fafe953bcf8",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "c82c25bcec6b5f2d375e30b8afb8ccf98ef3a2a20dcce1b8e6fa80562bc8195a",
            "security": "f9044cda7aa49928cc2ab6b486985707460fde2f2b5c1101c80036d7469f9ba8",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "d148281204b817c6e406fadb9395ed040418a616d62cc90215beaea73bd387b4",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "ab318a9532ec967f496284120c2450c27a15dfad97ea326c0c1698f39b9e80ad",
            "security": "9c12ed8a00a8168d14ed58693a4aeb959f66742e2650c8f4ebc8c57a0e0b68b6",
        },
        "debian11": {
            "main": "0d738ded499cb12ddda2055e225ddeec3f5ec4e002b90af367dd526f71d74716",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "1136a2ddde23535d8b9c233f2ab4d705c7c0317f940207988d51880acd3c1f65",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "f3d29f5654fc1bfdc4f96f4cd02b8a4507b8869da7ee31a354ef856e227633e0",
            "security": "c261562b72d79ab5a761b4f5c0d314e339c2dc8f03e7932d7dd3d806c689bce2",
        },
        "debian11": {
            "main": "af2cfa07996e2e5fb8dbb6e904b7f0910fcca79aee7bc25eed21ee0485fd9188",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "4942e7477efcc120af322668771d5357149a83eb6a79522fa2c41e4bfbb61414",
        },
    },
}
