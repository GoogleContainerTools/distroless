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
    ("debian9", "stretch"),
    ("debian10", "buster"),
]

DEBIAN_SNAPSHOT = "20201229T025249Z"

DEBIAN_SECURITY_SNAPSHOT = "20201228T231422Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444",
            "backports": "531e9bf9e6c2b35d08e68fb803cb1ea7b211ce81a32c158e6bc5c5f6fab7e491",
            "updates": "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9",
            "security": "da9c1b49a47e8c96aa648c755d775420615e9893d216daa6545beea12c2577cc",
        },
        "debian10": {
            "main": "15d6bbf761c95c4795d50d41a0385fd643c32b670c58d7abaa17f9736f17e578",
            "updates": "3ab69d5c94b822e273800a1873144005c9dfac6fe77dd101fb415ffdd71a6e0a",
            "security": "6e8095b89be1dd94c28156948b880eb720261452322c25c85e6eec14602b36fa",
        },
    },
    "arm": {
        "debian9": {
            "main": "36521cc720d75810da368854db057b68e0e389b8170611a141cfa4021d03259b",
            "backports": "fb57baff6ad1551e71b27c24f5ca048b635ce510ddbb1472c820e3b788174bf2",
            "updates": "469b19c81185621bb5e90401b508933d7921a6e0b8a10fd5e4b570ae0a83409e",
            "security": "617ba5fba34b4a76b73429ff38b2016af97b5013f0eef5a9d980892e96356976",
        },
        "debian10": {
            "main": "b3627288b064de7ca2d98ad008ddfad94d9de2624c24def331b77650a0e4966d",
            "updates": "b29070762e5aab8b0cdb0c9c569c988d7f28b264a6ba40418c164f1dd3b6d160",
            "security": "ae6a15b64a477455212a950ff0b001a160130ea758f24f22abbe9544e4c0d683",
        },
    },
    "arm64": {
        "debian9": {
            "main": "881d279ca3536ce84dbe9073a150ec2dfba898cb4c5010cbd50d07ba54942b3e",
            "backports": "328f3ec5675e605e7d5f46f6d3fc58a0c45cdeb4907fb3671c03bb9d68b2db51",
            "updates": "df9eadde7ef2ea7c7d3c07417e4924aece7bf3ccad8575e13ae68c71dcaa1d40",
            "security": "ae50dd29d6e7eedf5d0626e34bf647b3fbd836cd1e584dce4eb5622014f9ef61",
        },
        "debian10": {
            "main": "28d478abdb9f5163e11870becfd3caae37bea73d4d6a95e9e45cc9c2f9e1c965",
            "updates": "2b89d5e70847a9a191030558a2371b9a804c6b445194686e540741cde602fb51",
            "security": "8a760d3b20b6cb0e8a7f72848be9e9dee7604db3d570399b15e7b217f80eb71f",
        },
    },
    "s390x": {
        "debian9": {
            "main": "f40e0f3d2c203557de8670874703b7462b40c7db3d9ef7ea45bee166c0327abb",
            "backports": "9090debf1f065d0152688f879b03c80fbdf01e880443e6d4cde2458f21d24439",
            "updates": "dad6720cfbc75a335005e7c471722a2f67bfc7da9f75e653a74e73b3a7acc89f",
        },
        "debian10": {
            "main": "8acfdb66322fc278e491882e433c7a73755156bc1df93ddfef2886112ffedbe3",
            "updates": "250b7d1661bf3c18a6c213ae5d391c7551b88a307250d030c1c1cd745154a78b",
            "security": "9b215e96717c6f0057205591321571e0d2bd3d0e41cca3f7e9199aa7a48b107e",
        },
    },
    "ppc64le": {
        "debian9": {
            "main": "34aef3b450ec40c36b23aa61e8b1d68ed40ee4b496d597364db10a9eadad590e",
            "backports": "6c4fc3902aad4263ea96c3ee94523bd046fc8ea31da4fd7ecd58fd4aaa99c894",
            "updates": "2ef877054f0dd43151aed073c66214f217c25cc4a31efa7004a5aafb2442e809",
        },
        "debian10": {
            "main": "8b5054a0268cac706a034797dfd0513226322ea652889d3e47e85d97df463838",
            "updates": "92a32900328a005eade91a48eb00a0c80d1b3bf9a07d3ed1283191fcd2bd72f3",
            "security": "73237a4b37b2fc17cc8cef149687fdced23d7f6b6f2918a7551da4d09493568e",
        },
    },
}
