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

DEBIAN_SNAPSHOT = "20211101T213752Z"

DEBIAN_SECURITY_SNAPSHOT = "20211102T015327Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "621d5053cc12eafc688e2c6f1ace9e421ad848c571a76d6bf3528183eec186f1",
            "updates": "fb52db9beedcc50ad00b16a277844bd4d5e64a3d33e8c71b5c7e5663f1ce8e17",
            "security": "0d80990f0ac93fce4422c402cd2964289dc9a13eb1fa19e9b9c6e316a6206fcb",
        },
        "debian11": {
            "main": "f9ea21b854a4212513001d30bfa5c6579e35b3a6dd48d6cc376f2296219c14ed",
            "updates": "0371261a6f2b14d136bebd8057f886e00b60edf7db27bca86a12bcbd049ac09c",
            "security": "1df31dab44ceda58c6caa881428e797ec0011ed0bdf1c7b312247ab54a5e0624",
        },
    },
    "arm": {
        "debian10": {
            "main": "7dbc84e4745ad742cf239bbac8964bfa307e6a20abdfb5ed1cf1944ab69cfc21",
            "updates": "fd8cbe658018c5af05ea32597ba90558663151700c35280af050f8b77bfea4cc",
            "security": "7baa12a538821e6ea292b1691bef036a0b0e4e369e5f5bd8046fd4888fdeca7f",
        },
        "debian11": {
            "main": "dc69fecba3b935499c1170772f84913d4eb8439f834f68a764bc42b041132752",
            "updates": "11ba4ac708af50066372928c4c0573d81b339ac6df24d3a556fd8c4a85f13033",
            "security": "72bb4d0182afc61ac8ea4b8a6ed5b5bcf084011b8e11326542d126a56cbf607e",
        },
    },
    "arm64": {
        "debian10": {
            "main": "10a463a79f83b618d0fb1897b1907ef23a8c7a74f5d9a329a41370fe445b6c28",
            "updates": "f5d43dc542d856d138947f0af5a2e82cfa3f9f20431030ab078aeceeb5a7f7c9",
            "security": "47cb771200864f8eda637f5ecb8d9cae69f961c07acad8afc10653cef22c0794",
        },
        "debian11": {
            "main": "2b2841fa566a0d101aa832918dbd7f9aba7dbfcc4d15f2d8da36d7b358f1b7d2",
            "updates": "2d01324fd153e2d16b10a138b058bdcffc28d525a27d054535c233adf54c4378",
            "security": "11ce48f00315a8c1c1dc78f33d3d3886111d29416302e8125fa0d6225e800360",
        },
    },
    "s390x": {
        "debian10": {
            "main": "2d4b7c1b6cecadba89499ff715fa184aa6322e0c1c04bf23a0dbc7b66c249e61",
            "updates": "0293c6d36a9259f97e06861bc72e45a0fafde9af8cb3c10e7b54494c4c665068",
            "security": "20b6325e0f7d064901c5fbbe753adaa9dc497ada38b7e794111f0dc9975e5f55",
        },
        "debian11": {
            "main": "f1c95c65a0b3995ada51624ba2066b1df186956e565a08e8417389ae9a11e9cc",
            "updates": "12a75ff8e33bcb8f27ce61191c846d893399bceb05dffc4234a43177beda85ac",
            "security": "67a80be0451d9920e2859253407be9d261e7c1c192a5cad8242b4dbc618cc00f",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "a70a3b95fb120b6703a3116c9999af99a7dbf7413115465f11836d7eb0cf7bb2",
            "updates": "a18dc313cd512528ddb0a7cb802a5ac3dae612cabced27b81a57ac4499acd4bb",
            "security": "9f880cec7606cdfef187fc8cf161f745033a4a04cacb73e56549e8c1fe385d27",
        },
        "debian11": {
            "main": "9c138d1d21f3905acdeec3be64e784763a4f69eaff4d0f22855b1d380ea3ec21",
            "updates": "6970f7b4d8acdcb8494d7ea1cb1e427c984aabcaf17d9f5d95792fd41b931a1f",
            "security": "4c1af847086e05cca492e4bb66c95be1e923043fcd975ced94cf96c39d8b44e4",
        },
    },
}
