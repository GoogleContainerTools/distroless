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

DEBIAN_SNAPSHOT = "20211026T205805Z"

DEBIAN_SECURITY_SNAPSHOT = "20211026T212307Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "621d5053cc12eafc688e2c6f1ace9e421ad848c571a76d6bf3528183eec186f1",
            "updates": "fb52db9beedcc50ad00b16a277844bd4d5e64a3d33e8c71b5c7e5663f1ce8e17",
            "security": "76eda34a11c33b2498241ce7708de7c2437d4e32c37283dacae0fd425244fec8",
        },
        "debian11": {
            "main": "f9ea21b854a4212513001d30bfa5c6579e35b3a6dd48d6cc376f2296219c14ed",
            "updates": "0371261a6f2b14d136bebd8057f886e00b60edf7db27bca86a12bcbd049ac09c",
            "security": "8d0894a40dc87a65418cba1429cc0d4119e162e88c85b948d69c3ba08ba74928",
        },
    },
    "arm": {
        "debian10": {
            "main": "7dbc84e4745ad742cf239bbac8964bfa307e6a20abdfb5ed1cf1944ab69cfc21",
            "updates": "fd8cbe658018c5af05ea32597ba90558663151700c35280af050f8b77bfea4cc",
            "security": "e3cecab2c79f5b489ff222eaab3765cf53dc329d4bbc13cfc94ce0d2bd092b5b",
        },
        "debian11": {
            "main": "dc69fecba3b935499c1170772f84913d4eb8439f834f68a764bc42b041132752",
            "updates": "11ba4ac708af50066372928c4c0573d81b339ac6df24d3a556fd8c4a85f13033",
            "security": "9f809ca9fb8607817675dc8ecad5c4918f4c6db16fb9e53eb6d6eb7d026a0909",
        },
    },
    "arm64": {
        "debian10": {
            "main": "10a463a79f83b618d0fb1897b1907ef23a8c7a74f5d9a329a41370fe445b6c28",
            "updates": "f5d43dc542d856d138947f0af5a2e82cfa3f9f20431030ab078aeceeb5a7f7c9",
            "security": "99d6e977e35e899553dea3a5a75862a2ad4d6c83d82e6fbc2155d896167bb497",
        },
        "debian11": {
            "main": "2b2841fa566a0d101aa832918dbd7f9aba7dbfcc4d15f2d8da36d7b358f1b7d2",
            "updates": "2d01324fd153e2d16b10a138b058bdcffc28d525a27d054535c233adf54c4378",
            "security": "c94804d7157c4eb097d4198598ff0ff5a7f33b43fe537ebc206647204945209d",
        },
    },
    "s390x": {
        "debian10": {
            "main": "2d4b7c1b6cecadba89499ff715fa184aa6322e0c1c04bf23a0dbc7b66c249e61",
            "updates": "0293c6d36a9259f97e06861bc72e45a0fafde9af8cb3c10e7b54494c4c665068",
            "security": "477a42b2fd7f7bd1fc483b27cd1f1d2833141f58c343c102537ec7769b11f2e9",
        },
        "debian11": {
            "main": "f1c95c65a0b3995ada51624ba2066b1df186956e565a08e8417389ae9a11e9cc",
            "updates": "12a75ff8e33bcb8f27ce61191c846d893399bceb05dffc4234a43177beda85ac",
            "security": "69c850fa54feb2d05113c844643b91e07dbca229c1ab3e96273a390df4e9fc24",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "a70a3b95fb120b6703a3116c9999af99a7dbf7413115465f11836d7eb0cf7bb2",
            "updates": "a18dc313cd512528ddb0a7cb802a5ac3dae612cabced27b81a57ac4499acd4bb",
            "security": "82c6006617321205ed3cea64e4f4507806cb8a38123684fa99ae2bd18db3949b",
        },
        "debian11": {
            "main": "9c138d1d21f3905acdeec3be64e784763a4f69eaff4d0f22855b1d380ea3ec21",
            "updates": "6970f7b4d8acdcb8494d7ea1cb1e427c984aabcaf17d9f5d95792fd41b931a1f",
            "security": "ba09d03004fa211af28489b53bd6141e1958c3c2768d23c8cfaaa9c7c9aa8818",
        },
    },
}
