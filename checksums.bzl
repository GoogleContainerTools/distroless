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

DEBIAN_SNAPSHOT = "20210806T092041Z"

DEBIAN_SECURITY_SNAPSHOT = "20210805T221508Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "d9c9c7624856a0b66caabdc7596d7e1dd98c3795652728f72c153417fa1aa441",
            "security": "eace8da20f2bcc9c5540b04d09f21e9434c0cf2784c6a67b7f4c8d3fa55b34ba",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "aee652955e83b5aa1cd4a4b8c48c68f8fce8d22cc7ab07ea51c58e022a10c8a7",
            "security": "403a7eaa02e79cb2f0bcedbdcc02013efdccf28eda15c671e4ed92c61b8d0bac",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "c82c25bcec6b5f2d375e30b8afb8ccf98ef3a2a20dcce1b8e6fa80562bc8195a",
            "security": "7bd46c2456e14cea0cd1c769539a7ecd39d7df0fb82dd48791825a5e93bb8c29",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "ab318a9532ec967f496284120c2450c27a15dfad97ea326c0c1698f39b9e80ad",
            "security": "bce5bda5d51f7ae6e461345e5f0f7242abec769975ff590c7908dc546380b167",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "f3d29f5654fc1bfdc4f96f4cd02b8a4507b8869da7ee31a354ef856e227633e0",
            "security": "9b2b1ebabba4457b07bf3be90ea02d262dbeffbbdad6a81d08a5924747f2700e",
        },
    },
}
