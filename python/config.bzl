"python configurations"

PYTHON_DISTROS = ["debian13"]

# Full CPython versions live in //private/extensions:python.bzl.
PYTHON_MAJOR_VERSIONS = ["3.13", "3.14"]

PYTHON_ARCHITECTURES = {
    "debian13": {
        "3.13": ["amd64", "arm64", "s390x", "riscv64"],
        "3.14": ["amd64", "arm64", "s390x", "riscv64"],
    },
}

# libc-bin provides ldconfig for the generated library cache.
PYTHON_PACKAGES = {
    "debian13": ["libc-bin"],
}
