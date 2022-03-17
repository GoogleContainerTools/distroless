load("//base:base.bzl", "deb_file")

def php_core_libs(arch, distro):
    libs = [
        "libmagic1",
        "libmagic-mgc",
        "mime-support",
        "libsystemd0",
        "libgcrypt20",
        "libgpg-error0",
        "liblz4-1",
        "libacl1",
        "libattr1",
        "libapparmor1",
        "libpcre2-8-0",
        "libncurses6",  #cli
        "libtinfo6",  #cli
        "libedit2",  #cli
        "libbsd0",
        "libargon2-1",  #argon
        "libcurl4",  #curl
        "libffi7",  #curl
        "libnghttp2-14",  #curl
        "libidn2-0",  #curl
        "libpsl5",  #curl
        "libldap-2.4-2",  #curl
        "librtmp1",  #curl
        "libssh2-1",  #curl
        "libk5crypto3",  #curl
        "libkrb5-3",  #curl
        "libunistring2",  #curl
        "libgssapi-krb5-2",  #curl
        "libkeyutils1",  #curl
        "libkrb5support0",  #curl
        "libgnutls30",  #curl
        "libgmp10",  #curl
        "libhogweed6",  #curl
        "libnettle8",  #curl
        "libp11-kit0",  #curl
        "libtasn1-6",  #curl
        "libsasl2-2",  #curl
        "libbrotli1",  #curl
        "libdeflate0",  #curl
        "libmd0",  #curl
        "libcom-err2",
        "libonig5",  #mbstring
        "libsodium23",  #sodium
        "libsqlite3-0",  #sqlite
        "libssl1.1",  #ssl
        "libxml2",  #xml
        "liblzma5",  #xml
        "libxslt1.1",  #xml
        "zlib1g",  #zlib
        "libzip4",  #zip
        "libbz2-1.0",  #zip
        "libmcrypt4",  #mcrypt
        "libgd3",  #gd
        "libfontconfig1",  #gd
        "libfreetype6",  #gd
        "libjpeg62-turbo",  #gd
        "libpng16-16",  #gd
        "libtiff5",  #gd
        "libwebp6",  #gd
        "libxpm4",  #gd
        "libexpat1",  #gd
        "libuuid1",  #gd
        "libx11-6",  #gd
        "libxcb1",  #gd
        "libx11-data",  #gd
        "libzstd1",  #gd
        "libjbig0",  #gd
        "libxau6",  #gd
        "libxdmcp6",  #gd
        "libicu67",  #intl
        "ucf",
    ]
    debs = []
    for lib in libs:
        debs.append(deb_file(arch, distro, lib))

    return debs
