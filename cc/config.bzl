CC_DISTROS = ["debian12", "debian13"]
CC_ARCHITECTURES = {
    "debian12": ["amd64", "arm64", "arm", "s390x", "ppc64le"],
    "debian13": ["amd64", "arm64", "arm", "s390x", "ppc64le", "riscv64"],
}

CC_PACKAGES = {
    "debian12": [
        "libgomp1",
        "libstdc++6",
        "libgcc-s1",
        "gcc-12-base",
    ],
    "debian13": [
        "libgomp1",
        "libstdc++6",
        "libgcc-s1",
        "gcc-14-base",
    ],
}
