JAVA_DISTROS = ["debian13"]
JAVA_ARCHITECTURES = {
    "debian13": ["amd64", "arm64", "s390x", "ppc64le", "riscv64"],
}
JAVA_MAJOR_VERSIONS = {
    "debian13": ["17", "21", "25"],
}

JAVA_BASE_PACKAGES = {
    # debian 13 - temurin ships with libharfbuzz already
    "debian13": [
        "zlib1g",
        "libjpeg62-turbo",
        "liblcms2-2",
        "libfreetype6",
        "fonts-dejavu-core",
        "fontconfig-config",
        "libexpat1",
        "libfontconfig1",
        "libuuid1",
        "libbrotli1",
        "libcrypt1",
        "libstdc++6",
        "libgcc-s1",
        "gcc-14-base",
        "libpng16-16t64",
        "libbz2-1.0",
    ],
}
