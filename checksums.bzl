# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

ARCHITECTURES = ["amd64", "arm64"]

VERSIONS = [
    ("debian9", "stretch"),
    ("debian10", "buster"),
]

DEBIAN_SNAPSHOT = "20200927T204254Z"

DEBIAN_SECURITY_SNAPSHOT = "20200927T121505Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444",
            "backports": "d974ef641167c420730833c1ffc7256f44eed36af787f5efdbbbc0d4c5b47a2e",
            "updates": "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9",
            "security": "152f4ee5e50c3829fc7982f103ec7afe0441d3b4072bc657cea6036a21063258",
        },
        "debian10": {
            "main": "369d45f6c138af98d8ea8a598564dcabc1f6991ac777fb2d351e846f195cdc13",
            "updates": "80f0b86ca11476ea485625c3dff1505285f249f5603dd9458415707dacc5fb71",
            "security": "65a7d953631a815794d64249070e9f8e163f2028ffdb8fccf2df11e7fc444089",
        },
    },
    "arm64": {
        "debian9": {
            "main": "881d279ca3536ce84dbe9073a150ec2dfba898cb4c5010cbd50d07ba54942b3e",
            "backports": "b88b2b870ea716776c817a887be8f1b3fcb33e33f017f01798d0328d75787d2a",
            "updates": "df9eadde7ef2ea7c7d3c07417e4924aece7bf3ccad8575e13ae68c71dcaa1d40",
            "security": "78851eff44e544a9afb9523dcb22326f52dd41ae75b71908ba2a6071f0f38d62",
        },
        "debian10": {
            "main": "62a7e0c34f45a2524024ef4871e48f061f8d57d54e6f9d75d2aa2bff55ca91b8",
            "updates": "dbaa8fd29f1fdd677468b6ec1dd6a0f68bcc037ae4a43f3550ef3435d3e651fd",
            "security": "8dcbd4a8097d364e1991d27530f925acdd522caa3f4ba1aa1a8daa09678a2bc2",
        },
    },
}
