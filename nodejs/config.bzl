NODEJS_DISTROS = ["debian13"]
NODEJS_ARCHITECTURES = {
    "debian13": {
        "20": ["amd64", "arm64", "arm", "s390x", "ppc64le"],
        "22": ["amd64", "arm64", "arm", "s390x", "ppc64le"],
        "24": ["amd64", "arm64", "s390x", "ppc64le"],
    },
}
NODEJS_MAJOR_VERSIONS = ["20", "22", "24"]
