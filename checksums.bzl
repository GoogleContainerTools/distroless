# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

BASE_ARCHITECTURES = ["amd64", "arm64"]
ARCHITECTURES = BASE_ARCHITECTURES + ["s390x", "ppc64le"]

VERSIONS = [
    ("debian9", "stretch"),
    ("debian10", "buster"),
]

DEBIAN_SNAPSHOT = "20201026T024334Z"

DEBIAN_SECURITY_SNAPSHOT = "20201025T223333Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444",
            "backports": "113f1ea6c7c7b218d17ee39a194f3179a563071ac7a9f6403e7fa364ea45b21b",
            "updates": "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9",
            "security": "d88e417a18d25f39fbd9cf46e3026b79a183fd679562db3a37681dcf86bcdf97",
        },
        "debian10": {
            "main": "369d45f6c138af98d8ea8a598564dcabc1f6991ac777fb2d351e846f195cdc13",
            "updates": "5182b40388284eb0eb2199906ec6f4b969391460911db3fba8af22dceecf957e",
            "security": "696118f1b0df430190a6db160ca85b5e2de1864c93410474dcabfc55f49eb332",
        },
    },
    "arm64": {
        "debian9": {
            "main": "881d279ca3536ce84dbe9073a150ec2dfba898cb4c5010cbd50d07ba54942b3e",
            "backports": "1c66410ff2c43f415507686199ba51405ee08b25ff59817b63454142f28c2879",
            "updates": "df9eadde7ef2ea7c7d3c07417e4924aece7bf3ccad8575e13ae68c71dcaa1d40",
            "security": "7353fa323930a51d4e6b0794fa1251f7e5c93feee6993b46fdef038bab005765",
        },
        "debian10": {
            "main": "62a7e0c34f45a2524024ef4871e48f061f8d57d54e6f9d75d2aa2bff55ca91b8",
            "updates": "2a4daac0602bb750fb90a37928212b0b5a580d1903a585fc651dacfd33853ded",
            "security": "2e5730451b1a907a454694ae7bff2cc921ed8631df8e6e671cfc43533f1cc3dc",
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
            "updates": "43bbce98e45ded47ac89bea0a8d2ae5b9d438ca09f1d1a688d509f7f31d1b6cb",
            "security": "0209e697a7b35f9ec2a8793b12f125785467ced9a6e7aa5d1e47ebdec7ea5e6b",
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
            "updates": "5e08f4fd0721fd8c877223b791b1d5d25b35dce10660e20733480443b9399994",
            "security": "eb849bec540ea9ac490bf05e659f7898c929ae1f3d905b82895f5b63ba929825",
        },
    },
}
