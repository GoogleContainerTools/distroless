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

DEBIAN_SNAPSHOT = "20210824T085232Z"

DEBIAN_SECURITY_SNAPSHOT = "20210823T192121Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "d9c9c7624856a0b66caabdc7596d7e1dd98c3795652728f72c153417fa1aa441",
            "security": "a7f638d886ebc87d2bd7c7d318aa6bb1ef94c51e0714888d458ca8094ac46927",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "066df7442b71d9f3161213ce94d654488e236969530b9d363f6cb905c767c4d0",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "aee652955e83b5aa1cd4a4b8c48c68f8fce8d22cc7ab07ea51c58e022a10c8a7",
            "security": "baa1eaf3fbaec962db8b1841fc447ed7b0ba08a31621306b33afd37edf366fdd",
        },
        "debian11": {
            "main": "d9dc9d75483fccd9f6f47d6baf1cf3bae166eb8d706de87241fee649d165c0bd",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "344a1d176db38e0b4e0c7bd72da44d63aa2cf6291ecd563ed267a7ba002f2176",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "c82c25bcec6b5f2d375e30b8afb8ccf98ef3a2a20dcce1b8e6fa80562bc8195a",
            "security": "51216b162d5e533ea3f09134fa4b22b632b6374f129cfa85a8cd4fb5938b6856",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "038d0fb689e32ddbe5fcf7a5d54e8129c89266a5685b25a6b75551231f49e167",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "ab318a9532ec967f496284120c2450c27a15dfad97ea326c0c1698f39b9e80ad",
            "security": "45ed00190ef4a0f4787ca9194d81103cf0e0a72ee8fe0d8a0789772d25904468",
        },
        "debian11": {
            "main": "0d738ded499cb12ddda2055e225ddeec3f5ec4e002b90af367dd526f71d74716",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "3cf3c6e1fd7f73548c04513316dc2988adc42292286fce99c7bad96ea60c60e6",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "f3d29f5654fc1bfdc4f96f4cd02b8a4507b8869da7ee31a354ef856e227633e0",
            "security": "00a88afcf484d834b4ee0b4b798ec85894df9317fff1bb119e1f1f8995274aa3",
        },
        "debian11": {
            "main": "af2cfa07996e2e5fb8dbb6e904b7f0910fcca79aee7bc25eed21ee0485fd9188",
            "updates": "0040f94d11d0039505328a90b2ff48968db873e9e7967307631bf40ef5679275",
            "security": "99852fa516cebd1c7c7945d182c63edc63625bfa736a75fa945356a78a64da2b",
        },
    },
}
