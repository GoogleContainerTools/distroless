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

DEBIAN_SNAPSHOT = "20210201T084000Z"

DEBIAN_SECURITY_SNAPSHOT = "20210201T142922Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444",
            "backports": "531e9bf9e6c2b35d08e68fb803cb1ea7b211ce81a32c158e6bc5c5f6fab7e491",
            "updates": "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9",
            "security": "8c83b6ad605b126d2722e98af63a8c6f973f7e4bbbb05534fb76db386801cef8",
        },
        "debian10": {
            "main": "15d6bbf761c95c4795d50d41a0385fd643c32b670c58d7abaa17f9736f17e578",
            "updates": "02974e692a7a5ac0617007b38bb41ede9d7dc0f9da04b44df2b22474e689214a",
            "security": "cd1a00a9e999e5a8163e0518e42f9635cc340c3c5d1265b9caeb05c7aa2c919b",
        },
    },
    "arm": {
        "debian9": {
            "main": "36521cc720d75810da368854db057b68e0e389b8170611a141cfa4021d03259b",
            "backports": "fb57baff6ad1551e71b27c24f5ca048b635ce510ddbb1472c820e3b788174bf2",
            "updates": "469b19c81185621bb5e90401b508933d7921a6e0b8a10fd5e4b570ae0a83409e",
            "security": "141775c79bc043f4f8f2cc4298ef76f1a0b0aed73874d4b59ab2749597041422",
        },
        "debian10": {
            "main": "b3627288b064de7ca2d98ad008ddfad94d9de2624c24def331b77650a0e4966d",
            "updates": "ed569ba9af75cc26b5873de0b2c951080dcc1a25a1f13e3213a145f8b9fc25e2",
            "security": "d6deee9bbace5ec400c1511656024d3338b9862e130280346fa2ce7f5e23685c",
        },
    },
    "arm64": {
        "debian9": {
            "main": "881d279ca3536ce84dbe9073a150ec2dfba898cb4c5010cbd50d07ba54942b3e",
            "backports": "328f3ec5675e605e7d5f46f6d3fc58a0c45cdeb4907fb3671c03bb9d68b2db51",
            "updates": "df9eadde7ef2ea7c7d3c07417e4924aece7bf3ccad8575e13ae68c71dcaa1d40",
            "security": "2bd40ec65372bc1ee631b2ac640cda13f239089f05d6c0eccad45a858455462f",
        },
        "debian10": {
            "main": "28d478abdb9f5163e11870becfd3caae37bea73d4d6a95e9e45cc9c2f9e1c965",
            "updates": "78285a450776c38c1f1566c97a44fb936c2fabe98b2971c78681c2101092852d",
            "security": "30699ede67d4197b075d5ac3e904d5d8c4f820c1caf716b214564c7b3abaae21",
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
            "updates": "73e2dd6a7f02a4fccd51d448de09baee055ec50b16b386dce3a7d080793d81e8",
            "security": "9a4ba334a2a75f4a7980ffcf00714e53b1d68da67d47449236e7c9ce99ad4526",
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
            "updates": "f4106353acacff561cc001adeb363393748bb4242307c918715a2a425083facf",
            "security": "7c0db628328de2c667be21d3fd7493a04f6b43a18c04ecd9a271a47d2bf8d4ae",
        },
    },
}
