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
]

DEBIAN_SNAPSHOT = "20210424T023510Z"

DEBIAN_SECURITY_SNAPSHOT = "20210424T032428Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "b044c73a46671536011a26aedd8490dd31140538264ac12f26dc6dd0b4f0fcb8",
            "updates": "4eb0f1127acc753980a5073149c5cd145b1e9e3ca0800256911abbff2e0dd390",
            "security": "95ec9caa72ce64e949b15cd927e192e71401e2fb42ecfc11e499e9504d1e9c84",
        },
    },
    "arm": {
        "debian10": {
            "main": "d5499221358080d6102d94c7a8b6f9a0ab5bf2f2eb19f13e1bfc040233dc7203",
            "updates": "6808fabdfb6660651ee3a098da13cc078549d09cc1a0ba0a1211dc1be8346ff3",
            "security": "140aee16d0a5c2fd79c473ed8b5e87dc60a3ff460760aa53e7522acf4524050c",
        },
    },
    "arm64": {
        "debian10": {
            "main": "8872854ad36339c580342aac66895fbb57b9c84f9193c4e684b688e30f878069",
            "updates": "86fc791512ce019184d9c2408d751ff37b48f69442658082aec1ee8a71dea812",
            "security": "9def8c1d459066f2f0884746d1e4802cd40c7be77fdd5a089b741e9780a00fd6",
        },
    },
    "s390x": {
        "debian10": {
            "main": "65a68a794a6127c63cd430216dda2cd62ab7bf43baffdae14f9356baa5e8e481",
            "updates": "6b08d1c5bf7a2f7c48f0cba99f067f6fd6b379e1fea1d03ab5facedf6c91e890",
            "security": "199d64e12bb4dc07c996f179e37064e195c15d8b9cc1c114b1fda6bf86d05775",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "9dc24a0b5943d38e877e599af865bdcc9ee9c5aa9f9708191195ab2f823d2c7e",
            "updates": "a551d6e7ce748baaaf283a1331148092847d9d178c84da1d426f7b66095cfe0f",
            "security": "604ebce983e4eae5ddf57dde0dd2a9a28c7de3f143f87bac854c83357f2ad3d3",
        },
    },
}
