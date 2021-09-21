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
#   //experimental/python3/ld.so.arm.cache
ARCHITECTURES = BASE_ARCHITECTURES + ["arm", "s390x", "ppc64le"]

VERSIONS = [
    ("debian10", "buster"),
    ("debian11", "bullseye"),
]

DEBIAN_SNAPSHOT = "20210920T144924Z"

DEBIAN_SECURITY_SNAPSHOT = "20210920T191155Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "6843a5d699f117b663d3f3264937902ca8d27f72c41a29158eea0f4e14a590c1",
            "security": "b63d48c0ef1cd77644fa317eac4fe365834aa67e8d9ec1b29cf47bcf80747dc9",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "9d9184580240eb92ae0af4929191c180d13364f2d3f5258d79ae48d9f5f9f9ae",
            "security": "2272f2683c4b7212d4ca5a48c6e7bde30ffe97f83f364f88e67feacadc661044",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "dc2f8892a23ff27125993d38eed9efecb2dfd8b77ddd3f82483b71a90db2719e",
            "security": "ef25999e71aaa86c38ec7deffc765b023af8d10260709429f9ede363d4ba76cf",
        },
        "debian11": {
            "main": "d9dc9d75483fccd9f6f47d6baf1cf3bae166eb8d706de87241fee649d165c0bd",
            "updates": "db4b24472c1ba2db9375a3f49e6421775483582a17d654db72eba3bf4d502f6c",
            "security": "aa46fd9ebbede7f7bb38f70ea0920046f6786c29d77d0c19a449fc1f33093aaa",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "9851dabc9903095a5631f1e6980da1fd88051a01c5408748ba4333b6267e239b",
            "security": "8a0a3fc23c597d34942f98c91f6c804f35bde2aef4c4fe3bfa8ec4bbfab0e08c",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "5cfc5140dff68cf017e526d90ac8ec5144b0f6eef057c3d81164163326febd77",
            "security": "6c6f37544c28620fb75261adb8463e6c061306b17f4c9c681286d0cc55e8f732",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "b2e58f71a61ff5aa01004edfe3a0488d8ffaedb7e40dfdf01d949adb16d6c26b",
            "security": "4c46c4e0a14b3349102ded8a78a260084dfcb94b46cccc746cc2c41d6964c3d7",
        },
        "debian11": {
            "main": "0d738ded499cb12ddda2055e225ddeec3f5ec4e002b90af367dd526f71d74716",
            "updates": "139b3cc7e0dd5ea3d7f9daf5e637553018f2f0a3d60a64697141d25ce8083c14",
            "security": "a84d24fc75925e1a2e99e3fe391939225261b3780d98dff3026b67cce717b8fb",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "02527ab580bc2e3ea72be997a0b3034d0d26d715ac5c3851ffca0752082f38ad",
            "security": "706a90b6d841d85e33e03d243de62a978bdae2c9e54a1befa992997390e7c0e4",
        },
        "debian11": {
            "main": "af2cfa07996e2e5fb8dbb6e904b7f0910fcca79aee7bc25eed21ee0485fd9188",
            "updates": "f8b507c08fd49cbaec15916d1de4edd139a28e57ad718143c8f3656b6b551192",
            "security": "05165e7e63b4fc143fb533865c16def5662b316fbd1f9ffe8c1840a87aa17f83",
        },
    },
}
