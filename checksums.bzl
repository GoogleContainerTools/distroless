# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

BASE_ARCHITECTURES = ["amd64", "arm64", "ppc64le"]
ARCHITECTURES = BASE_ARCHITECTURES + ["s390x"]

VERSIONS = [
    ("debian9", "stretch"),
    ("debian10", "buster"),
]

DEBIAN_SNAPSHOT = "20201109T031347Z"

DEBIAN_SECURITY_SNAPSHOT = "20201109T002306Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444",
            "backports": "3e9f446541403ffbd2682d82323d3809609115decc275a3943ccfb0421c831bc",
            "updates": "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9",
            "security": "ab0769a23e9dd7d722b01a5d7362014dfd04657a9834ffba0236acb43689ce56",
        },
        "debian10": {
            "main": "369d45f6c138af98d8ea8a598564dcabc1f6991ac777fb2d351e846f195cdc13",
            "updates": "5182b40388284eb0eb2199906ec6f4b969391460911db3fba8af22dceecf957e",
            "security": "bbb94b91b9f7407bb95d99e09fb8117e470bee424e002f36a43abe2eb4008abd",
        },
    },
    "arm64": {
        "debian9": {
            "main": "881d279ca3536ce84dbe9073a150ec2dfba898cb4c5010cbd50d07ba54942b3e",
            "backports": "bbee7bcafdd47bcbc1f996cbe2c2e96802c2091edcdf8435f49b52b172ddf082",
            "updates": "df9eadde7ef2ea7c7d3c07417e4924aece7bf3ccad8575e13ae68c71dcaa1d40",
            "security": "9c4c5f2203bfaeea4645d588601d21b13504a049b8a8fc8e8abf9642234c7a57",
        },
        "debian10": {
            "main": "62a7e0c34f45a2524024ef4871e48f061f8d57d54e6f9d75d2aa2bff55ca91b8",
            "updates": "2a4daac0602bb750fb90a37928212b0b5a580d1903a585fc651dacfd33853ded",
            "security": "ce3272291fe127d0ee867daaf98e0f98e10d81c6d7b30295a0cc88fd9d67f561",
        },
    },
    "s390x": {
        "debian9": {
            "main": "f40e0f3d2c203557de8670874703b7462b40c7db3d9ef7ea45bee166c0327abb",
            "backports": "4600aebd9956f1a84306df9110022b201ba4ebbe950446a53352a304655e6670",
            "updates": "dad6720cfbc75a335005e7c471722a2f67bfc7da9f75e653a74e73b3a7acc89f",
        },
        "debian10": {
            "main": "ad07beb5da6151e8289f1f32b0eb43da061c28bbbb1a625c58974cfe5543cd1b",
            "updates": "43bbce98e45ded47ac89bea0a8d2ae5b9d438ca09f1d1a688d509f7f31d1b6cb",
            "security": "efb9bb5d5e4449ca1ee09570cd7fc3eb7af7ee12a28ca9ddef3afbb29b3684cc",
        },
    },
    "ppc64le": {
        "debian9": {
            "main": "34aef3b450ec40c36b23aa61e8b1d68ed40ee4b496d597364db10a9eadad590e",
            "backports": "37ddcb6e6e96e494f3afd409680dbb0c57ef278453599f5e2a6366b6ead6da63",
            "updates": "2ef877054f0dd43151aed073c66214f217c25cc4a31efa7004a5aafb2442e809",
            "security": "18c384dc64731dd46dcb3537e7d1b34417392c5e37bf4ce563337bca305f60a4",
        },
        "debian10": {
            "main": "6a60359ca6e3421c2b1ea1a9003f2127cb9e4c8e702a87c0c1074ea212cf171e",
            "updates": "5e08f4fd0721fd8c877223b791b1d5d25b35dce10660e20733480443b9399994",
            "security": "4f0b53908a67349f040c63be720277f1d1b09ce1d02f0373fcb45950f18f8ae8",
        },
    },
}
