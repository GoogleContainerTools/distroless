JAVA_DISTROS = ["debian12", "debian13"]
JAVA_ARCHITECTURES = {
    "debian12": ["amd64", "arm64", "s390x", "ppc64le"],
    "debian13": ["amd64", "arm64", "s390x", "ppc64le", "riscv64"],
}
JAVA_MAJOR_VERSIONS = {
    "debian12": ["17", "21"],
    "debian13": ["17", "21", "25"],
}

# deprecated, remove with debian12 deprecation
JAVA_BUILD_BASE_PACKAGES = {
    "debian12": [
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
        "gcc-12-base",
        "libpng16-16",
    ],
}

JAVA_BASE_PACKAGES = {
    # debian 12 contains extra packages to add libharfbuzz
    "debian12": [
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
        "gcc-12-base",
        "libpng16-16",
        "libharfbuzz0b",
        "libgraphite2-3",
        "libpcre2-8-0",
        "libglib2.0-0",
    ],
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
