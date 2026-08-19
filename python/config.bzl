"python configurations"

PYTHON_DISTROS = ["debian13"]

# The image tag segment, e.g. python3.14-debian13.
# Full CPython versions live in //private/extensions:python.bzl (python_versions repo).
# debian12 is intentionally absent: new debian12 builds are being deprecated upstream.
PYTHON_MAJOR_VERSIONS = ["3.13", "3.14"]

PYTHON_ARCHITECTURES = {
    "debian13": {
        "3.13": ["amd64", "arm64", "s390x", "riscv64"],
        "3.14": ["amd64", "arm64", "s390x", "riscv64"],
    },
}

# deb packages added to the image: libc-bin provides /sbin/ldconfig so
# ctypes.util.find_library() works via a generated ld.so.cache (python3/ parity).
PYTHON_PACKAGES = {
    "debian13": ["libc-bin"],
}
