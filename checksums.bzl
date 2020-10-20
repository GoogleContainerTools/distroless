# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

BASE_ARCHITECTURES = ["amd64", "arm64"]
ARCHITECTURES = BASE_ARCHITECTURES + ["s390x", "ppc64le"]

VERSIONS = [
    ("debian9", "stretch"),
    ("debian10", "buster"),
]

DEBIAN_SNAPSHOT = "20201020T085102Z"

DEBIAN_SECURITY_SNAPSHOT = "20201019T222439Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444",
            "backports": "113f1ea6c7c7b218d17ee39a194f3179a563071ac7a9f6403e7fa364ea45b21b",
            "updates": "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9",
            "security": "fe3720467cde121c2403ede7541485470ab726d47a5b04cedcdb97c19822d91c",
        },
        "debian10": {
            "main": "369d45f6c138af98d8ea8a598564dcabc1f6991ac777fb2d351e846f195cdc13",
            "updates": "80f0b86ca11476ea485625c3dff1505285f249f5603dd9458415707dacc5fb71",
            "security": "9866f20bc7880ff53078655626a9f0992fbf3d05bbdbbcce9754c3ae56ddeeec",
        },
    },
    "arm64": {
        "debian9": {
            "main": "881d279ca3536ce84dbe9073a150ec2dfba898cb4c5010cbd50d07ba54942b3e",
            "backports": "1c66410ff2c43f415507686199ba51405ee08b25ff59817b63454142f28c2879",
            "updates": "df9eadde7ef2ea7c7d3c07417e4924aece7bf3ccad8575e13ae68c71dcaa1d40",
            "security": "c4fd729b69fdf7380a4ff32706ace07a46f4f1a63d7d1e8629191325b8f43566",
        },
        "debian10": {
            "main": "62a7e0c34f45a2524024ef4871e48f061f8d57d54e6f9d75d2aa2bff55ca91b8",
            "updates": "dbaa8fd29f1fdd677468b6ec1dd6a0f68bcc037ae4a43f3550ef3435d3e651fd",
            "security": "30b78a7b70ad26e56d832de134ac0a64186c7e04f8209f248388be4e20a4f7bd",
        },
    },
    "s390x": {
        "debian9": {
            "main": "f40e0f3d2c203557de8670874703b7462b40c7db3d9ef7ea45bee166c0327abb",
            "backports": "2271a88ad912531e9beab00b54034d57df1fb51345e55336d8ad7ce11a24dfb1",
            "updates": "dad6720cfbc75a335005e7c471722a2f67bfc7da9f75e653a74e73b3a7acc89f",
        },
        "debian10": {
            "main": "ad07beb5da6151e8289f1f32b0eb43da061c28bbbb1a625c58974cfe5543cd1b",
            "updates": "3be4fd77f75edd1b0d734530560f77c9fd0cbf2d721759b000f239bbf5ddd8b0",
            "security": "47a3fe35d21f0f5135b03bc7f6ef53ff9bb27be1ee00e38e024cd963bec320af",
        },
    },
    "ppc64le": {
        "debian9": {
            "main": "34aef3b450ec40c36b23aa61e8b1d68ed40ee4b496d597364db10a9eadad590e",
            "backports": "b983f7ad16859e172b8481972c7de3fe3eb7ec23fbc01ee580c840e32b61aea0",
            "updates": "2ef877054f0dd43151aed073c66214f217c25cc4a31efa7004a5aafb2442e809",
        },
        "debian10": {
            "main": "6a60359ca6e3421c2b1ea1a9003f2127cb9e4c8e702a87c0c1074ea212cf171e",
            "updates": "ebb59cadbf9ea75cdb90a3026bfcfaadc441602bd2f85e75ea393fa5e713dafe",
            "security": "f114505bb208f38c9bb64d0485ebe67d1283e50f748ea23e08d05df9cad1709a",
        },
    },
}
