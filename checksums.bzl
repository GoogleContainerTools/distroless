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

DEBIAN_SNAPSHOT = "20210404T202957Z"

DEBIAN_SECURITY_SNAPSHOT = "20210404T121356Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "b044c73a46671536011a26aedd8490dd31140538264ac12f26dc6dd0b4f0fcb8",
            "updates": "0c3115aeed29d5a8626633de68f2e409b2d182d7351521c46999634f62606de5",
            "security": "5a21ba772818036ba9df9a200544fd10cb4a4685d928d018f472ef19d0f0442c",
        },
    },
    "arm": {
        "debian10": {
            "main": "d5499221358080d6102d94c7a8b6f9a0ab5bf2f2eb19f13e1bfc040233dc7203",
            "updates": "9228093a94ba940bc8a1647527f4599b14087392bd035f15fa1e27a0221aec75",
            "security": "d0693b71edd16e9abcf56a6e503e79e905dcccea74abd9459ff876f94901ea52",
        },
    },
    "arm64": {
        "debian10": {
            "main": "8872854ad36339c580342aac66895fbb57b9c84f9193c4e684b688e30f878069",
            "updates": "8717f0b3f827e84dff68f232b8f99e8a8f5893a989418cc838c6ced28d074902",
            "security": "183de11017046d0864e869c96c352be032bd16ed61939ec4ce09a7861fe9fd97",
        },
    },
    "s390x": {
        "debian10": {
            "main": "65a68a794a6127c63cd430216dda2cd62ab7bf43baffdae14f9356baa5e8e481",
            "updates": "bba671f1411a0237153ee9de0622ec04c829a72c55405a1a8eeb9f34f8972be3",
            "security": "59e9be88788fd6ddddde3a8e92ae2a6c297b4b88f5a50c48f4061b8877420e42",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "9dc24a0b5943d38e877e599af865bdcc9ee9c5aa9f9708191195ab2f823d2c7e",
            "updates": "dfcf091e15376bfc8d1253461193b5a9985a79c5596f29cf7aa46e952894cc91",
            "security": "4c0e651609e3e91640d18af66202e652ba2a20773e0e28340d259b7c9c535c55",
        },
    },
}
