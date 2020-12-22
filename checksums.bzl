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

DEBIAN_SNAPSHOT = "20201222T032223Z"

DEBIAN_SECURITY_SNAPSHOT = "20201222T054043Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444",
            "backports": "531e9bf9e6c2b35d08e68fb803cb1ea7b211ce81a32c158e6bc5c5f6fab7e491",
            "updates": "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9",
            "security": "c7b29364292f87e51cc561ee81bf95cabc19f45b11100aa0a4868e6f078ebe8b",
        },
        "debian10": {
            "main": "15d6bbf761c95c4795d50d41a0385fd643c32b670c58d7abaa17f9736f17e578",
            "updates": "5182b40388284eb0eb2199906ec6f4b969391460911db3fba8af22dceecf957e",
            "security": "5e249075b0a908845a39599f3e5ad6b8b01b9356e469d86d6c9f34cb72cbdb78",
        },
    },
    "arm": {
        "debian9": {
            "main": "36521cc720d75810da368854db057b68e0e389b8170611a141cfa4021d03259b",
            "backports": "fb57baff6ad1551e71b27c24f5ca048b635ce510ddbb1472c820e3b788174bf2",
            "updates": "469b19c81185621bb5e90401b508933d7921a6e0b8a10fd5e4b570ae0a83409e",
            "security": "b81e3ac0ed0586dc5c80aba7450114d9e0801c6acdff423c394ff494552e91dc",
        },
        "debian10": {
            "main": "b3627288b064de7ca2d98ad008ddfad94d9de2624c24def331b77650a0e4966d",
            "updates": "9d4f6aa80f3440a4f38eba8696c696102ff20663d3c08c37e0ab30ba1aa2aa26",
            "security": "6984f1d4693d7f90c6e7e2a22b69936144bf6f98f776408558b1cbf363a5eb31",
        },
    },
    "arm64": {
        "debian9": {
            "main": "881d279ca3536ce84dbe9073a150ec2dfba898cb4c5010cbd50d07ba54942b3e",
            "backports": "328f3ec5675e605e7d5f46f6d3fc58a0c45cdeb4907fb3671c03bb9d68b2db51",
            "updates": "df9eadde7ef2ea7c7d3c07417e4924aece7bf3ccad8575e13ae68c71dcaa1d40",
            "security": "43c963fca805b497636947f092186177ebfb6dcaa63ff200c9a701d1a7ae04f8",
        },
        "debian10": {
            "main": "28d478abdb9f5163e11870becfd3caae37bea73d4d6a95e9e45cc9c2f9e1c965",
            "updates": "2a4daac0602bb750fb90a37928212b0b5a580d1903a585fc651dacfd33853ded",
            "security": "da06f341f0b46ccad44b4cf48037bf8ebc5d35a1f002e58650433e9813f9f0b4",
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
            "updates": "43bbce98e45ded47ac89bea0a8d2ae5b9d438ca09f1d1a688d509f7f31d1b6cb",
            "security": "55d8a0ebe5f7f4d29c786facc831506eef58fbca2bbccd7cab64535f79c45576",
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
            "updates": "5e08f4fd0721fd8c877223b791b1d5d25b35dce10660e20733480443b9399994",
            "security": "c4682ed0e34bee15c30f41e07eb577cddc5b2a665ad08340910b95e49ea320b1",
        },
    },
}
