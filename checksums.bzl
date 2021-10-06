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

DEBIAN_SNAPSHOT = "20211006T084856Z"

DEBIAN_SECURITY_SNAPSHOT = "20211004T085236Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "0936f32b2bfc20b4f2e4e3fb8c03853a4ec1b50e9b150f66a7c34a609b30ec00",
            "security": "97bd385abee73080997b140dea8397e8672385f25ecff49bb970c303084eeb93",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "942f49679a50f19ca65a74ae199c161659d505b9aca8bdfa62dfe9af74d468fd",
            "security": "286655faf6380ce415772064ffbaea62eadf4ea3f644a060da0d5ee1c728e097",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "30eae05b1a48151ac8d9210bdaa63416bae1164edbc1877c1c45ba6194665122",
            "security": "56bd10a5f7bb813462eea28d38135488bcb6bb523784aeb44f6b9631cc746a56",
        },
        "debian11": {
            "main": "d9dc9d75483fccd9f6f47d6baf1cf3bae166eb8d706de87241fee649d165c0bd",
            "updates": "ba68fa6b90160b2f964c1cf9955f5845f321e4aa1ce098e8e8caa6828f83da5a",
            "security": "47654d4882b391ca00c68d2766a0504e0ab25814f70ce4c457c5aeb65833f646",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "d73fa59a15e7e781c789bde00002bbafbbfc9b307dc86c80cffce0ec1786f04b",
            "security": "cf0c24c33b13faf6c4f3d6dbffea19279b0c950dbeb6521ca728948ce9c45fb1",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "1c3c0eb34677b8529760a3d53c7e591bcb3a1d35625db7638c3050e43972108b",
            "security": "27897879f6ef66f533287d68282dd589532a2805f549560392513e40135fe3db",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "ca4232219b6fd6db324d022e29398c3abd20b20a74f616a78c5e2237f0f84fb2",
            "security": "fadea813ffac01144ba8beac508eb8fd4e40cd08eaf2534de37a4c3fc9bb5327",
        },
        "debian11": {
            "main": "0d738ded499cb12ddda2055e225ddeec3f5ec4e002b90af367dd526f71d74716",
            "updates": "03b9831e0b68693fdc0843d8e50617f763c7e41bda306b5f8d77cf2133dc1664",
            "security": "5014df6aa36a057ff741675e17d4598ce3cbdc4f1baa7755e403528029c9554c",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "b4c2d0eb902ac275a144f2fca96129608dda37ec2d531a7271692731aefdaa51",
            "security": "d7d5028468fc70dc035d064e1bd6f6dda4fd4e34e02f0d58a6515fded7af215b",
        },
        "debian11": {
            "main": "af2cfa07996e2e5fb8dbb6e904b7f0910fcca79aee7bc25eed21ee0485fd9188",
            "updates": "dc4d120c139ee18e95593e3b625cc04aa842b5727d78f38a3f2fa2957318047d",
            "security": "3e307fda15ca234b1423675c909930a104828da8817380476c57a24cc2a41385",
        },
    },
}
