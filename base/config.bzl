BASE_DISTROS = ["debian12", "debian13"]
BASE_ARCHITECTURES = {
    "debian12": ["amd64", "arm64", "arm", "s390x", "ppc64le"],
    "debian13": ["amd64", "arm64", "arm", "s390x", "ppc64le", "riscv64"],
}

BASE_PACKAGES = {
    "debian12": [
        "libc6",
        "libssl3",
    ],
    "debian13": [
        "libc6",
        "libssl3t64",
        "libzstd1",
        "zlib1g",
    ],
}

BASE_NOSSL_PACKAGES = {
    "debian12": [
        "libc6",
    ],
    "debian13": [
        "libc6",
    ],
}
