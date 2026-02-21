VERSIONS = [
    ("debian12", "bookworm", "12"),
    ("debian13", "trixie", "13"),
]

VARIANTS = {
    "arm": "v7",
    "arm64": "v8",
}

ALL_ARCHITECTURES = ["amd64", "arm64", "arm", "s390x", "ppc64le", "riscv64"]
ALL_DISTROS = ["debian12", "debian13"]
