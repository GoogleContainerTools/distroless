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

DEBIAN_SNAPSHOT = "20210324T143457Z"

DEBIAN_SECURITY_SNAPSHOT = "20210324T170411Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444",
            "backports": "531e9bf9e6c2b35d08e68fb803cb1ea7b211ce81a32c158e6bc5c5f6fab7e491",
            "updates": "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9",
            "security": "f6f73adf02b17926720b21467451c226a56155b954cad72c7ca2a2d269a43183",
        },
        "debian10": {
            "main": "e096054471ae9a772fa67006cd0d9a0b125bb30443625fb6b66935e2a9331e98",
            "updates": "0c3115aeed29d5a8626633de68f2e409b2d182d7351521c46999634f62606de5",
            "security": "401e439217fdb195d14c35cc515d6d1322925374594ff8497aa9b16827bbc8f7",
        },
    },
    "arm": {
        "debian9": {
            "main": "36521cc720d75810da368854db057b68e0e389b8170611a141cfa4021d03259b",
            "backports": "fb57baff6ad1551e71b27c24f5ca048b635ce510ddbb1472c820e3b788174bf2",
            "updates": "469b19c81185621bb5e90401b508933d7921a6e0b8a10fd5e4b570ae0a83409e",
            "security": "e4a57f17d1db2c461f6e8f5492afcada5cca7c165856653be764c784f72756d1",
        },
        "debian10": {
            "main": "e81faa925d91cd54c2bb0d75acf8b9f52e3563ce7d70db72e97a695659b990f2",
            "updates": "9228093a94ba940bc8a1647527f4599b14087392bd035f15fa1e27a0221aec75",
            "security": "897d7f2b09ae10f3c04fd55462839fbb7ff8d62520e8155bb26b5d211ea39e7c",
        },
    },
    "arm64": {
        "debian9": {
            "main": "881d279ca3536ce84dbe9073a150ec2dfba898cb4c5010cbd50d07ba54942b3e",
            "backports": "328f3ec5675e605e7d5f46f6d3fc58a0c45cdeb4907fb3671c03bb9d68b2db51",
            "updates": "df9eadde7ef2ea7c7d3c07417e4924aece7bf3ccad8575e13ae68c71dcaa1d40",
            "security": "bf3290ec1f4ffb6ff9f5bcfd187a808850308e347c99e41707c3e97410f79fff",
        },
        "debian10": {
            "main": "06a831e6da011809e28563e1ececeb7b92ca27ac38a1471c8144af3604d231ac",
            "updates": "8717f0b3f827e84dff68f232b8f99e8a8f5893a989418cc838c6ced28d074902",
            "security": "99b90cffb0b1309834b6b3916fe830a7d0f4717e0ae165e1e1ab2840278a2849",
        },
    },
    "s390x": {
        "debian9": {
            "main": "f40e0f3d2c203557de8670874703b7462b40c7db3d9ef7ea45bee166c0327abb",
            "backports": "9090debf1f065d0152688f879b03c80fbdf01e880443e6d4cde2458f21d24439",
            "updates": "dad6720cfbc75a335005e7c471722a2f67bfc7da9f75e653a74e73b3a7acc89f",
        },
        "debian10": {
            "main": "41ab076efe61b31f2bd7ec3b1337617917d56582e2902fdea87093d158d832ee",
            "updates": "bba671f1411a0237153ee9de0622ec04c829a72c55405a1a8eeb9f34f8972be3",
            "security": "5e3f88a23a9b3520f0f1d62ff24358177b0d5791948d970b76a945c5b9c7178b",
        },
    },
    "ppc64le": {
        "debian9": {
            "main": "34aef3b450ec40c36b23aa61e8b1d68ed40ee4b496d597364db10a9eadad590e",
            "backports": "6c4fc3902aad4263ea96c3ee94523bd046fc8ea31da4fd7ecd58fd4aaa99c894",
            "updates": "2ef877054f0dd43151aed073c66214f217c25cc4a31efa7004a5aafb2442e809",
        },
        "debian10": {
            "main": "9b703573935b0e4bfaf492f4a074fd3c65e721fa93fb77a21b9f7bba7b77b8a1",
            "updates": "dfcf091e15376bfc8d1253461193b5a9985a79c5596f29cf7aa46e952894cc91",
            "security": "27a3b38152c524be84defbeb410382e57baf0463cdd05f46f8367f0050e20147",
        },
    },
}
