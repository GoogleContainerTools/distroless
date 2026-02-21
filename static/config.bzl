STATIC_DISTROS = ["debian12", "debian13"]
STATIC_ARCHITECTURES = {
    "debian12": ["amd64", "arm64", "arm", "s390x", "ppc64le"],
    "debian13": ["amd64", "arm64", "arm", "s390x", "ppc64le", "riscv64"],
}

# STATIC_PACKAGES is somewhat unecessary as the image has remained
# relative unchanged over the years, if we need to, we can add it in
