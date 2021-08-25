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

DEBIAN_SNAPSHOT = "20210825T085930Z"

DEBIAN_SECURITY_SNAPSHOT = "20210824T151848Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "d9c9c7624856a0b66caabdc7596d7e1dd98c3795652728f72c153417fa1aa441",
            "security": "129275d08d6a6ea3def0eb809d858bcf787f4f1c5b4af337d1ad63f2539b2517",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "1fc9787bca658f6ad044ae7ec430a5d1fafd9e4f4690e3e60d1937ed675a2fdf",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "aee652955e83b5aa1cd4a4b8c48c68f8fce8d22cc7ab07ea51c58e022a10c8a7",
            "security": "347fecb2825d501cd1391b741d10af35d812d21003b3019e54e58307ff6cb822",
        },
        "debian11": {
            "main": "d9dc9d75483fccd9f6f47d6baf1cf3bae166eb8d706de87241fee649d165c0bd",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "1b5cc15afb7f4c9045ed9e42acc2022f9c8d575924670df524dc7e033bf3df0c",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "c82c25bcec6b5f2d375e30b8afb8ccf98ef3a2a20dcce1b8e6fa80562bc8195a",
            "security": "ef2ea30f6951516989346b598eb94f793b9c7e15794a96307650eabbfc16b19b",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "f929c3409c330179b301dabd97c10b6caab3bf78eee18fa72c4c0e3f28fa831f",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "ab318a9532ec967f496284120c2450c27a15dfad97ea326c0c1698f39b9e80ad",
            "security": "50f01af3f4c1a27fa4c70866d7092c20cde8d23f56123d46eb30bdbf1c1d5dbe",
        },
        "debian11": {
            "main": "0d738ded499cb12ddda2055e225ddeec3f5ec4e002b90af367dd526f71d74716",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "a92fcf14034bfd7c7feba002d88526dad46a4a17a27cbd17e41dbb3047c3826c",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "f3d29f5654fc1bfdc4f96f4cd02b8a4507b8869da7ee31a354ef856e227633e0",
            "security": "9433bb5a53c35daa343fe4fad527687a244ef73fe40fe68ece3a31388472f1f2",
        },
        "debian11": {
            "main": "af2cfa07996e2e5fb8dbb6e904b7f0910fcca79aee7bc25eed21ee0485fd9188",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "dea34676130b6d82368d76391d8a4f746fcea34b1de8c0677f3bd7fe97fd3520",
        },
    },
}
