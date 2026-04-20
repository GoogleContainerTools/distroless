STATIC_DISTROS = ["debian12", "debian13"]
STATIC_ARCHITECTURES = {
    "debian12": ["amd64", "arm64", "arm", "s390x", "ppc64le"],
    "debian13": ["amd64", "arm64", "arm", "s390x", "ppc64le", "riscv64"],
}

STATIC_PACKAGES = {
    "debian12": [
        "base-files",
        "netbase",
        "tzdata",
        "media-types",
    ],
    "debian13": [
        "base-files",
        "netbase",
        "tzdata",
        "tzdata-legacy",
        "media-types",
    ],
}
