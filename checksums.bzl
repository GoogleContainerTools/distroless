# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

ARCHITECTURES = ["amd64"]

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
}
