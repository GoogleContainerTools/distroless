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

DEBIAN_SNAPSHOT = "20211009T201124Z"

DEBIAN_SECURITY_SNAPSHOT = "20211009T162258Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "621d5053cc12eafc688e2c6f1ace9e421ad848c571a76d6bf3528183eec186f1",
            "updates": "0936f32b2bfc20b4f2e4e3fb8c03853a4ec1b50e9b150f66a7c34a609b30ec00",
            "security": "28c46e8edf175c03b32bb5a0fa9a45f766015a2b4fc9d37ce15c3a4653cc613d",
        },
        "debian11": {
            "main": "f9ea21b854a4212513001d30bfa5c6579e35b3a6dd48d6cc376f2296219c14ed",
            "updates": "942f49679a50f19ca65a74ae199c161659d505b9aca8bdfa62dfe9af74d468fd",
            "security": "1a00d795dce2a44e847e0f0729735c65b059bbb1f83d5f60903e3c6a636b15ca",
        },
    },
    "arm": {
        "debian10": {
            "main": "7dbc84e4745ad742cf239bbac8964bfa307e6a20abdfb5ed1cf1944ab69cfc21",
            "updates": "30eae05b1a48151ac8d9210bdaa63416bae1164edbc1877c1c45ba6194665122",
            "security": "c01843b8fc9c172cc87a2fa397fce64562a5e31593627b544b073a4626171dfa",
        },
        "debian11": {
            "main": "dc69fecba3b935499c1170772f84913d4eb8439f834f68a764bc42b041132752",
            "updates": "ba68fa6b90160b2f964c1cf9955f5845f321e4aa1ce098e8e8caa6828f83da5a",
            "security": "07f2e0fb1ed2d27261bbce166b9ec06e64c169147d173260f3e779f61c2ca9ff",
        },
    },
    "arm64": {
        "debian10": {
            "main": "10a463a79f83b618d0fb1897b1907ef23a8c7a74f5d9a329a41370fe445b6c28",
            "updates": "d73fa59a15e7e781c789bde00002bbafbbfc9b307dc86c80cffce0ec1786f04b",
            "security": "fdde30579699ff83703d69d417eb52f10b69ab4c849cc1ccdf6e1d492a3e17a0",
        },
        "debian11": {
            "main": "2b2841fa566a0d101aa832918dbd7f9aba7dbfcc4d15f2d8da36d7b358f1b7d2",
            "updates": "1c3c0eb34677b8529760a3d53c7e591bcb3a1d35625db7638c3050e43972108b",
            "security": "45804a3998134fd40897dab1fface7ec5b7e63b4907e601a348c12f57475fa64",
        },
    },
    "s390x": {
        "debian10": {
            "main": "2d4b7c1b6cecadba89499ff715fa184aa6322e0c1c04bf23a0dbc7b66c249e61",
            "updates": "ca4232219b6fd6db324d022e29398c3abd20b20a74f616a78c5e2237f0f84fb2",
            "security": "de2b8b1197ea3aead627e80cdacd00773b2bb86062866fd5dde2abd6bf5c8352",
        },
        "debian11": {
            "main": "f1c95c65a0b3995ada51624ba2066b1df186956e565a08e8417389ae9a11e9cc",
            "updates": "03b9831e0b68693fdc0843d8e50617f763c7e41bda306b5f8d77cf2133dc1664",
            "security": "5d091fdb5d4aa91b857ce08055233f62db42d3781c18c4db98c8487aa0368eeb",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "a70a3b95fb120b6703a3116c9999af99a7dbf7413115465f11836d7eb0cf7bb2",
            "updates": "b4c2d0eb902ac275a144f2fca96129608dda37ec2d531a7271692731aefdaa51",
            "security": "a2f95e2ff524e4c49886bef3313ebe241360a63d453dc056bf6b098e323ba8d5",
        },
        "debian11": {
            "main": "9c138d1d21f3905acdeec3be64e784763a4f69eaff4d0f22855b1d380ea3ec21",
            "updates": "dc4d120c139ee18e95593e3b625cc04aa842b5727d78f38a3f2fa2957318047d",
            "security": "bb81f8ec36ff5771b4bf50b5ce348bffc1dc6a649cfc605b87c3e58a683a6d65",
        },
    },
}
