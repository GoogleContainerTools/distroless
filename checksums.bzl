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

DEBIAN_SNAPSHOT = "20210816T152513Z"

DEBIAN_SECURITY_SNAPSHOT = "20210816T155958Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "d9c9c7624856a0b66caabdc7596d7e1dd98c3795652728f72c153417fa1aa441",
            "security": "ba6070c44de7987f0d93d269fd5958211565d01875d56a3cc49915656ddf04c3",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "9913b3c33ab496c0610585ce5e2900c104fce0975798f8817c5f0f416b5e9e39",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "aee652955e83b5aa1cd4a4b8c48c68f8fce8d22cc7ab07ea51c58e022a10c8a7",
            "security": "8ca6b7594326ad1b0fdfb609276a5dde0d6bf9a4ed5c53545be8da3d45871183",
        },
        "debian11": {
            "main": "d9dc9d75483fccd9f6f47d6baf1cf3bae166eb8d706de87241fee649d165c0bd",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "14dc15d3cc05de3c58cf227d766d69ec56c0b3f3b33ee5fca3ef0ec03a79f81d",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "c82c25bcec6b5f2d375e30b8afb8ccf98ef3a2a20dcce1b8e6fa80562bc8195a",
            "security": "cf0682ba36a6a6c450fdc257bb990edeaa823648936eb9400906808cebd85751",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "bd5397f0574b18e2f4c98607a262fc4e54b6fbbce2049d232fce2694ca37c781",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "ab318a9532ec967f496284120c2450c27a15dfad97ea326c0c1698f39b9e80ad",
            "security": "794b1508d5d9e9211d7189cc1e1acf40e95a824f75bd5ab4003e10335d7a76fa",
        },
        "debian11": {
            "main": "0d738ded499cb12ddda2055e225ddeec3f5ec4e002b90af367dd526f71d74716",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "a0e21e20308a79b999fe9bda45d2e9e21195b3a752bd0159cce7e78eba1995c8",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "f3d29f5654fc1bfdc4f96f4cd02b8a4507b8869da7ee31a354ef856e227633e0",
            "security": "a8eb929a58cbcbae2bfcf930c75a79bc3f6068d26a739d7177f64409aaacf572",
        },
        "debian11": {
            "main": "af2cfa07996e2e5fb8dbb6e904b7f0910fcca79aee7bc25eed21ee0485fd9188",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "4b137578c4fcae4caba9c0f92c8857b743b60ff5d04b6f9fc76150e65ea81175",
        },
    },
}
