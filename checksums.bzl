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
    ("debian10", "buster", "10"),
    ("debian11", "bullseye", "11"),
]

DEBIAN_SNAPSHOT = "20220125T085437Z"

DEBIAN_SECURITY_SNAPSHOT = "20220125T183304Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "621d5053cc12eafc688e2c6f1ace9e421ad848c571a76d6bf3528183eec186f1",
            "updates": "43269c849debb3b7b4d0b92bfab03284ea5b6335462cd5488a2e4178f73b9f75",
            "security": "579326aac6abab716f1c4a48b354a3cf3ac9681727e8b27372373be498d90e93",
        },
        "debian11": {
            "main": "6d5509534097dd37bbcc2ed7bb18e117511395ac3812562abbe019b64071e1bf",
            "updates": "1b157e478f2893e776e86182c487e8a90a88337420e433d617d516f3d44aaa4e",
            "security": "14db2e1bafaf0452c2c764aebd46abc7bed42d1273db63ea6e863b6dc34c366d",
        },
    },
    "arm": {
        "debian10": {
            "main": "7dbc84e4745ad742cf239bbac8964bfa307e6a20abdfb5ed1cf1944ab69cfc21",
            "updates": "e5dc84aebef97944ba4e220f250b6d4badb71fe8531d318969dfff65ef5cecba",
            "security": "129c350972f3880f6ff0886a51a218a0f2ab3627104be51e58de04c61562d627",
        },
        "debian11": {
            "main": "9f3c200daba0572b3c79f94f0215bd645b7b89e3c0fdf1c114aefce1e3ce76d4",
            "updates": "43e0dc7ff747c5412f8a377546164ac1c548e54624b12f031c3d05e58dc3bcc9",
            "security": "2e25dfbbca1301d1b87c652db30824ab76fc0a09484c1728c9d4a07dbfa7c496",
        },
    },
    "arm64": {
        "debian10": {
            "main": "10a463a79f83b618d0fb1897b1907ef23a8c7a74f5d9a329a41370fe445b6c28",
            "updates": "4e8dbae83e093c6f6be92df5a0c93e67b11ea0919d5c96c870eecfe810a35ed7",
            "security": "6faddc78cf9bee76d0a5978dfe67874700dad980044646f7f0a168c45fbdc70e",
        },
        "debian11": {
            "main": "66eca14926b41007cf7c2ca579f0b2d76f3c366f8b33ebcb6b9e55a640a8d41f",
            "updates": "b3ea000e0c282f21e88785bfed1e7c009ea37d6ab32987745cba418b5fd477e0",
            "security": "87f49b8196826c3e3a93e269a410c5c89a12d36ad47c8c794a7398eb2af14bde",
        },
    },
    "s390x": {
        "debian10": {
            "main": "2d4b7c1b6cecadba89499ff715fa184aa6322e0c1c04bf23a0dbc7b66c249e61",
            "updates": "ed5c33b46cb703a9afd8566b86284d4f565edb1b292119f022a717e29dd31f4c",
            "security": "75864051a28c217dbc8e07eb433b9797db3416a84dfced9551ea39fe662d47de",
        },
        "debian11": {
            "main": "4ac7b273c9bad3295733ca768cc53851b08e22a5133b0798b3943bb91cf06884",
            "updates": "5552d933d7fcf248fb12727b96ef71edbb176341c6f134f552e373c1c0a5351a",
            "security": "9aa97cd267a67f3e5923ddb0d93f79de88158c659688176c462d14c05001d014",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "a70a3b95fb120b6703a3116c9999af99a7dbf7413115465f11836d7eb0cf7bb2",
            "updates": "eba3699792c5eb1c90d669143558a8c252085fae49503564a23d98801a8cd799",
            "security": "93efd4291987cbaced7265bb41c2936719291067d82531d73cb15f17de2dc1c3",
        },
        "debian11": {
            "main": "c71cad8097b4a0b1a7b978bfa89679facc92cbf89982e1ac1d9cce0ffab86fcf",
            "updates": "e64c0663d9711f46cc1efd79f16e87c6c8871387ea5727875dccfcb111b013a4",
            "security": "9aa97cd267a67f3e5923ddb0d93f79de88158c659688176c462d14c05001d014",
        },
    },
}
