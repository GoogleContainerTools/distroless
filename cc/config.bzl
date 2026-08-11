CC_DISTROS = ["debian13"]
CC_ARCHITECTURES = {
    "debian13": ["amd64", "arm64", "arm", "s390x", "ppc64le", "riscv64"],
}

CC_PACKAGES = {
    "debian13": [
        "libgomp1",
        "libstdc++6",
        "libgcc-s1",
        "gcc-14-base",
    ],
}
