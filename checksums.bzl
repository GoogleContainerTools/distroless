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

DEBIAN_SNAPSHOT = "20210403T205218Z"

DEBIAN_SECURITY_SNAPSHOT = "20210403T195250Z"

SHA256s = {
    "amd64": {
        "debian9": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "backports": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "security": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
        "debian10": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "security": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
    },
    "arm": {
        "debian9": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "backports": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "security": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
        "debian10": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "security": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
    },
    "arm64": {
        "debian9": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "backports": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "security": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
        "debian10": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "security": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
    },
    "s390x": {
        "debian9": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "backports": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
        "debian10": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "security": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
    },
    "ppc64le": {
        "debian9": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "backports": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
        "debian10": {
            "main": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "updates": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
            "security": "d9e152eeda7907d53d2d65af874e06d13b7831e4fe4543f4cc89d15ed742a438",
        },
    },
}
