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

DEBIAN_SNAPSHOT = "20210622T032040Z"

DEBIAN_SECURITY_SNAPSHOT = "20210620T201244Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "cac8ec1569eb723def822f5b44cd6b0c159062af7f3d138d662ee734298f88aa",
            "updates": "ea476980dd2b071b58741557a441ad9e1dcea772578887f01c1572b3583fe889",
            "security": "32dc5ada71ae8008190ae105155c2361b166d9e35de479639a3dc7c162089c50",
        },
    },
    "arm": {
        "debian10": {
            "main": "1a971c6a8dd807e476c26705ebb56eeb4be4f626d67654085cc27b5241e6d7f7",
            "updates": "97036ed2c87bab1bfaea52cc814cde3351f01a201c1c821508ad3db32c4e379d",
            "security": "ed43f82fcb1b8c3e1129ae2654c8930614d8a5201966c47269d3db67add8b5d8",
        },
    },
    "arm64": {
        "debian10": {
            "main": "764700430a2e940aed47f91c19ea767b47945b082faec0610952a2f400bc7a3b",
            "updates": "79143f45ebada83e980f6ae0d70ddf5e32c3dc2f46f064f0ec3f835fe5634a9d",
            "security": "00744803d214dc0f1317d4714971dc5b1e1234c3da42f09cf306a90c856a4ba7",
        },
    },
    "s390x": {
        "debian10": {
            "main": "faaa3f0282c888ac0ceaa4c28a0d39355df99477fadbbc3f78d2c11808082721",
            "updates": "d49fc9ad0cf03e4f459024ade59dd2a3144b05425b970377dec5ed77000cf6b1",
            "security": "00bc4593648f08e97b7637d4c5477cbc96f249afc4b938beb5970afa937e9ca4",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "0321fc30f8277db65e80313b11eee0d0f8c9aa48adf0a670bb6826cd3cdefdaf",
            "updates": "2151783383838187350d83f1a0c624cf7e771b3b77e8a0f7202c007cead31492",
            "security": "a26eeb51e7027121ee04066e14fba6788f06b2d754b604b03711b83b9f02e2fc",
        },
    },
}
