STATIC_DISTROS = ["debian13"]
STATIC_ARCHITECTURES = {
    "debian13": ["amd64", "arm64", "arm", "s390x", "ppc64le", "riscv64"],
}

STATIC_PACKAGES = {
    "debian13": [
        "base-files",
        "netbase",
        "tzdata",
        "tzdata-legacy",
        "media-types",
    ],
}
