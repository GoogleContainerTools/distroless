BASE_DISTROS = ["debian13"]
BASE_ARCHITECTURES = {
    "debian13": ["amd64", "arm64", "arm", "s390x", "ppc64le", "riscv64"],
}

BASE_PACKAGES = {
    "debian13": [
        "libc6",
        "libssl3t64",
        "libzstd1",
        "zlib1g",
    ],
}

BASE_NOSSL_PACKAGES = {
    "debian13": [
        "libc6",
    ],
}
