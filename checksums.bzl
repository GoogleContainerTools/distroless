BASE_ARCHITECTURES = ["amd64", "arm64"]

ARCHITECTURES = BASE_ARCHITECTURES + ["arm", "s390x", "ppc64le"]

VERSIONS = [
    ("debian11", "bullseye", "11"),  # deprecated
    ("debian12", "bookworm", "12"),
]

VARIANTS = {
    "arm": "v7",
    "arm64": "v8",
}
