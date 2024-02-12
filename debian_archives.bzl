# AUTO GENERATED
load("@distroless//private/remote:debian_archive.bzl", "debian_archive")

def repositories():
    debian_archive(
        name = "amd64_debian11_base-files",
        package_name = "base-files",
        sha256 = "1ff08cf6e1b97af1e37cda830f3658f9af43a906abb80a21951c81aea02ce230",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_11.1+deb11u9_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_dash",
        package_name = "dash",
        sha256 = "0a4cc532fbf2c78cb4090a659fb73560981e626849532e6186f3a3ac6a45b3bc",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "65ca7d8b03e9dac09c5d544a89dd52d1aeb74f6a19583d32e4ff5f0c77624c24",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libbz2-1.0",
        package_name = "libbz2-1.0",
        sha256 = "16e27c3ebd97981e70db3733f899963362748f178a62644df69d1f247e741379",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "2f36e55d145d94286655cc6e5bc7665c730d81ee1ffdaf0772104875a3100e85",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u8_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libc6",
        package_name = "libc6",
        sha256 = "d55d9c9769336f9b8516c20bd8364ce90746fb860ae3dda242f421e711af3d1a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.31-13+deb11u8_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libcom-err2",
        package_name = "libcom-err2",
        sha256 = "d478f132871f4ab8352d39becf936d0ad74db905398bf98465d8fe3da6fb1126",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "f617952df0c57b4ee039448e3941bccd3f97bfff71e9b0f87ca6dae15cb3f5ef",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libdb5.3",
        package_name = "libdb5.3",
        sha256 = "00b9e63e287f45300d4a4f59b6b88e25918443c932ae3e5845d5761ae193c530",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.8_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libexpat1",
        package_name = "libexpat1",
        sha256 = "5744040c4735bcdd51238aebfa3e402b857244897f1007f61154982ebe5abbd7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libffi7",
        package_name = "libffi7",
        sha256 = "30ca89bfddae5fa6e0a2a044f22b6e50cd17c4bc6bc850c579819aeab7101f0f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libf/libffi/libffi7_3.3-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "b92861827627a76e74d6f447a5577d039ef2f95da18af1f29aa98fb96baea4c1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "b21cfdd12adf6cac4af320c2485fb62a8a5edc6f9768bc2288fd686f4fa6dfdf",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "e478f2709d8474165bb664de42e16950c391f30eaa55bc9b3573281d83a29daf",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "6e9824576a1f8a9c4b9f7ab08a57ec35992383764e4db02c30ce7db491ad74e9",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "4530c95aefa48e33fd8cf4acbe5c4b559dbe7bdf4c56469986c83a203982cef1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "31113b9e20c89d3b923da0540d6f30535b8d14f32e5904de89e34537fa87d59a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libgssapi-krb5-2",
        package_name = "libgssapi-krb5-2",
        sha256 = "037cc4bb34a6cd0d7a6e83bdcae6d68e0d0f9218eb7dedafc8099c8c0be491a2",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "c76825341b5877240ff2511a376844a50ffda19d9d019ae65a5b3a97f9a1a183",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "28de780a1605cf501c3a4ebf3e588f5110e814b208548748ab064100c32202ea",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libk5crypto3",
        package_name = "libk5crypto3",
        sha256 = "f635062bcbfe2eef5a83fcba7d1a8ae343fc7c779cae88b11cae90fd6845a744",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libkeyutils1",
        package_name = "libkeyutils1",
        sha256 = "f01060b434d8cad3c58d5811d2082389f11b3db8152657d6c22c1d298953f2a5",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libkrb5-3",
        package_name = "libkrb5-3",
        sha256 = "b785fa324cf27e6bf7f97fc0279470e6ce8a8cc54f8ccc6c9b24c8111ba5c952",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libkrb5support0",
        package_name = "libkrb5support0",
        sha256 = "da8d022e3dd7f4a72ea32e328b3ac382dbe6bdb91606c5738fe17a29f8ea8080",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "0608ecb6ed258814e390b52b3fb50f2a6d3239b5ecb1086292ae08be00a67b0f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_liblzma5",
        package_name = "liblzma5",
        sha256 = "1c79a02415ca5ee7234ac60502fb33ee94fa70b02d1c329a6a14178f8329c435",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/x/xz-utils/liblzma5_5.2.5-2.1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libmpdec3",
        package_name = "libmpdec3",
        sha256 = "816404866f754d5662d69db50072018dccb78cf372fc38e0be961fab0f57d741",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libncursesw6",
        package_name = "libncursesw6",
        sha256 = "70ed9c6f35a9de73a01b042d740d92c46bbc0392ca4e63ee984417bd8a4eca3a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2+deb11u2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libnsl2",
        package_name = "libnsl2",
        sha256 = "c0d83437fdb016cb289436f49f28a36be44b3e8f1f2498c7e3a095f709c0d6f8",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libpcre3",
        package_name = "libpcre3",
        sha256 = "48efcf2348967c211cd9408539edf7ec3fa9d800b33041f6511ccaecc1ffa9d0",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/pcre3/libpcre3_8.39-13_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "7d5336af395d1f658d0e66d74d0e1f4c632028750e7e04314d1a650e0317f3d6",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libpython3.9-minimal",
        package_name = "libpython3.9-minimal",
        sha256 = "594283526d67e03e3c4e96534f6bfe5da1bf41da5d49360553c9b79fbf08c4ab",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libpython3.9-stdlib",
        package_name = "libpython3.9-stdlib",
        sha256 = "32ac64d959ac2dbc5bb289532fc9834dab8f671b5455695a3a9315aad973c65b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libreadline8",
        package_name = "libreadline8",
        sha256 = "162ba9fdcde81b5502953ed4d84b24e8ad4e380bbd02990ab1a0e3edffca3c22",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/r/readline/libreadline8_8.1-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libsqlite3-0",
        package_name = "libsqlite3-0",
        sha256 = "a0b8d3acf4a0483048637637d269be93af48d5c16f6f139f53edd13384ad4686",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "aadf8b4b197335645b230c2839b4517aa444fd2e8f434e5438c48a18857988f7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "5c155c58935870bf3b4bfe769116841c0d286a74f59eccfd5645693ac23f06b1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libtinfo6",
        package_name = "libtinfo6",
        sha256 = "96ed58b8fd656521e08549c763cd18da6cff1b7801a3a22f29678701a95d7e7b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/ncurses/libtinfo6_6.2+20201114-2+deb11u2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libtirpc3",
        package_name = "libtirpc3",
        sha256 = "86b216d59b6efcd07d56d14b8f4281d5c47f24e9c962f46bbaf02fce762c5e6a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libt/libtirpc/libtirpc3_1.3.1-1+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libuuid1",
        package_name = "libuuid1",
        sha256 = "31250af4dd3b7d1519326a9a6764d1466a93d8f498cf6545058761ebc38b2823",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openjdk-11-jdk-headless",
        package_name = "openjdk-11-jdk-headless",
        sha256 = "9708ebf4307d7a3c4677e7182ee8fb59bb9796c503eb07e6ec0af40f43e23e53",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.22+7-1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openjdk-11-jre-headless",
        package_name = "openjdk-11-jre-headless",
        sha256 = "308b32f6b2ac42ad61b3e4e3ee785f3da1d87013225c5d27cdf11a79cd50e3cd",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-11/openjdk-11-jre-headless_11.0.22+7-1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "c58c25996f99f95fcf22f501fa30dd987844fa58767f969ca2e6d1dfe18965d7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.10+7-1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "0f4534089b8bd30893b822d79a6513041b9f52446442a2dc66339bcd713ac9b1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.10+7-1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openssl",
        package_name = "openssl",
        sha256 = "04873d74cbe86bad3a9901f6e57f1150040eba9891b443c5c975a72a97238e35",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_1.1.1w-0+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_python3-distutils",
        package_name = "python3-distutils",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_python3.9-minimal",
        package_name = "python3.9-minimal",
        sha256 = "5d6003c5c20223a2547ac4976e09a9ec778dbe351507a6292bef3b60df5f4aa7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "13befffb7ee127f569af92d736e30c86c199bbd58f9c3cca0d071ed63e04d003",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb11u1_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_zlib1g",
        package_name = "zlib1g",
        sha256 = "03d2ab2174af76df6f517b854b77460fbdafc3dac0dca979317da67538159a3e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_base-files",
        package_name = "base-files",
        sha256 = "6c11268757a89f45c22d7a7a9e1153f1545016987531bf3068765a221e0af86c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_12.4+deb12u5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_dash",
        package_name = "dash",
        sha256 = "33ea40061da2f1a861ec46212b2b6a34f0776a049b1a3f0abce2fb8cb994258f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/d/dash/dash_0.5.12-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "281c66e46b95f045a0282a6c7a03b33de0e9a08d016897a759aaf4a04adfddbe",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/fontconfig-config_2.14.1-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "8892669e51aab4dc56682c8e39d8ddb7d70fad83c369344e1e240bf3ca22bb76",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-6_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "563b4caec1aa5e876bd3355b36e7a38e1484baf5a293b48d1e8bd22db786e4d7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libbz2-1.0",
        package_name = "libbz2-1.0",
        sha256 = "54149da3f44b22d523b26b692033b84503d822cc5122fed606ea69cc83ca5aeb",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-5+b1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "7ea6cea2555dfd0a9743387bc27932de15178ae1c2448ccb6100271089f0e2fd",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libc6",
        package_name = "libc6",
        sha256 = "0a84833f2f0e6b41e97d8e89917252af83630603e878b8f1202fd9f4ff96cd9f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.36-9+deb12u4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libcom-err2",
        package_name = "libcom-err2",
        sha256 = "8010e4285276bb344c05ae780deae2fffb45e237116c3a78481365c5954125ec",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "f5f60a5cdfd4e4eaa9438ade5078a57741a7a78d659fcb0c701204f523e8bd29",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libdb5.3",
        package_name = "libdb5.3",
        sha256 = "7dc5127b8dd0da80e992ba594954c005ae4359d839a24eb65d0d8129b5235c84",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg2-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libexpat1",
        package_name = "libexpat1",
        sha256 = "fe36a7f35361fc40d0057ef447a7302fd41d51740d51c98fb3870bbed5b96e56",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/expat/libexpat1_2.5.0-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libffi8",
        package_name = "libffi8",
        sha256 = "6d9f6c25c30efccce6d4bceaa48ea86c329a3432abb360a141f76ac223a4c34a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libf/libffi/libffi8_3.4.4-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "16ee38d374e064f534116dc442b086ef26f9831f1c0af7e5fb4fe4512e700649",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/libfontconfig1_2.14.1-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "72ef03236f1936e72a0faf86a547425b0eff3c5fd0b43f8669012182cf376354",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/freetype/libfreetype6_2.12.1+dfsg-5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "f3d1d48c0599aea85b7f2077a01d285badc42998c1a1e7473935d5cf995c8141",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "7e90ba4670377ae29f1a718798b4d5e088ac97d2dfa20a13b4b2ea357b61ec29",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "1dbc499d2055cb128fa4ed678a7adbcced3d882b3509e26d5aa3742a4b9e5b2f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "31113b9e20c89d3b923da0540d6f30535b8d14f32e5904de89e34537fa87d59a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libgssapi-krb5-2",
        package_name = "libgssapi-krb5-2",
        sha256 = "6631304ce4b5b9ba0af3fdebf088a734aed2d28ffad2a03ba79e4fcb2e226dd6",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "bfce132b7ee67b9c2d2166075b1936a25c8cc6866b6a049f99b8e94baa916e71",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/h/harfbuzz/libharfbuzz0b_6.0.0+dfsg-3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "95ec30140789a342add8f8371ed018924de51b539056522b66f207b25cba9cad",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libk5crypto3",
        package_name = "libk5crypto3",
        sha256 = "6a91eee690e6ad2207df3a355fc329a58d8e31bf5ca9a9dd4de8f7a1c812ddc5",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libkeyutils1",
        package_name = "libkeyutils1",
        sha256 = "cfac89e6a7a54ff3c6a4f843310e25efeddaa771baeae470bd98bd588c373563",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/keyutils/libkeyutils1_1.6.3-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libkrb5-3",
        package_name = "libkrb5-3",
        sha256 = "03ebdf235600f4a8a6d4fbc7080de0a776b1a701f43c4e9697944757591d7809",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libkrb5support0",
        package_name = "libkrb5support0",
        sha256 = "e489a9282c4b765c29d9eda7c4747e1cb58be71161012c3a57e2a8bc63dc0f5a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "8b417407302ca99e5d5f70bacece70bda54f8cd0bb6d59b478b6411c27c1366a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/l/lcms2/liblcms2-2_2.14-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_liblzma5",
        package_name = "liblzma5",
        sha256 = "d4b7736e58512a2b047f9cb91b71db5a3cf9d3451192fc6da044c77bf51fe869",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/x/xz-utils/liblzma5_5.4.1-0.2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libncursesw6",
        package_name = "libncursesw6",
        sha256 = "98fa7a53dc565a38b65fb70422ad08001bf5361d8fbc74255280c329996a6bec",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/ncurses/libncursesw6_6.4-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libnsl2",
        package_name = "libnsl2",
        sha256 = "c0d83437fdb016cb289436f49f28a36be44b3e8f1f2498c7e3a095f709c0d6f8",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libpcre2-8-0",
        package_name = "libpcre2-8-0",
        sha256 = "030db54f4d76cdfe2bf0e8eb5f9efea0233ab3c7aa942d672c7b63b52dbaf935",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/pcre2/libpcre2-8-0_10.42-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "dc32727dca9a87ba317da7989572011669f568d10159b9d8675ed7aedd26d686",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libp/libpng1.6/libpng16-16_1.6.39-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libpython3.11-minimal",
        package_name = "libpython3.11-minimal",
        sha256 = "6fc5ab5858781ab90c68b4deea09f21871fd7b55dc1a0764ad7116ac4c86574d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.11/libpython3.11-minimal_3.11.2-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libpython3.11-stdlib",
        package_name = "libpython3.11-stdlib",
        sha256 = "67eec0eb4df58b93e1bf97c402c2cbeb361bf9c5af44fa3a02ff1c723c791ca2",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.11/libpython3.11-stdlib_3.11.2-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libreadline8",
        package_name = "libreadline8",
        sha256 = "e02ebbd3701cf468dbf98d6d917fbe0325e881f07fe8b316150c8d2a64486e66",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/r/readline/libreadline8_8.2-1.3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libsqlite3-0",
        package_name = "libsqlite3-0",
        sha256 = "a8b11a1664a998cc2499fb04327d1f6c4e8f77b78ea8b6f8418d96fc54e3731f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/s/sqlite3/libsqlite3-0_3.40.1-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "6e129c5814812b3516a656ae5b664b9970e2f8823250cd5b98190f21c0de2bca",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl3_3.0.11-1~deb12u2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "9b1b269020cec6aced3b39f096f7b67edd1f0d4ab24f412cb6506d0800e19cbf",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libtinfo6",
        package_name = "libtinfo6",
        sha256 = "072d908f38f51090ca28ca5afa3b46b2957dc61fe35094c0b851426859a49a51",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/ncurses/libtinfo6_6.4-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libtirpc3",
        package_name = "libtirpc3",
        sha256 = "2a46d5a5e9486da11ffeff5740931740d6deae4f92cd6098df060dc5dff1e1c7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libuuid1",
        package_name = "libuuid1",
        sha256 = "c2b3ccade855de14c6ece893a0d2bec63b0a007cbc2970af8152cf06699ccd2a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/u/util-linux/libuuid1_2.38.1-5+b1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "257b1c7df31c61c3c907ef42d2bc2cb1be23f9cc27e5bf59b07e5f695650a851",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.10+7-1~deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "e0c7cffdc06f54ee3be0005ec5b3a4c1b42514a9b408881c244171f18c615d0b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.10+7-1~deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_openssl",
        package_name = "openssl",
        sha256 = "ea063646d4f70d15be5ed52b67b5ac95d68dda823c60d808c7c25439c6d14e4d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_3.0.11-1~deb12u2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_python3-distutils",
        package_name = "python3-distutils",
        sha256 = "a620b555f301860a08e30534c7e6f7d79818e5e1977bfec39a612e7003074318",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.11.2-3_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_python3.11-minimal",
        package_name = "python3.11-minimal",
        sha256 = "a72247ba64bcd1d0ace2ea8eefd7bcfaca84204def9495269526c25dd9fddc0c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.11/python3.11-minimal_3.11.2-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "0ca0baec1fca55df56039047a631fc1541c5a44c1c4879d553aaa3a70844eb12",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb12u1_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_zlib1g",
        package_name = "zlib1g",
        sha256 = "d7dd1d1411fedf27f5e27650a6eff20ef294077b568f4c8c5e51466dc7c08ce4",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/z/zlib/zlib1g_1.2.13.dfsg-1_amd64.deb"],
    )
    debian_archive(
        name = "arm_debian11_base-files",
        package_name = "base-files",
        sha256 = "1fd89e64ee334b51e15ef7b6f97347346ea3bba17a2e484765f7849d785ef885",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_11.1+deb11u9_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "arm_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "fb31e92e4fc51d0ab23055013d6ab75bd9888703552cab5db88cbd7c88d3a6d7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u8_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libc6",
        package_name = "libc6",
        sha256 = "af087837756e1d1bca50010e6a62d7df7c1148334553eb86a3feacc68e3a3404",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.31-13+deb11u8_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "4cfff89c7f492090c5988298f9f9419d3464d294c43883800a2ed55676581d26",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "c046673580eef1ef3b2778c37c8baccbb5510195e8008f789b8309b38345abc0",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "42130c140f972d938d4b4a5ab9638675e6d1223fcff3042bbcc1829e3646eb00",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "879258df2ac36d9733df014c5a5443944e1a5c4ba9a7eebe5dd28547b4ebb541",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "arm_debian11_openssl",
        package_name = "openssl",
        sha256 = "4cad3a65f247788956d32d5b12da16b1779fd6eec455aa52d953c9251c6ab949",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_1.1.1w-0+deb11u1_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "13befffb7ee127f569af92d736e30c86c199bbd58f9c3cca0d071ed63e04d003",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb11u1_all.deb"],
    )
    debian_archive(
        name = "arm_debian12_base-files",
        package_name = "base-files",
        sha256 = "b55ea04d6a70edb08fddb419655e692a5592fb19cd148cd83966a7e303e6346f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_12.4+deb12u5_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "arm_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "8f6abc1663ebb95c99d57c9ba87e4206c02f320765951772a721d45423ac9282",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u4_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libc6",
        package_name = "libc6",
        sha256 = "4b0d2bd6ae4960dc4691f46f5f3476a9209febb4907a61ad308f32b0aaadf937",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.36-9+deb12u4_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "6eee90afd6976f6a4f34e288fc98a57f72fbffac442ab28d860630d85a15e5d7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "59135191d9054cfa01e6f005a27e2e3dbe571ee3b4e4d76e4283a723c894ecae",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "e22f668aaa42fe6e14ecfbf7ab0ff152ef610956ee60ddf28800a994f7c26a7d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl3_3.0.11-1~deb12u2_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "50729c9e7c78ad33529dff20f55d6eb3299055079016973ef068ca2c5eb08eff",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "arm_debian12_openssl",
        package_name = "openssl",
        sha256 = "fa601d4b63af41d80e80e4f1bee2c776f24f9160ee542b27113da7379e036009",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_3.0.11-1~deb12u2_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "0ca0baec1fca55df56039047a631fc1541c5a44c1c4879d553aaa3a70844eb12",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb12u1_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_base-files",
        package_name = "base-files",
        sha256 = "c40dc4d5c6b82f5cfe75efa1a12bd09b9d5b9b8446ea045a991896a1ead8b02c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_11.1+deb11u9_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_dash",
        package_name = "dash",
        sha256 = "542980a48d96c1124a9664cae06dbb8b813417daa1de1b6ed4cb49e0766da932",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "52ca7f90de6cb6576a0a5cf5712fc4ae7344b79c44b8a1548087fd5d92bf1f64",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libbz2-1.0",
        package_name = "libbz2-1.0",
        sha256 = "da340e8470e96445c56966f74e48a9a91dee0fa5c89876e88a4575cc17d17a97",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "1592a58f6ed88ccb7bd5718d68041cda40ee66be6e7fb28218203476363ffa4d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u8_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libc6",
        package_name = "libc6",
        sha256 = "6eb629090615ebda5dcac2365a7358c035add00b89c2724c2e9e13ccd5bd9f7c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.31-13+deb11u8_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libcom-err2",
        package_name = "libcom-err2",
        sha256 = "fc95d415c35f5b687871f660a5bf66963fd117daa490110499119411e2d6145e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "22b586b29e840dabebf0bf227d233376628b87954915d064bc142ae85d1b7979",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libdb5.3",
        package_name = "libdb5.3",
        sha256 = "cf9aa3eae9cfc4c84f93e32f3d11e2707146e4d9707712909e3c61530b50353e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.8_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libexpat1",
        package_name = "libexpat1",
        sha256 = "8d20bfd061845bda0321d01accd6f8386ead5b1d7250a585d12b8d5fb1408ffa",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libffi7",
        package_name = "libffi7",
        sha256 = "eb748e33ae4ed46f5a4c14b7a2a09792569f2029ede319d0979c373829ba1532",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libf/libffi/libffi7_3.3-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "18b13ef8a46e9d79ba6a6ba2db0c86e42583277b5d47f6942f3223e349c22641",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "b25f1c148498dd2b49dc30da0a2b2537a7bd0cb34afb8ea681dd145053c9a3f8",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "e2fcdb378d3c1ad1bcb64d4fb6b37aab44011152beca12a4944f435a2582df1f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "85f2a5833f8e7fb77c3bc71380ed3317d188177517cbbe32d46ab473913adc85",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "813af2e0b8ba0a7cea18c988cd843412ef6d0415700fc860d62816750e741670",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "473362a74ba74ae630fc43675460fb5a1058564a635a301875e00f1c6f9b27cb",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libgssapi-krb5-2",
        package_name = "libgssapi-krb5-2",
        sha256 = "5572a462c7f78f9610bd4f1dd9f8e4f8243fa9dc2d1deb5b1cf7cec1f1df83dc",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "d9f0345391cc661503d1508ccd318b3db48add354e706cf9d66fa16bf99e2d03",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "8903394de23dc6ead5abfc80972c8fd44300c9903ad4589d0df926e71977d881",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libk5crypto3",
        package_name = "libk5crypto3",
        sha256 = "d8f31a8bd83fe2593e83a930fc2713e1213f25311a629836dfcde5bd23a85e83",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libkeyutils1",
        package_name = "libkeyutils1",
        sha256 = "7101c2380ab47a3627a6fa076a149ab71078263064f936fccbd43efbaed4a2da",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libkrb5-3",
        package_name = "libkrb5-3",
        sha256 = "3dcdadb1db461d14b6051a19c6a94ae9f61c3d2b1d35fd9d63326cd8f4ae49e5",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libkrb5support0",
        package_name = "libkrb5support0",
        sha256 = "d44585771e26c9b8d115aad33736fcc3e03cf98238ea7c7985554f166441aa07",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "6d92ee1f0d427b88ab9bff32c769b61e2597c8fb289589ca0731a7e77d490d6e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_liblzma5",
        package_name = "liblzma5",
        sha256 = "d865bba41952c707b3fa3ae8cab4d4bd337ee92991d2aead66c925bf7cc48846",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/x/xz-utils/liblzma5_5.2.5-2.1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libmpdec3",
        package_name = "libmpdec3",
        sha256 = "171e2581970f36a39f65d1ca3c761e76b103844daae7903fcc07f7c3822a05bb",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libncursesw6",
        package_name = "libncursesw6",
        sha256 = "26bd6f488b885d02dfe933038d1e15414f5fe98704b3f49d2cecf665ebcb0f5b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2+deb11u2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libnsl2",
        package_name = "libnsl2",
        sha256 = "8f9ba58b219779b43c4ccc78c79b0a23f721fc96323c202abb31e02f942104b3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libpcre3",
        package_name = "libpcre3",
        sha256 = "21cac4064a41dbc354295c437f37bf623f9004513a97a6fa030248566aa986e9",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/pcre3/libpcre3_8.39-13_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "f5f61274aa5f71b9e44b077bd7b9fa9cd5ff71d8b8295f47dc1b2d45378aa73e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libpython3.9-minimal",
        package_name = "libpython3.9-minimal",
        sha256 = "b49736ab0e8b8577f97a474ca67e20c1c025f9d7394ec8d7820de6314c903cf9",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libpython3.9-stdlib",
        package_name = "libpython3.9-stdlib",
        sha256 = "3b3612dcd7550f01ec3517fbe955838223f4cf115b6983e4ed6d7320cd4b05c4",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libreadline8",
        package_name = "libreadline8",
        sha256 = "500c3cdc00dcaea2c4ed736e00bfcb6cb43c3415e808566c5dfa266dbfc0c5e5",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/r/readline/libreadline8_8.1-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libsqlite3-0",
        package_name = "libsqlite3-0",
        sha256 = "1e33cd39dc4fff2a7edd7bb7e90a71e20fb528f6a581fe0287652e4dae77e0d0",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "fe7a7d313c87e46e62e614a07137e4a476a79fc9e5aab7b23e8235211280fee3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "7869aa540cc46e9f3d4267d5bde2af0e5b429a820c1d6f1a4cfccfe788c31890",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libtinfo6",
        package_name = "libtinfo6",
        sha256 = "58027c991756930a2abb2f87a829393d3fdbfb76f4eca9795ef38ea2b0510e27",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/ncurses/libtinfo6_6.2+20201114-2+deb11u2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libtirpc3",
        package_name = "libtirpc3",
        sha256 = "ccff0927f55b97fe9ea13057fab8bff9920bf4628eb2d5d48b9656f2fb74d2e1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libt/libtirpc/libtirpc3_1.3.1-1+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libuuid1",
        package_name = "libuuid1",
        sha256 = "3d677da6a22e9cac519fed5a2ed5b20a4217f51ca420fce57434b5e813c26e03",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openjdk-11-jdk-headless",
        package_name = "openjdk-11-jdk-headless",
        sha256 = "61709eba26839d7aa2a137fa8c564699748eab7c11b947f67ea2612fe72a7d43",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.22+7-1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openjdk-11-jre-headless",
        package_name = "openjdk-11-jre-headless",
        sha256 = "6a512aa506426d00865c970e40ec4212059a9640cd9d5cdabb1f0110e248ad44",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-11/openjdk-11-jre-headless_11.0.22+7-1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "0ab4f07c665367c0e94176db27dbfc5c54ace2780e71cc4a9f834ab896df58d8",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.10+7-1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "4f7794b3050717cb74d33debd1691abf76908622c0fb7d44d15996dd06ae421c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.10+7-1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openssl",
        package_name = "openssl",
        sha256 = "d9159af073e95641e7eda440fa1d7623873b8c0034c9826a353f890bed107f3c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_1.1.1w-0+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_python3-distutils",
        package_name = "python3-distutils",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_python3.9-minimal",
        package_name = "python3.9-minimal",
        sha256 = "bc0d0ed39ebc066020c3a16afdab4fd3e0260b41ae799273531d5b2403ae7b27",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "13befffb7ee127f569af92d736e30c86c199bbd58f9c3cca0d071ed63e04d003",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb11u1_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_zlib1g",
        package_name = "zlib1g",
        sha256 = "e3963985d1a020d67ffd4180e6f9c4b5c600b515f0c9d8fda513d7a0e48e63a1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_base-files",
        package_name = "base-files",
        sha256 = "ca5e69b38214de267d7d59bf4d0c1abd10987abacb5c9bfaf72b178bee883d1b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_12.4+deb12u5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_dash",
        package_name = "dash",
        sha256 = "c1358e2a8054eb93efd460adf480224a16ea9e0b4d7b4c6cbcf8c8c91902a1d7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/d/dash/dash_0.5.12-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "297b5a63f9214ffebe08892cdf2effdaf2b408e719811d5e8e98870f710cd35c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/fontconfig-config_2.14.1-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "8892669e51aab4dc56682c8e39d8ddb7d70fad83c369344e1e240bf3ca22bb76",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-6_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "3137de7f71952e710ee9f0df05026b3c6f463be9369a502d57c7696732f1ed22",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libbz2-1.0",
        package_name = "libbz2-1.0",
        sha256 = "d3a96ece03326498b39ff093a76800dfcbcb1d4049d6ae6e9f6fa1aa7a590ad6",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-5+b1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "272261c3864b65b6b69a001d7a8c1f7f82b93de7c3ec0538833a12984816e828",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libc6",
        package_name = "libc6",
        sha256 = "71302ee1bf4374aa4df7bcb5f58155e56a03c282f4076cdd07cf5bdfbca21fab",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.36-9+deb12u4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libcom-err2",
        package_name = "libcom-err2",
        sha256 = "0bd07f2a030f9e0346a80bbdf211fe3a55835dda70ed0e9d9da23f0e24cf4e99",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/e2fsprogs/libcom-err2_1.47.0-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "eea0ad76ea5eb507127fea0c291622ea4ecdbb71c4b9a8ed9c76ae33fc1a0127",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libdb5.3",
        package_name = "libdb5.3",
        sha256 = "344367608d622298a3d916f4cee3dc3173286f3b21f8f497ab21e7178ba930f9",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg2-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libexpat1",
        package_name = "libexpat1",
        sha256 = "39de7d17cb312d76f586866a38d7649102178a2cdb7f4cef1b4f279ea3cebf07",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/expat/libexpat1_2.5.0-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libffi8",
        package_name = "libffi8",
        sha256 = "80b5c36177dc0e29d531c7eddbed3cc7355cb490e49f8cfa5959572d161f27b3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libf/libffi/libffi8_3.4.4-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "4836d9deca824883f0de33d4f8f3718ba776c6e7c80cd7c418b5a0f86c009b9e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/libfontconfig1_2.14.1-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "051561d8901fd5e2c38a4903ce734df28450e41601b6c5d6ce0fdee7ea0f7973",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/freetype/libfreetype6_2.12.1+dfsg-5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "6fce2268d8f3152a4e84634f5a24133d3c62903b2f9b11b9c59235cbbc1b23a8",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "203b248ce95efd67b89586849a027e8691aaf3ad1df5fb263fff949fa4ba2af4",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "a2fd2803bf03384ac90a54f1179a29f2fb3c192f3ff483a3dd8ec6c3351ce5d0",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "473362a74ba74ae630fc43675460fb5a1058564a635a301875e00f1c6f9b27cb",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libgssapi-krb5-2",
        package_name = "libgssapi-krb5-2",
        sha256 = "94bf0e0fd3c51bd3b082cd360facf1e1db39d825fe93b581d673283edb64c1d4",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libgssapi-krb5-2_1.20.1-2+deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "64b1d4aa672dc4eda5e11b9ff8061122060fc7aba6ad16908c89a269ffa174ee",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/h/harfbuzz/libharfbuzz0b_6.0.0+dfsg-3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "de66f186f3ff3c1d10c2e75ae056b019b3f7f091f51096a06cade48b2dea875b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libk5crypto3",
        package_name = "libk5crypto3",
        sha256 = "750635caa352c1d1fee6189fd14956568105893ab287ef056729dc746bf36180",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libk5crypto3_1.20.1-2+deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libkeyutils1",
        package_name = "libkeyutils1",
        sha256 = "aac46cb6faec4e737502b3c2290b7b02f8ba04e8accd5af7fd07934df0c867b1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/keyutils/libkeyutils1_1.6.3-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libkrb5-3",
        package_name = "libkrb5-3",
        sha256 = "7f7a23e637eb7b4cfa1edd9a4cc07c61e6b3b440d74ffdc402e84eef5a7681ff",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libkrb5-3_1.20.1-2+deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libkrb5support0",
        package_name = "libkrb5support0",
        sha256 = "aa26a06447e38931ebd4c0a7ce2420b138c63558f4c6b5c736dda573b9deba30",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/k/krb5/libkrb5support0_1.20.1-2+deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "1e48b6846b0e7cdce7675da6b0f8bc5fef3f5170fd2470d17d65dc3d8c009720",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/l/lcms2/liblcms2-2_2.14-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_liblzma5",
        package_name = "liblzma5",
        sha256 = "48216df0ab15bf757176417c154c27a208b82aa42b00a16794e4699ec9e8e2e3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/x/xz-utils/liblzma5_5.4.1-0.2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libncursesw6",
        package_name = "libncursesw6",
        sha256 = "cf32cb6751718872c6def448b82211eec494f688e2f1a3e6c71bfdaf6b0722c5",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/ncurses/libncursesw6_6.4-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libnsl2",
        package_name = "libnsl2",
        sha256 = "8f9ba58b219779b43c4ccc78c79b0a23f721fc96323c202abb31e02f942104b3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libpcre2-8-0",
        package_name = "libpcre2-8-0",
        sha256 = "b2448d0a8a3db7fbeac231e7ef93811346c1fb5f96ccf6f631701d8a4eb39206",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/pcre2/libpcre2-8-0_10.42-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "ae87c6251a03fbe466228a058fcbaa5b6a44f156166c1ba5118024ac4bf65b75",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libp/libpng1.6/libpng16-16_1.6.39-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libpython3.11-minimal",
        package_name = "libpython3.11-minimal",
        sha256 = "399271d141a1e08479c80f7832921ddf5fdb46c15c8b0dd3172c52c74b79b197",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.11/libpython3.11-minimal_3.11.2-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libpython3.11-stdlib",
        package_name = "libpython3.11-stdlib",
        sha256 = "1af0700762fc1ca17000e124a456e50f6a769808ea1a6a0d0e941ec87647fb3a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.11/libpython3.11-stdlib_3.11.2-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libreadline8",
        package_name = "libreadline8",
        sha256 = "f3b162b7c1e05430607e792ebdbfc417cbd1f1d32cf83664133ae63d811a72d2",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/r/readline/libreadline8_8.2-1.3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libsqlite3-0",
        package_name = "libsqlite3-0",
        sha256 = "87e891926ba874c9f5fbd3b48d564cf103dd97db78f2d83fd1175826771dacfd",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/s/sqlite3/libsqlite3-0_3.40.1-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "4e05dfa7319f72c5598f29a39eaf568203e2ae2314d5ef434dbf764de6448462",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl3_3.0.11-1~deb12u2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "21e971c5d3506f783b89efe8e12ac85081ddd9213e4f6529262bcfe95c326670",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libtinfo6",
        package_name = "libtinfo6",
        sha256 = "baef0f6776f84c7eed4f1146d6e5774689567dad43216894d41da02e6608e4b3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/ncurses/libtinfo6_6.4-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libtirpc3",
        package_name = "libtirpc3",
        sha256 = "deaf9ea54f74cab6690b4bc0b427f05cbe62cc073580d84f5f18a8d9e2ece401",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libt/libtirpc/libtirpc3_1.3.3+ds-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libuuid1",
        package_name = "libuuid1",
        sha256 = "34d56dc6cbac8a0a4c0db78de67633548268c536b38198f67e6600a7775d3f88",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/u/util-linux/libuuid1_2.38.1-5+b1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "8f8adbab43233bbe6420ebd4c8b5becce739d4dcef5775a99b28604f24e0648c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.10+7-1~deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "6674cd6964a6fc8706eb5cec7ad31e4aae3b7f592a91c3b09e75aca318c37c70",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.10+7-1~deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_openssl",
        package_name = "openssl",
        sha256 = "ef8ec413c2bd866dbe7ab068cd45b28d22e6c586e3ab0bd8de127a3e8dfe650b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_3.0.11-1~deb12u2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_python3-distutils",
        package_name = "python3-distutils",
        sha256 = "a620b555f301860a08e30534c7e6f7d79818e5e1977bfec39a612e7003074318",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.11.2-3_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_python3.11-minimal",
        package_name = "python3.11-minimal",
        sha256 = "6e83406f07fb2f567aa12d57e51c24c40c42d7f144970ed9a05f0be25a1b1241",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/python3.11/python3.11-minimal_3.11.2-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "0ca0baec1fca55df56039047a631fc1541c5a44c1c4879d553aaa3a70844eb12",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb12u1_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_zlib1g",
        package_name = "zlib1g",
        sha256 = "52b8b8a145bbe1956bba82034f77022cbef0c3d0885c9e32d9817a7932fe1913",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/z/zlib/zlib1g_1.2.13.dfsg-1_arm64.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_base-files",
        package_name = "base-files",
        sha256 = "3a1aa4b4ec456070582847c580b1a515a392e52a2ba68d51b84a924cbc27b453",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_11.1+deb11u9_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "a7a7099df1c6ab6c3472731d88892e83f0077b2d3ec1414ff8f1c311a55a9f92",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "9cf55c4b75c589520bf5f84730ab68594bf86782826bc146026761b35ef74c4d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u8_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libc6",
        package_name = "libc6",
        sha256 = "f8436975e2b8292103bcdba797c63c375b8b4232ac5caa82edefd8b6744cff09",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.31-13+deb11u8_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "0087ad3e3d01968c3fb354f77b46966e4ca79246a08caca9257695095befcf05",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libexpat1",
        package_name = "libexpat1",
        sha256 = "cbf5268366667e541654f4b7290c2baa5329aee2f25b18bea520f69063fc9474",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "a4eed4b8c8cefe48e0567a0c098a7bf9fc6aab4093a9dd2e75fbdfa2d1ef7aa8",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "6ca7c822898cf4664023a614af17bb139647ff9fa6e56546f1504c5f1d6ca76f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "8b612f798430a6dd8b8b5e8f712b7ea92329201c6a438a9d176e9e285f1c14d5",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "0f566cac3f04b092c92f8e94a7b17617d74edb6e59c13ee476d28846d9a1f67b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1+deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "f4b1f093072bf65694a98432d108e5c62756c147f5e92e657021428dc602b9f4",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "6998cf0f9dd4c0d09ce0521e26ed967f596fc1e8b394edbc49fc0cd4a969a3d2",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "eceadc98a48d3950cd69be4648ef134b76a224415a6fad9193407860604d6a9b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "7c198ae4e27ddb57d53ee68bf2846b3dc88d33b9948d5f2903ee9e69312848b9",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "e4b32374b944aae5c4ab9e3742a68ad978faae9403c2685c5e44c7aa4d6e0123",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libpcre3",
        package_name = "libpcre3",
        sha256 = "c24f9bb2b39d2fb9750a52a9ba512754079062c92be5f51b204689117c11868a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/pcre3/libpcre3_8.39-13_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "ea4e1daaeab93a09f9fc943a852099c89d69da0c9606d0f4419ae0c5d4b5c10d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "a2f2744f068ba3c3edf7d77f53ea68f4215a727c83dee5ef869f159d2c0f199e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "cda71acea3aba81ccb555f7b2355a6a3944b0f09049945a351d8e7682058daa9",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libuuid1",
        package_name = "libuuid1",
        sha256 = "8c5a094cf457ffedcd3c401f8aef735a4e9a405cd07208ec6c8e57441f650bdf",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openjdk-11-jdk-headless",
        package_name = "openjdk-11-jdk-headless",
        sha256 = "0c73c426fb2c2cb8ce4407c8c4f57b46395b8b2856a791e588eb33adf412f22f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.22+7-1~deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openjdk-11-jre-headless",
        package_name = "openjdk-11-jre-headless",
        sha256 = "8dcc03aaf42e428a3770aae6f80b5c821216cdecc29ab2e74415e7bbba1dfd45",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-11/openjdk-11-jre-headless_11.0.22+7-1~deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "614cdc61f35611fff87145e684c072a012fc0d9d174dadcaf0c611eabc6ff143",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.10+7-1~deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "b1c23796f4344b6392c15b96fc35370df00e380e99d4e3eb9e70bcf6c51f1a40",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.10+7-1~deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openssl",
        package_name = "openssl",
        sha256 = "9c1fe0a214a8467e931b2004daf0d9147cbf532a5e009980e7aee22e59db0359",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_1.1.1w-0+deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "13befffb7ee127f569af92d736e30c86c199bbd58f9c3cca0d071ed63e04d003",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb11u1_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_zlib1g",
        package_name = "zlib1g",
        sha256 = "7724f4d01fd987e023cf55f1cfc964a495408f30c1dd1470b66f7a8d43a868da",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_base-files",
        package_name = "base-files",
        sha256 = "7a20f4811f21c89cbaef413f26a7d1e597f640a95ebb5d82212a71235a50ae43",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_12.4+deb12u5_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "7e9d4b15907cd56ba1fe1ab48c2f344621d506b54e1e3a1d444d276209eec9f3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/fontconfig-config_2.14.1-4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "8892669e51aab4dc56682c8e39d8ddb7d70fad83c369344e1e240bf3ca22bb76",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-6_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "b9449bc0f0acd7c3a861e20c8de0812a153e10a8df96e9fad9532056fb988798",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "8198e54e4a6a866a41f309eca1356cf876a9000991027e5b6b73758f7c54aeb0",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libc6",
        package_name = "libc6",
        sha256 = "3efe0f2aa568f87d55d551fcf402b266a4acd0e19ca29cd4d3e538c1aaf123bb",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.36-9+deb12u4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "c5825784746727b7f8338c4de6caaa0d5945737628420f9a7cd8f0fc582372e6",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libexpat1",
        package_name = "libexpat1",
        sha256 = "0f6ccb24691c53983d2b080d095a2b651ff6bf8eec509cff62372d7922af7e52",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/expat/libexpat1_2.5.0-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "b3b30e067d65ddf18540155bbb06ed60f9dde22d2e84009a3088b173a4e6027f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/libfontconfig1_2.14.1-4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "54ab0fc160bcc4c071b61919ef4a03934272bb81a449c9c05b2218f0c136014e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/freetype/libfreetype6_2.12.1+dfsg-5_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "1cdcfe462d116a33797ec9867519c0f1f4b7819b8914b6ec70faaaf8369d1e40",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "404961a9d8671804da0dc2e61579a9cc6a31a25bee9ab148802003867ba3795a",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "846fd545da0298a750d57f52ec59689d219c79d9693f15a1dfd6e141ff173e1e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "6998cf0f9dd4c0d09ce0521e26ed967f596fc1e8b394edbc49fc0cd4a969a3d2",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "f022385face7e537c51d69b7c4c159f90cbd0f2f04064ab7d442839f41e4df0c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/h/harfbuzz/libharfbuzz0b_6.0.0+dfsg-3_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "adae34f22d413f7e47d6b5dc82a21b85e5df70c0a0119ef8e39b2e8a5c6a0864",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "b4cd31cf86fa0ebcfd55effa35d3396c3500d44dcefee39d1e54263b7c6beabc",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/l/lcms2/liblcms2-2_2.14-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libpcre2-8-0",
        package_name = "libpcre2-8-0",
        sha256 = "13cfe079e615d5bba2b73bf856fcac7ffe8ad8ff94d5eaac7ba899f69fb2c748",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/pcre2/libpcre2-8-0_10.42-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "1589b8540bdd8f45380664be564350761bf78a913d2e490df498567da3204697",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libp/libpng1.6/libpng16-16_1.6.39-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "62fefa777c0c508c52630a9ba53c8492f2ee7dbc3f23eb58ad932b34795d2b70",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl3_3.0.11-1~deb12u2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "87e77916ddf0ac175e8fff101dfc93a3348187d87b0eba8089c6dc320e34ec20",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libuuid1",
        package_name = "libuuid1",
        sha256 = "cf896e205b6ac11337a70031bb0d69748d3c0a901504bd21ff8a8f54386f16af",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/u/util-linux/libuuid1_2.38.1-5+b1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "bed17f67078eeb71921d5e6fc6fe40b42de0208811201fe7ff01836dc56976f0",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.10+7-1~deb12u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "18e9c712de2827dbfc8f4079e19e9a873e5966e75df2dd9575dcb2dff39cd3c3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.10+7-1~deb12u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_openssl",
        package_name = "openssl",
        sha256 = "ef72ad09481309d5af359b29bbc6670d6bf1b30d68257e6573a7f9ffc8e5e035",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_3.0.11-1~deb12u2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "0ca0baec1fca55df56039047a631fc1541c5a44c1c4879d553aaa3a70844eb12",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb12u1_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_zlib1g",
        package_name = "zlib1g",
        sha256 = "4a512679756d8dadc91d37ecf353b868d526c007e8860b6618640812efbc51d1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/z/zlib/zlib1g_1.2.13.dfsg-1_ppc64el.deb"],
    )
    debian_archive(
        name = "s390x_debian11_base-files",
        package_name = "base-files",
        sha256 = "a92d049666d98a0ec0d52c2d550d2339d739579cc201294c69787d21c44ec5d1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_11.1+deb11u9_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "3f2ebe4c83833f374f3aad7f3b6aa9cf68ca3511544b97a185ab5c126790ac5f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "1a78f265e3c8e76e0df30c18b3d57fa6e47f184e50fdfdb6c619c501845ecaa9",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u8_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libc6",
        package_name = "libc6",
        sha256 = "af8ce661227814991ee9b06157e772ea46fa3b2e4e61b21f391b7afcd7e50504",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.31-13+deb11u8_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "dbab47c5dedde0c5dfc6f5c974e23bd4a48ebc48cb8a56e2cabded6fc52818b7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libexpat1",
        package_name = "libexpat1",
        sha256 = "f3358a35ea71f682052c56db8d6f26fa95326cf672301f80d07ee770b4aa8bb4",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "3890eb7a635164973f4205f75586a0a60a681328f730a9e0002af80e143cb036",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "8aecea8b8a908817f4367b451e83c5f8dbb7cc8372dfaa7df80c9898d03cf550",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "129b6403af3832426f470a30a3f01a71725eb38b7b7a93de4480f56ae5393e22",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "ca24f302d1957f9272015e0bbfbb241f99e6c615d55a54fd123f5903ae1b18fa",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1+deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "d836fcc5ba63095ed15efefee912c83902c7213f40b6aece73455c9348d5e462",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "5d11b4ffb8f9559b77b3b6981f3c59df5a446a075b2bcc0f6184c0d9ba8c4b1c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "a54b2558537d4758b51db666cba7e27c9dd83ad8b19f727a9eb2008576b2900c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "a75580859d0a161124bb1f3dd0ecb9f96786c18b5d39a02b57eb4cf7d7dd8653",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "0de7a9428b71b6abcaa0cccf2bb37aa6800d58baf5ca5fc063c4827703614853",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libpcre3",
        package_name = "libpcre3",
        sha256 = "ff08eb6d116b07affbed8cdd7c519caf2fc56beffef5dd7b6519eda670c1a7f7",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/pcre3/libpcre3_8.39-13_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "34b92145dcf4a532dab76086ec30a636a58d31c635e7c6f9d4cb47dfc4704512",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "b957b92959d956899608b21741b95cf50ed2098adf1e4f488ccf67e7cb158e68",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "d632c1fc45ab0ef8bc9c8cbbc9436dd82340bf0c1e44bd8b791662057ef05505",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libuuid1",
        package_name = "libuuid1",
        sha256 = "8df64efb47308f903f0b9835b697c84a2be133ffa9af0ac9d93414a2f6771fae",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openjdk-11-jdk-headless",
        package_name = "openjdk-11-jdk-headless",
        sha256 = "9bb5ba00f693f74cbd4b575fcb28a3698022121f7bc526470c33035bb3034da2",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.22+7-1~deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openjdk-11-jre-headless",
        package_name = "openjdk-11-jre-headless",
        sha256 = "3f06593379cdae3240076b8d3365ab2d3d7db4b6721be514b3b7322f734ed2e3",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-11/openjdk-11-jre-headless_11.0.22+7-1~deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "9f7f07462a589db966f5588a21cb5ec23ca285e3a73fd09b7c3afbe96fbfa17d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.10+7-1~deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "864ee7efa8d88a70a1c28b3fe87b8fb5210fd116a2c5365913e790f118c7b4fb",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.10+7-1~deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openssl",
        package_name = "openssl",
        sha256 = "3320cc9eea439c623016fc2e023c5fa3b2685f940e2a4a226bf4c75789f27e56",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_1.1.1w-0+deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "13befffb7ee127f569af92d736e30c86c199bbd58f9c3cca0d071ed63e04d003",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb11u1_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_zlib1g",
        package_name = "zlib1g",
        sha256 = "98bc525aa0b4bf5b36c1366c9c28701f35c6b9d2af1ddf16d3dc14e961691f24",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_base-files",
        package_name = "base-files",
        sha256 = "1c6dd70eab979779b5b28cf10f4d47b6821e47eb6a3630081b7d467a8983aa9e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/base-files/base-files_12.4+deb12u5_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "s390x_debian12_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "ffaa7963a752f238557ca4ffe101d513d9b81923132e6b2ecf5b40d52966fa34",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/fontconfig-config_2.14.1-4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "8892669e51aab4dc56682c8e39d8ddb7d70fad83c369344e1e240bf3ca22bb76",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-6_all.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "738a3bf125b58288da858228194e294708398ea4a44af2ef16f92569ecf57fd0",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "06b92a30d3f9056f64bbd6e885bdb24dd4d145a0b68a8249274b3599a0422944",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libc6",
        package_name = "libc6",
        sha256 = "bfbf7f5f9ad552363dbfe9465d30845f6c4053a9cf0626724c2d4dbd502c8b7e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glibc/libc6_2.36-9+deb12u4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "9c7fc22abd79945ee813450f7929f9349bd370bcdc979c4e128e884344169e1f",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libexpat1",
        package_name = "libexpat1",
        sha256 = "c32e609bd3b0f09a7c24280c63281082eb853783427c168e924802871b83de65",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/e/expat/libexpat1_2.5.0-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "da6af54263ec32a709523001b07d69fe4c5e7e5ef712cc13b46c4c0dfb5f58ff",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/fontconfig/libfontconfig1_2.14.1-4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "c80aff12f125afe6068ea1b155e70bfaae933eddca89790be74a465e9c913b80",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/f/freetype/libfreetype6_2.12.1+dfsg-5_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "beb6ead3623332a8d65523293b45c6770fe0f8396e13f9d9da2b38a905ef822b",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "71560b042a0c07258baebd6fef6c58f4eb856015a4f542055cdd08f5b39ced72",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "c2c6111858661a8136ae8c41f465c851469740e6ae3e70b4d842b076a9c1eaf1",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "5d11b4ffb8f9559b77b3b6981f3c59df5a446a075b2bcc0f6184c0d9ba8c4b1c",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "fcff4fc71a54a60e741d560fad3c5cf9465f6887294ab2e3b68d990bb9f59e63",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/h/harfbuzz/libharfbuzz0b_6.0.0+dfsg-3_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "1274a8aaa6bd5c64a3380eba30f5cbbb8abf0ef083d7809b4a5bb006d862e09d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "5c972b0d2cdc722ebc796ff22c3bd7e01cd6767e1b5e0d11b2d468c4012a5efc",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/l/lcms2/liblcms2-2_2.14-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libpcre2-8-0",
        package_name = "libpcre2-8-0",
        sha256 = "f7e39d23b97e7c30a0294c810b3df6bf4e974e9555cdaf8c1dc274195443fc32",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/p/pcre2/libpcre2-8-0_10.42-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "d936268159447ccda49e12760c7a482ba763207a7e1a220fd224a56acbf653f0",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/libp/libpng1.6/libpng16-16_1.6.39-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "39046c25476b3a20def5db5cfbef5d885d01d2df1ff2e56d2f5cadaeeadc2606",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/libssl3_3.0.11-1~deb12u2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "04dbe0085f54cc8383a79fa0e77e5dd380738b0f5a29b72d8d189acc43be86d9",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libuuid1",
        package_name = "libuuid1",
        sha256 = "dc15297161de52ebf14bf6e78632a777a34a2b5d580ba8238342543e377fb270",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/u/util-linux/libuuid1_2.38.1-5+b1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "s390x_debian12_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "c6b178b3e29c926351f9bfe97dc17d464a87a9881c62a00571d90b0bd0f2dfcc",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.10+7-1~deb12u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "dda4892fda5887e5e8a1abf53266f26d2ee378ecde62ff5b8a0566e8e258016d",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.10+7-1~deb12u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_openssl",
        package_name = "openssl",
        sha256 = "d696a48af727ebc8d0587771e3e2a5bca817f4786504ea196017bd58bf3506b4",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/o/openssl/openssl_3.0.11-1~deb12u2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "0ca0baec1fca55df56039047a631fc1541c5a44c1c4879d553aaa3a70844eb12",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/t/tzdata/tzdata_2024a-0+deb12u1_all.deb"],
    )
    debian_archive(
        name = "s390x_debian12_zlib1g",
        package_name = "zlib1g",
        sha256 = "aaa18b6281d1e5a5ba82bdb951d1b0fed43829f52a285f351dc5352880e3ef7e",
        urls = ["https://snapshot.debian.org/archive/debian/20240210T223313Z/pool/main/z/zlib/zlib1g_1.2.13.dfsg-1_s390x.deb"],
    )
