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

DEBIAN_SNAPSHOT = "20210929T025048Z"

DEBIAN_SECURITY_SNAPSHOT = "20210927T122233Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "0936f32b2bfc20b4f2e4e3fb8c03853a4ec1b50e9b150f66a7c34a609b30ec00",
            "security": "e204130d94c1e6cc3caea81f4037c1c28b9a6ed31455ac157feb542f51e0dd30",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "942f49679a50f19ca65a74ae199c161659d505b9aca8bdfa62dfe9af74d468fd",
            "security": "88602074042c9f5f527edb4aae20a78f3471688c6f8dab3618fc318cacf15079",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "30eae05b1a48151ac8d9210bdaa63416bae1164edbc1877c1c45ba6194665122",
            "security": "b77439adc7fba4aa2f87a4ad2276b7ad2d0cd15a2cfb3c8d50ce8b9a7af9181c",
        },
        "debian11": {
            "main": "d9dc9d75483fccd9f6f47d6baf1cf3bae166eb8d706de87241fee649d165c0bd",
            "updates": "ba68fa6b90160b2f964c1cf9955f5845f321e4aa1ce098e8e8caa6828f83da5a",
            "security": "3cafdb8dacd6a613a6c6307c08b743414a1192f15144e8fe220e7e7f1efe9b24",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "d73fa59a15e7e781c789bde00002bbafbbfc9b307dc86c80cffce0ec1786f04b",
            "security": "4d6506ce3919a3472f79042c01e38ded258802c3a938284f2faa4887db822e02",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "1c3c0eb34677b8529760a3d53c7e591bcb3a1d35625db7638c3050e43972108b",
            "security": "be576442c5606937986b564fd36c5945a617506481cf2f96ddc2297c40b479ff",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "ca4232219b6fd6db324d022e29398c3abd20b20a74f616a78c5e2237f0f84fb2",
            "security": "e4b825e44535e1978c0cd463a9d41ca7d2cfe41484b09ea8310557850cc3541e",
        },
        "debian11": {
            "main": "0d738ded499cb12ddda2055e225ddeec3f5ec4e002b90af367dd526f71d74716",
            "updates": "03b9831e0b68693fdc0843d8e50617f763c7e41bda306b5f8d77cf2133dc1664",
            "security": "fd11d6bab73dc2fb92bb8ad6b0ca695505a7b7df9c86f650f21ede33043f4d96",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "b4c2d0eb902ac275a144f2fca96129608dda37ec2d531a7271692731aefdaa51",
            "security": "9258f0ee93a7043367873786f1fc86d8277ffa4eab354fc12407614d3da9b258",
        },
        "debian11": {
            "main": "af2cfa07996e2e5fb8dbb6e904b7f0910fcca79aee7bc25eed21ee0485fd9188",
            "updates": "dc4d120c139ee18e95593e3b625cc04aa842b5727d78f38a3f2fa2957318047d",
            "security": "fbf6d1b0ca25e52be4356ba986148dd21e0b26e27baf2e96973846b60f280cde",
        },
    },
}
