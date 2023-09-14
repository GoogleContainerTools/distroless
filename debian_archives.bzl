# AUTO GENERATED
load("@distroless//private/remote:debian_archive.bzl", "debian_archive")

def repositories():
    debian_archive(
        name = "amd64_debian11_base-files",
        package_name = "base-files",
        sha256 = "36a95b06e88394ff6ea8072eff7433c7a9e1a022cd3611a7d0f7f816d34028e1",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_11.1+deb11u7_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_dash",
        package_name = "dash",
        sha256 = "0a4cc532fbf2c78cb4090a659fb73560981e626849532e6186f3a3ac6a45b3bc",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "65ca7d8b03e9dac09c5d544a89dd52d1aeb74f6a19583d32e4ff5f0c77624c24",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libbz2-1.0",
        package_name = "libbz2-1.0",
        sha256 = "16e27c3ebd97981e70db3733f899963362748f178a62644df69d1f247e741379",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "d6cedf530cbb7c1758c203374a2bc16eeb7abb7eaa27aca8e3fe168447f1d0cb",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libc6",
        package_name = "libc6",
        sha256 = "cb8771d39b068834197b2b75c6b06433685b6e6a23a315064fb7cb5ab80cc235",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.31-13+deb11u6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libcom-err2",
        package_name = "libcom-err2",
        sha256 = "d478f132871f4ab8352d39becf936d0ad74db905398bf98465d8fe3da6fb1126",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "f617952df0c57b4ee039448e3941bccd3f97bfff71e9b0f87ca6dae15cb3f5ef",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libdb5.3",
        package_name = "libdb5.3",
        sha256 = "00b9e63e287f45300d4a4f59b6b88e25918443c932ae3e5845d5761ae193c530",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.8_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libexpat1",
        package_name = "libexpat1",
        sha256 = "5744040c4735bcdd51238aebfa3e402b857244897f1007f61154982ebe5abbd7",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libffi7",
        package_name = "libffi7",
        sha256 = "30ca89bfddae5fa6e0a2a044f22b6e50cd17c4bc6bc850c579819aeab7101f0f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libf/libffi/libffi7_3.3-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "b92861827627a76e74d6f447a5577d039ef2f95da18af1f29aa98fb96baea4c1",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "b21cfdd12adf6cac4af320c2485fb62a8a5edc6f9768bc2288fd686f4fa6dfdf",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "e478f2709d8474165bb664de42e16950c391f30eaa55bc9b3573281d83a29daf",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "995469490dcc8f667df8051a39dd5abd7149d849456c28af4e58cbfd6d6dc4f8",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "4530c95aefa48e33fd8cf4acbe5c4b559dbe7bdf4c56469986c83a203982cef1",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "31113b9e20c89d3b923da0540d6f30535b8d14f32e5904de89e34537fa87d59a",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libgssapi-krb5-2",
        package_name = "libgssapi-krb5-2",
        sha256 = "03d2c35600ebb5b83e6acaf3b130f5ca2012d70fc13e2664564dfec354076562",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "c76825341b5877240ff2511a376844a50ffda19d9d019ae65a5b3a97f9a1a183",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "28de780a1605cf501c3a4ebf3e588f5110e814b208548748ab064100c32202ea",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libk5crypto3",
        package_name = "libk5crypto3",
        sha256 = "115c090e64614cffed4786ca20038ccf304ab75183714508694d7b979f260c11",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libkeyutils1",
        package_name = "libkeyutils1",
        sha256 = "f01060b434d8cad3c58d5811d2082389f11b3db8152657d6c22c1d298953f2a5",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libkrb5-3",
        package_name = "libkrb5-3",
        sha256 = "e983d4a5f0d13410383478d5b5686b4f4ea3dc5d379540234bb813ff7a48ba9d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libkrb5support0",
        package_name = "libkrb5support0",
        sha256 = "5ec0151297fd6259ff10c62233894966768fd4e9bafd31be6fb84f7a2f854a0f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "0608ecb6ed258814e390b52b3fb50f2a6d3239b5ecb1086292ae08be00a67b0f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_liblzma5",
        package_name = "liblzma5",
        sha256 = "1c79a02415ca5ee7234ac60502fb33ee94fa70b02d1c329a6a14178f8329c435",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/x/xz-utils/liblzma5_5.2.5-2.1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libmpdec3",
        package_name = "libmpdec3",
        sha256 = "816404866f754d5662d69db50072018dccb78cf372fc38e0be961fab0f57d741",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libncursesw6",
        package_name = "libncursesw6",
        sha256 = "4a53efece402caaa798649f74bfb63fe21ac2fbcacf302554e46fbd17e5b30fc",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libnsl2",
        package_name = "libnsl2",
        sha256 = "c0d83437fdb016cb289436f49f28a36be44b3e8f1f2498c7e3a095f709c0d6f8",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libpcre3",
        package_name = "libpcre3",
        sha256 = "48efcf2348967c211cd9408539edf7ec3fa9d800b33041f6511ccaecc1ffa9d0",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/pcre3/libpcre3_8.39-13_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "7d5336af395d1f658d0e66d74d0e1f4c632028750e7e04314d1a650e0317f3d6",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libpython3.9-minimal",
        package_name = "libpython3.9-minimal",
        sha256 = "594283526d67e03e3c4e96534f6bfe5da1bf41da5d49360553c9b79fbf08c4ab",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libpython3.9-stdlib",
        package_name = "libpython3.9-stdlib",
        sha256 = "32ac64d959ac2dbc5bb289532fc9834dab8f671b5455695a3a9315aad973c65b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libreadline8",
        package_name = "libreadline8",
        sha256 = "162ba9fdcde81b5502953ed4d84b24e8ad4e380bbd02990ab1a0e3edffca3c22",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/r/readline/libreadline8_8.1-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libsqlite3-0",
        package_name = "libsqlite3-0",
        sha256 = "a0b8d3acf4a0483048637637d269be93af48d5c16f6f139f53edd13384ad4686",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "08be73a6a5454a8978c5a71ea5ca4b3a6909ce6cc927890729ebd6f9af12d9d8",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb11u5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "5c155c58935870bf3b4bfe769116841c0d286a74f59eccfd5645693ac23f06b1",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libtinfo6",
        package_name = "libtinfo6",
        sha256 = "92ac8a8c12f02a6fe08c47f33ea6fb313e1b9480484e26eab34e2058ea59fdb4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/ncurses/libtinfo6_6.2+20201114-2+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libtirpc3",
        package_name = "libtirpc3",
        sha256 = "86b216d59b6efcd07d56d14b8f4281d5c47f24e9c962f46bbaf02fce762c5e6a",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libt/libtirpc/libtirpc3_1.3.1-1+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_libuuid1",
        package_name = "libuuid1",
        sha256 = "31250af4dd3b7d1519326a9a6764d1466a93d8f498cf6545058761ebc38b2823",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openjdk-11-jdk-headless",
        package_name = "openjdk-11-jdk-headless",
        sha256 = "9c3652263a8801bbe6ba3a9cb9f792fd4e689694d187b944ac05a91bcc75d1f0",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.20+8-1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openjdk-11-jre-headless",
        package_name = "openjdk-11-jre-headless",
        sha256 = "513a6e3176dc0fb587f15e802289bffc8143ab2750891ddacbf8f22c4b362efb",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.20+8-1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "7e6e9ee19ec2e1d5ea2fc5a26c1001cee0a84efb2b0883a786bcb5c5edf1585d",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.7+7-1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "a59425026530e07e90c75504c7a7171905e452c6c7a48c02dea25ae85e0ea206",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jre-headless_17.0.7+7-1~deb11u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_openssl",
        package_name = "openssl",
        sha256 = "9756f315ef74ccaa1b741b5359c886b10fdb531ea6bfba0f9b4ae9e635c8af86",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb11u5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_python3-distutils",
        package_name = "python3-distutils",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_python3.9-minimal",
        package_name = "python3.9-minimal",
        sha256 = "5d6003c5c20223a2547ac4976e09a9ec778dbe351507a6292bef3b60df5f4aa7",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "e15eebc40b4aeba0ab22fd72b2d6170b6983316b55d9599053d95af735a8478d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u10_all.deb"],
    )
    debian_archive(
        name = "amd64_debian11_zlib1g",
        package_name = "zlib1g",
        sha256 = "03d2ab2174af76df6f517b854b77460fbdafc3dac0dca979317da67538159a3e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_base-files",
        package_name = "base-files",
        sha256 = "325a4c2e1f6361f95156d365d391354f220e97dba9e5d39a714781ee715303f3",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_12.4+deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "281c66e46b95f045a0282a6c7a03b33de0e9a08d016897a759aaf4a04adfddbe",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/fontconfig-config_2.14.1-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "8892669e51aab4dc56682c8e39d8ddb7d70fad83c369344e1e240bf3ca22bb76",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-6_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "563b4caec1aa5e876bd3355b36e7a38e1484baf5a293b48d1e8bd22db786e4d7",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b6_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "259b757afef838d394db8f153df1a7f233e39cb87b2abdaa6d89d7369381b537",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libc6",
        package_name = "libc6",
        sha256 = "ee2ef7aa6b9c53a109b79ae5f80fe354ef99ce39915c18b461ef1cf4f9fe15f8",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.36-9+deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "f5f60a5cdfd4e4eaa9438ade5078a57741a7a78d659fcb0c701204f523e8bd29",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libexpat1",
        package_name = "libexpat1",
        sha256 = "fe36a7f35361fc40d0057ef447a7302fd41d51740d51c98fb3870bbed5b96e56",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/expat/libexpat1_2.5.0-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "16ee38d374e064f534116dc442b086ef26f9831f1c0af7e5fb4fe4512e700649",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/libfontconfig1_2.14.1-4_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "72ef03236f1936e72a0faf86a547425b0eff3c5fd0b43f8669012182cf376354",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/freetype/libfreetype6_2.12.1+dfsg-5_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "f3d1d48c0599aea85b7f2077a01d285badc42998c1a1e7473935d5cf995c8141",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "7e90ba4670377ae29f1a718798b4d5e088ac97d2dfa20a13b4b2ea357b61ec29",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "1dbc499d2055cb128fa4ed678a7adbcced3d882b3509e26d5aa3742a4b9e5b2f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "31113b9e20c89d3b923da0540d6f30535b8d14f32e5904de89e34537fa87d59a",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "bfce132b7ee67b9c2d2166075b1936a25c8cc6866b6a049f99b8e94baa916e71",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/h/harfbuzz/libharfbuzz0b_6.0.0+dfsg-3_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "95ec30140789a342add8f8371ed018924de51b539056522b66f207b25cba9cad",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "8b417407302ca99e5d5f70bacece70bda54f8cd0bb6d59b478b6411c27c1366a",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/l/lcms2/liblcms2-2_2.14-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libpcre2-8-0",
        package_name = "libpcre2-8-0",
        sha256 = "030db54f4d76cdfe2bf0e8eb5f9efea0233ab3c7aa942d672c7b63b52dbaf935",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/pcre2/libpcre2-8-0_10.42-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "dc32727dca9a87ba317da7989572011669f568d10159b9d8675ed7aedd26d686",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libp/libpng1.6/libpng16-16_1.6.39-2_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "45407e1164813c6473f4c1113d26d2b8d776ed607f88e29169b91b64f4035577",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/libssl3_3.0.9-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "9b1b269020cec6aced3b39f096f7b67edd1f0d4ab24f412cb6506d0800e19cbf",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_libuuid1",
        package_name = "libuuid1",
        sha256 = "c2b3ccade855de14c6ece893a0d2bec63b0a007cbc2970af8152cf06699ccd2a",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/u/util-linux/libuuid1_2.38.1-5+b1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "da429ebe403b169cd204a13bd67c8e4a87bbf5973c19b1cab7ab5f6f3a6aab75",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.8+7-1~deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "44a1ec14284c7ae447b8524812e3832b2f1fa2100bd7701a650940189f8bb522",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jre-headless_17.0.8+7-1~deb12u1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_openssl",
        package_name = "openssl",
        sha256 = "1625c55cb44fcb2798fcb66e3e5d47dab5112917f8bc2a89ec74d37ea78479bb",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/openssl_3.0.9-1_amd64.deb"],
    )
    debian_archive(
        name = "amd64_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "825efb56b6b9f7ca816074d7c2f6118894f455e64839d85eb1de53f4a610991e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2023c-5_all.deb"],
    )
    debian_archive(
        name = "amd64_debian12_zlib1g",
        package_name = "zlib1g",
        sha256 = "d7dd1d1411fedf27f5e27650a6eff20ef294077b568f4c8c5e51466dc7c08ce4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/z/zlib/zlib1g_1.2.13.dfsg-1_amd64.deb"],
    )
    debian_archive(
        name = "arm_debian11_base-files",
        package_name = "base-files",
        sha256 = "a6cde3997f40a69f381c1245fef65c800434000fab9375e5912b0102446e0c78",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_11.1+deb11u7_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "arm_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "f82b1aef7d984cff5841bf41480d273a0158bc8850f3c52659140119ae290496",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u6_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libc6",
        package_name = "libc6",
        sha256 = "f0976af17f3c227e5137e81471d3c32d5c0b9c4f3cbeaa0c509fd77e7267c931",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.31-13+deb11u6_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "4cfff89c7f492090c5988298f9f9419d3464d294c43883800a2ed55676581d26",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "c046673580eef1ef3b2778c37c8baccbb5510195e8008f789b8309b38345abc0",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "fcb6eb0fb5c724c694e57efe6ce21f8860b90d6e2ae81e79db014b0e6b280e44",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb11u5_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "879258df2ac36d9733df014c5a5443944e1a5c4ba9a7eebe5dd28547b4ebb541",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "arm_debian11_openssl",
        package_name = "openssl",
        sha256 = "5f91752eaacade3cc01a4a2aec11f0059a361b15abe17c79e7883b4dbeab954b",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb11u5_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "e15eebc40b4aeba0ab22fd72b2d6170b6983316b55d9599053d95af735a8478d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u10_all.deb"],
    )
    debian_archive(
        name = "arm_debian12_base-files",
        package_name = "base-files",
        sha256 = "1b28bd0c4ad5384c24458ecfe8784e7c39e16b95a28ece95eb792c0152f0196b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_12.4+deb12u1_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "arm_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "90aca060275e9840b19bfacb962a14dbe163241e38f27297706380564ba9bf76",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u1_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libc6",
        package_name = "libc6",
        sha256 = "942e446f7e82fd69ab8ba32e0e198ed099318da20b56aac57682065ed4d3bf90",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.36-9+deb12u1_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "6eee90afd6976f6a4f34e288fc98a57f72fbffac442ab28d860630d85a15e5d7",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "59135191d9054cfa01e6f005a27e2e3dbe571ee3b4e4d76e4283a723c894ecae",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "5c850bda9ca4b622d9a9a81ccd662d767a41fb534ac46d04e24f3013f8355386",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/libssl3_3.0.9-1_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "50729c9e7c78ad33529dff20f55d6eb3299055079016973ef068ca2c5eb08eff",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "arm_debian12_openssl",
        package_name = "openssl",
        sha256 = "c64822827d8ed876a0915da5ae2449c4961362112f1808dded76fc32dacaa363",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/openssl_3.0.9-1_armhf.deb"],
    )
    debian_archive(
        name = "arm_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "825efb56b6b9f7ca816074d7c2f6118894f455e64839d85eb1de53f4a610991e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2023c-5_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_base-files",
        package_name = "base-files",
        sha256 = "f2c290240d468063e00305ef712a2c03163b0a9a741c3a4c774e169b92670a75",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_11.1+deb11u7_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_dash",
        package_name = "dash",
        sha256 = "542980a48d96c1124a9664cae06dbb8b813417daa1de1b6ed4cb49e0766da932",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "52ca7f90de6cb6576a0a5cf5712fc4ae7344b79c44b8a1548087fd5d92bf1f64",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libbz2-1.0",
        package_name = "libbz2-1.0",
        sha256 = "da340e8470e96445c56966f74e48a9a91dee0fa5c89876e88a4575cc17d17a97",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "2fde95a5f8089a1adbffdbabc40e35df2813c6579a450049b4d996ef8b6c3c85",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libc6",
        package_name = "libc6",
        sha256 = "e8c9c4134018d8e4e097bdb10dc6886ac833b9459a140b9f0d5273a550058aa0",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.31-13+deb11u6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libcom-err2",
        package_name = "libcom-err2",
        sha256 = "fc95d415c35f5b687871f660a5bf66963fd117daa490110499119411e2d6145e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "22b586b29e840dabebf0bf227d233376628b87954915d064bc142ae85d1b7979",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libdb5.3",
        package_name = "libdb5.3",
        sha256 = "cf9aa3eae9cfc4c84f93e32f3d11e2707146e4d9707712909e3c61530b50353e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.8_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libexpat1",
        package_name = "libexpat1",
        sha256 = "8d20bfd061845bda0321d01accd6f8386ead5b1d7250a585d12b8d5fb1408ffa",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libffi7",
        package_name = "libffi7",
        sha256 = "eb748e33ae4ed46f5a4c14b7a2a09792569f2029ede319d0979c373829ba1532",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libf/libffi/libffi7_3.3-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "18b13ef8a46e9d79ba6a6ba2db0c86e42583277b5d47f6942f3223e349c22641",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "b25f1c148498dd2b49dc30da0a2b2537a7bd0cb34afb8ea681dd145053c9a3f8",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "e2fcdb378d3c1ad1bcb64d4fb6b37aab44011152beca12a4944f435a2582df1f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "667d1b891bcf9b8cc47385c19b39271c74f48fd2b6b457474184f85ce63ea261",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "813af2e0b8ba0a7cea18c988cd843412ef6d0415700fc860d62816750e741670",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "473362a74ba74ae630fc43675460fb5a1058564a635a301875e00f1c6f9b27cb",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libgssapi-krb5-2",
        package_name = "libgssapi-krb5-2",
        sha256 = "dbfa98b48e405dd5febdfb95095fb3ac3659d9c9c7baa29b16904fa6b65b7a2b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "d9f0345391cc661503d1508ccd318b3db48add354e706cf9d66fa16bf99e2d03",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "8903394de23dc6ead5abfc80972c8fd44300c9903ad4589d0df926e71977d881",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libk5crypto3",
        package_name = "libk5crypto3",
        sha256 = "6193fca1f4dbcc366cff4767194f9bcc278467c9dcd786c90a2933846312db39",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libkeyutils1",
        package_name = "libkeyutils1",
        sha256 = "7101c2380ab47a3627a6fa076a149ab71078263064f936fccbd43efbaed4a2da",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libkrb5-3",
        package_name = "libkrb5-3",
        sha256 = "130a57d59a0b76711d1d42b54491017d84052c8bad05971fc8d13b2c5cb07a5f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libkrb5support0",
        package_name = "libkrb5support0",
        sha256 = "7e42d93c73eff4d34e981aeabb48f6a7da2123a145fe13c08b0f853a947d76bf",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "6d92ee1f0d427b88ab9bff32c769b61e2597c8fb289589ca0731a7e77d490d6e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_liblzma5",
        package_name = "liblzma5",
        sha256 = "d865bba41952c707b3fa3ae8cab4d4bd337ee92991d2aead66c925bf7cc48846",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/x/xz-utils/liblzma5_5.2.5-2.1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libmpdec3",
        package_name = "libmpdec3",
        sha256 = "171e2581970f36a39f65d1ca3c761e76b103844daae7903fcc07f7c3822a05bb",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libncursesw6",
        package_name = "libncursesw6",
        sha256 = "0b7192ce69cf53288b90ece6cfb2745780f5bf72536b882ca372a2b0d8916f05",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libnsl2",
        package_name = "libnsl2",
        sha256 = "8f9ba58b219779b43c4ccc78c79b0a23f721fc96323c202abb31e02f942104b3",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libpcre3",
        package_name = "libpcre3",
        sha256 = "21cac4064a41dbc354295c437f37bf623f9004513a97a6fa030248566aa986e9",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/pcre3/libpcre3_8.39-13_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "f5f61274aa5f71b9e44b077bd7b9fa9cd5ff71d8b8295f47dc1b2d45378aa73e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libpython3.9-minimal",
        package_name = "libpython3.9-minimal",
        sha256 = "b49736ab0e8b8577f97a474ca67e20c1c025f9d7394ec8d7820de6314c903cf9",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libpython3.9-stdlib",
        package_name = "libpython3.9-stdlib",
        sha256 = "3b3612dcd7550f01ec3517fbe955838223f4cf115b6983e4ed6d7320cd4b05c4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libreadline8",
        package_name = "libreadline8",
        sha256 = "500c3cdc00dcaea2c4ed736e00bfcb6cb43c3415e808566c5dfa266dbfc0c5e5",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/r/readline/libreadline8_8.1-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libsqlite3-0",
        package_name = "libsqlite3-0",
        sha256 = "1e33cd39dc4fff2a7edd7bb7e90a71e20fb528f6a581fe0287652e4dae77e0d0",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "19a0ab710daef6bc1ac411f61c596e380bd79335b5d52d7d60c1a50154461a84",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb11u5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "7869aa540cc46e9f3d4267d5bde2af0e5b429a820c1d6f1a4cfccfe788c31890",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libtinfo6",
        package_name = "libtinfo6",
        sha256 = "8282a785437b305bca7758aba19252bd81b5d0d2a54b709af97e682516f1cf4e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/ncurses/libtinfo6_6.2+20201114-2+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libtirpc3",
        package_name = "libtirpc3",
        sha256 = "ccff0927f55b97fe9ea13057fab8bff9920bf4628eb2d5d48b9656f2fb74d2e1",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libt/libtirpc/libtirpc3_1.3.1-1+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_libuuid1",
        package_name = "libuuid1",
        sha256 = "3d677da6a22e9cac519fed5a2ed5b20a4217f51ca420fce57434b5e813c26e03",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openjdk-11-jdk-headless",
        package_name = "openjdk-11-jdk-headless",
        sha256 = "e0e1d000de7bbf693f7831a97cd79c5c672db92515cca4e2497c0f91d0df97d1",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.20+8-1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openjdk-11-jre-headless",
        package_name = "openjdk-11-jre-headless",
        sha256 = "238cb54c17dd9115793aab8d1c8749f8e38750547cd02f2d03cb07ccc9d540f7",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.20+8-1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "62ad4fb5b2823e2853acf8defc15994151a1155789490f1ba7f778330162f3ef",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.7+7-1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "5c813bc4bade9e66f29637ebe4774fbc8cefa3b5d613587a5c001c9639c5b610",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jre-headless_17.0.7+7-1~deb11u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_openssl",
        package_name = "openssl",
        sha256 = "d6fb022b1fcb30cb7e385560274d544661a8fef144188bec2d4d9f7513ff6fb2",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb11u5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_python3-distutils",
        package_name = "python3-distutils",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_python3.9-minimal",
        package_name = "python3.9-minimal",
        sha256 = "bc0d0ed39ebc066020c3a16afdab4fd3e0260b41ae799273531d5b2403ae7b27",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "e15eebc40b4aeba0ab22fd72b2d6170b6983316b55d9599053d95af735a8478d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u10_all.deb"],
    )
    debian_archive(
        name = "arm64_debian11_zlib1g",
        package_name = "zlib1g",
        sha256 = "e3963985d1a020d67ffd4180e6f9c4b5c600b515f0c9d8fda513d7a0e48e63a1",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_base-files",
        package_name = "base-files",
        sha256 = "e85f3168adcc9d63a1b2d5fa3d6ac7e11fe2167304988b59cca04c7a171bedf4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_12.4+deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "297b5a63f9214ffebe08892cdf2effdaf2b408e719811d5e8e98870f710cd35c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/fontconfig-config_2.14.1-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "8892669e51aab4dc56682c8e39d8ddb7d70fad83c369344e1e240bf3ca22bb76",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-6_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "3137de7f71952e710ee9f0df05026b3c6f463be9369a502d57c7696732f1ed22",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b6_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "f80fa6f178bdcc70215b82085b8d6a58597c59e0c1ed86ea82e107a6db50c866",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libc6",
        package_name = "libc6",
        sha256 = "8ae49b2badad470ddd52fb7d28ecfc239b41e4a94a979c6a6c5bd5661fa7997b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.36-9+deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "eea0ad76ea5eb507127fea0c291622ea4ecdbb71c4b9a8ed9c76ae33fc1a0127",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libexpat1",
        package_name = "libexpat1",
        sha256 = "39de7d17cb312d76f586866a38d7649102178a2cdb7f4cef1b4f279ea3cebf07",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/expat/libexpat1_2.5.0-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "4836d9deca824883f0de33d4f8f3718ba776c6e7c80cd7c418b5a0f86c009b9e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/libfontconfig1_2.14.1-4_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "051561d8901fd5e2c38a4903ce734df28450e41601b6c5d6ce0fdee7ea0f7973",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/freetype/libfreetype6_2.12.1+dfsg-5_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "6fce2268d8f3152a4e84634f5a24133d3c62903b2f9b11b9c59235cbbc1b23a8",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "203b248ce95efd67b89586849a027e8691aaf3ad1df5fb263fff949fa4ba2af4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "a2fd2803bf03384ac90a54f1179a29f2fb3c192f3ff483a3dd8ec6c3351ce5d0",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "473362a74ba74ae630fc43675460fb5a1058564a635a301875e00f1c6f9b27cb",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "64b1d4aa672dc4eda5e11b9ff8061122060fc7aba6ad16908c89a269ffa174ee",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/h/harfbuzz/libharfbuzz0b_6.0.0+dfsg-3_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "de66f186f3ff3c1d10c2e75ae056b019b3f7f091f51096a06cade48b2dea875b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "1e48b6846b0e7cdce7675da6b0f8bc5fef3f5170fd2470d17d65dc3d8c009720",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/l/lcms2/liblcms2-2_2.14-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libpcre2-8-0",
        package_name = "libpcre2-8-0",
        sha256 = "b2448d0a8a3db7fbeac231e7ef93811346c1fb5f96ccf6f631701d8a4eb39206",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/pcre2/libpcre2-8-0_10.42-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "ae87c6251a03fbe466228a058fcbaa5b6a44f156166c1ba5118024ac4bf65b75",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libp/libpng1.6/libpng16-16_1.6.39-2_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "38571741535338220b015739b7d7c8a3f58988f4a7a7d7fed85871279a5a2b3e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/libssl3_3.0.9-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "21e971c5d3506f783b89efe8e12ac85081ddd9213e4f6529262bcfe95c326670",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_libuuid1",
        package_name = "libuuid1",
        sha256 = "34d56dc6cbac8a0a4c0db78de67633548268c536b38198f67e6600a7775d3f88",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/u/util-linux/libuuid1_2.38.1-5+b1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "41d80acb1fe60b7b939bc8c0202e817be8c5bd7a62727ad7c3422dca5dc48036",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.8+7-1~deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "7aa847a336b04dd84b15387c180038cf2ae52f2bcff096ff46bc4be4ad1938b4",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jre-headless_17.0.8+7-1~deb12u1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_openssl",
        package_name = "openssl",
        sha256 = "f7604e1f5d969c0447642a917b7203d8519c2fc8f5d867dba0708823acc18c8e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/openssl_3.0.9-1_arm64.deb"],
    )
    debian_archive(
        name = "arm64_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "825efb56b6b9f7ca816074d7c2f6118894f455e64839d85eb1de53f4a610991e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2023c-5_all.deb"],
    )
    debian_archive(
        name = "arm64_debian12_zlib1g",
        package_name = "zlib1g",
        sha256 = "52b8b8a145bbe1956bba82034f77022cbef0c3d0885c9e32d9817a7932fe1913",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/z/zlib/zlib1g_1.2.13.dfsg-1_arm64.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_base-files",
        package_name = "base-files",
        sha256 = "1c915d814590e8972b76c2edce9157d6608bd9aed872a04b839c994a59f095c6",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_11.1+deb11u7_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "a7a7099df1c6ab6c3472731d88892e83f0077b2d3ec1414ff8f1c311a55a9f92",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "9cb0b890f4a3f6f2c970a0ce407bd212e92ef59bfb90229ee096f1335475c6c5",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libc6",
        package_name = "libc6",
        sha256 = "d1ab944b865efe2b66958c23c35e4385a80d0328f05cd1e856a91b6890a4dfed",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.31-13+deb11u6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "0087ad3e3d01968c3fb354f77b46966e4ca79246a08caca9257695095befcf05",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libexpat1",
        package_name = "libexpat1",
        sha256 = "cbf5268366667e541654f4b7290c2baa5329aee2f25b18bea520f69063fc9474",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "a4eed4b8c8cefe48e0567a0c098a7bf9fc6aab4093a9dd2e75fbdfa2d1ef7aa8",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "6ca7c822898cf4664023a614af17bb139647ff9fa6e56546f1504c5f1d6ca76f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "8b612f798430a6dd8b8b5e8f712b7ea92329201c6a438a9d176e9e285f1c14d5",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "c31d5cac3c9b6d861b62a5f9972f1351355d57a622d1669fa410457c912ab905",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "f4b1f093072bf65694a98432d108e5c62756c147f5e92e657021428dc602b9f4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "6998cf0f9dd4c0d09ce0521e26ed967f596fc1e8b394edbc49fc0cd4a969a3d2",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "eceadc98a48d3950cd69be4648ef134b76a224415a6fad9193407860604d6a9b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "7c198ae4e27ddb57d53ee68bf2846b3dc88d33b9948d5f2903ee9e69312848b9",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "e4b32374b944aae5c4ab9e3742a68ad978faae9403c2685c5e44c7aa4d6e0123",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libpcre3",
        package_name = "libpcre3",
        sha256 = "c24f9bb2b39d2fb9750a52a9ba512754079062c92be5f51b204689117c11868a",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/pcre3/libpcre3_8.39-13_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "ea4e1daaeab93a09f9fc943a852099c89d69da0c9606d0f4419ae0c5d4b5c10d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "a9a5440404aab89f1bd84445413f94cee4fc70ba186c032ca025cccb3b440d88",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb11u5_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "cda71acea3aba81ccb555f7b2355a6a3944b0f09049945a351d8e7682058daa9",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_libuuid1",
        package_name = "libuuid1",
        sha256 = "8c5a094cf457ffedcd3c401f8aef735a4e9a405cd07208ec6c8e57441f650bdf",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openjdk-11-jdk-headless",
        package_name = "openjdk-11-jdk-headless",
        sha256 = "68e6ac6be1228cca98b993df819fa25093ef3b5e54144f11b6b2e49b7880a835",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.20+8-1~deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openjdk-11-jre-headless",
        package_name = "openjdk-11-jre-headless",
        sha256 = "a36659688533d573247466dd44d651135feb204b8dabd82c04427d2371dd4655",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.20+8-1~deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "52890e69210385c857d6e654fd1a51f2e7bafb7395cffcaf9a8a3c274f13e63c",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.7+7-1~deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "12fd60e7e191c9f3ae7548ff7727629187c36fd8641224443305df9e66d7c04d",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jre-headless_17.0.7+7-1~deb11u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_openssl",
        package_name = "openssl",
        sha256 = "b265216f73fa69285e5d17e125dccaccb0736dfc9ff9c29de736ec17a73dd4bb",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb11u5_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "e15eebc40b4aeba0ab22fd72b2d6170b6983316b55d9599053d95af735a8478d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u10_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian11_zlib1g",
        package_name = "zlib1g",
        sha256 = "7724f4d01fd987e023cf55f1cfc964a495408f30c1dd1470b66f7a8d43a868da",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_base-files",
        package_name = "base-files",
        sha256 = "56253dd2a58032d0add6b1cadb6d1798ff424c99b434867532c9c323f29add7d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_12.4+deb12u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "7e9d4b15907cd56ba1fe1ab48c2f344621d506b54e1e3a1d444d276209eec9f3",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/fontconfig-config_2.14.1-4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "8892669e51aab4dc56682c8e39d8ddb7d70fad83c369344e1e240bf3ca22bb76",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-6_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "b9449bc0f0acd7c3a861e20c8de0812a153e10a8df96e9fad9532056fb988798",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b6_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "27882465a1af0282e903f43972bab434ff5be1790362c8174a19a8254d3c154c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libc6",
        package_name = "libc6",
        sha256 = "99276ee414a18fcdce610d38dfed8ba5a6c73f155e60c5a2ad58135a5d108ec4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.36-9+deb12u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "c5825784746727b7f8338c4de6caaa0d5945737628420f9a7cd8f0fc582372e6",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libexpat1",
        package_name = "libexpat1",
        sha256 = "0f6ccb24691c53983d2b080d095a2b651ff6bf8eec509cff62372d7922af7e52",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/expat/libexpat1_2.5.0-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "b3b30e067d65ddf18540155bbb06ed60f9dde22d2e84009a3088b173a4e6027f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/libfontconfig1_2.14.1-4_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "54ab0fc160bcc4c071b61919ef4a03934272bb81a449c9c05b2218f0c136014e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/freetype/libfreetype6_2.12.1+dfsg-5_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "1cdcfe462d116a33797ec9867519c0f1f4b7819b8914b6ec70faaaf8369d1e40",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "404961a9d8671804da0dc2e61579a9cc6a31a25bee9ab148802003867ba3795a",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "846fd545da0298a750d57f52ec59689d219c79d9693f15a1dfd6e141ff173e1e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "6998cf0f9dd4c0d09ce0521e26ed967f596fc1e8b394edbc49fc0cd4a969a3d2",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "f022385face7e537c51d69b7c4c159f90cbd0f2f04064ab7d442839f41e4df0c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/h/harfbuzz/libharfbuzz0b_6.0.0+dfsg-3_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "adae34f22d413f7e47d6b5dc82a21b85e5df70c0a0119ef8e39b2e8a5c6a0864",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "b4cd31cf86fa0ebcfd55effa35d3396c3500d44dcefee39d1e54263b7c6beabc",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/l/lcms2/liblcms2-2_2.14-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libpcre2-8-0",
        package_name = "libpcre2-8-0",
        sha256 = "13cfe079e615d5bba2b73bf856fcac7ffe8ad8ff94d5eaac7ba899f69fb2c748",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/pcre2/libpcre2-8-0_10.42-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "1589b8540bdd8f45380664be564350761bf78a913d2e490df498567da3204697",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libp/libpng1.6/libpng16-16_1.6.39-2_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "e144194c2dfbec1a457737f81d1ee0dbcba50a2a4994b04564dac7d44f89e0ee",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/libssl3_3.0.9-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "87e77916ddf0ac175e8fff101dfc93a3348187d87b0eba8089c6dc320e34ec20",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_libuuid1",
        package_name = "libuuid1",
        sha256 = "cf896e205b6ac11337a70031bb0d69748d3c0a901504bd21ff8a8f54386f16af",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/u/util-linux/libuuid1_2.38.1-5+b1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "dcb46d56de959f6da62afde8c419cd1bc0c6528784fffef18dd6d760d7eeebce",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.8+7-1~deb12u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "a6649ebaaeba7a50ddb88c2fe71e3b678a6c199c49c478d4f6fc23fb22a0095e",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jre-headless_17.0.8+7-1~deb12u1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_openssl",
        package_name = "openssl",
        sha256 = "dc49fc82dbc7c0b49a5b39c40b7cda5f1bebe6ecbcb35abe55d2a9c51947f1b8",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/openssl_3.0.9-1_ppc64el.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "825efb56b6b9f7ca816074d7c2f6118894f455e64839d85eb1de53f4a610991e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2023c-5_all.deb"],
    )
    debian_archive(
        name = "ppc64le_debian12_zlib1g",
        package_name = "zlib1g",
        sha256 = "4a512679756d8dadc91d37ecf353b868d526c007e8860b6618640812efbc51d1",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/z/zlib/zlib1g_1.2.13.dfsg-1_ppc64el.deb"],
    )
    debian_archive(
        name = "s390x_debian11_base-files",
        package_name = "base-files",
        sha256 = "8621bb9dc3231b7845b542f2109aab38c5bb8d9edf3da9c0480e366b80feca2f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_11.1+deb11u7_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "3f2ebe4c83833f374f3aad7f3b6aa9cf68ca3511544b97a185ab5c126790ac5f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libc-bin",
        package_name = "libc-bin",
        sha256 = "de73551be382125a564ad8e0a2dce8147faaff56e9ca66b94d7a02d2ae047dfe",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libc6",
        package_name = "libc6",
        sha256 = "371154721ca808fc19eec7023d21a0007a4a8ae04cbd71e1fe8347b22487c980",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.31-13+deb11u6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "dbab47c5dedde0c5dfc6f5c974e23bd4a48ebc48cb8a56e2cabded6fc52818b7",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libexpat1",
        package_name = "libexpat1",
        sha256 = "f3358a35ea71f682052c56db8d6f26fa95326cf672301f80d07ee770b4aa8bb4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u5_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "3890eb7a635164973f4205f75586a0a60a681328f730a9e0002af80e143cb036",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "8aecea8b8a908817f4367b451e83c5f8dbb7cc8372dfaa7df80c9898d03cf550",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "129b6403af3832426f470a30a3f01a71725eb38b7b7a93de4480f56ae5393e22",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "2166169b9c7d5a639bf8e5b018a7f48a240c36d404d1e2db8d4ce2acafc4b907",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libgomp1",
        package_name = "libgomp1",
        sha256 = "d836fcc5ba63095ed15efefee912c83902c7213f40b6aece73455c9348d5e462",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "5d11b4ffb8f9559b77b3b6981f3c59df5a446a075b2bcc0f6184c0d9ba8c4b1c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "a54b2558537d4758b51db666cba7e27c9dd83ad8b19f727a9eb2008576b2900c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "a75580859d0a161124bb1f3dd0ecb9f96786c18b5d39a02b57eb4cf7d7dd8653",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "0de7a9428b71b6abcaa0cccf2bb37aa6800d58baf5ca5fc063c4827703614853",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libpcre3",
        package_name = "libpcre3",
        sha256 = "ff08eb6d116b07affbed8cdd7c519caf2fc56beffef5dd7b6519eda670c1a7f7",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/pcre3/libpcre3_8.39-13_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "34b92145dcf4a532dab76086ec30a636a58d31c635e7c6f9d4cb47dfc4704512",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libssl1.1",
        package_name = "libssl1.1",
        sha256 = "72f145395f87d734240b907047997e2d0f80e6b8313ee4399d6efb5a694769d8",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb11u5_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "d632c1fc45ab0ef8bc9c8cbbc9436dd82340bf0c1e44bd8b791662057ef05505",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_libuuid1",
        package_name = "libuuid1",
        sha256 = "8df64efb47308f903f0b9835b697c84a2be133ffa9af0ac9d93414a2f6771fae",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_netbase",
        package_name = "netbase",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openjdk-11-jdk-headless",
        package_name = "openjdk-11-jdk-headless",
        sha256 = "7f43c0cd9b899033caf67f799dea40013ab4fc5170d72c49d59a5b04026b078c",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.20+8-1~deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openjdk-11-jre-headless",
        package_name = "openjdk-11-jre-headless",
        sha256 = "f782fe122cb50b7063b03695db2627e4dca2e0f161af355a2635904eb75024e0",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.20+8-1~deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "6758f2c5dc3841e0b10d4ef58dd73db100a8bd8f6382c4d5d0e2ef1065999a7c",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.7+7-1~deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "3a2c8cc26775cb993d3afecd950c295c3d5ad4c7a7a9e98865db6a4ee1e2c744",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jre-headless_17.0.7+7-1~deb11u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_openssl",
        package_name = "openssl",
        sha256 = "9adefe210a0c41cacbdfbc67613182474b390244881358e14bf9dafe0af581df",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb11u5_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian11_tzdata",
        package_name = "tzdata",
        sha256 = "e15eebc40b4aeba0ab22fd72b2d6170b6983316b55d9599053d95af735a8478d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u10_all.deb"],
    )
    debian_archive(
        name = "s390x_debian11_zlib1g",
        package_name = "zlib1g",
        sha256 = "98bc525aa0b4bf5b36c1366c9c28701f35c6b9d2af1ddf16d3dc14e961691f24",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_base-files",
        package_name = "base-files",
        sha256 = "3e6ffcf316cd7cec7abd3329d3b742c5d92c35ef2f87e2f09f682040cb07e77b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/base-files/base-files_12.4+deb12u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_ca-certificates",
        package_name = "ca-certificates",
        sha256 = "5308b9bd88eebe2a48be3168cb3d87677aaec5da9c63ad0cf561a29b8219115c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/c/ca-certificates/ca-certificates_20230311_all.deb"],
    )
    debian_archive(
        name = "s390x_debian12_fontconfig-config",
        package_name = "fontconfig-config",
        sha256 = "ffaa7963a752f238557ca4ffe101d513d9b81923132e6b2ecf5b40d52966fa34",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/fontconfig-config_2.14.1-4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_fonts-dejavu-core",
        package_name = "fonts-dejavu-core",
        sha256 = "8892669e51aab4dc56682c8e39d8ddb7d70fad83c369344e1e240bf3ca22bb76",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-6_all.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libbrotli1",
        package_name = "libbrotli1",
        sha256 = "738a3bf125b58288da858228194e294708398ea4a44af2ef16f92569ecf57fd0",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b6_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libc-bin",
        package_name = "libc-bin",
        sha256 = "7c264c32d458f3813f9ea654b9f0c8c1f48387f19b83e81b959718dc0ceec73a",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc-bin_2.36-9+deb12u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libc6",
        package_name = "libc6",
        sha256 = "c9d8f9d7d89909e4348f7418f40f03805ee733c9dd0eb1af0a841a69eb5fe61b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glibc/libc6_2.36-9+deb12u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libcrypt1",
        package_name = "libcrypt1",
        sha256 = "9c7fc22abd79945ee813450f7929f9349bd370bcdc979c4e128e884344169e1f",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libx/libxcrypt/libcrypt1_4.4.33-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libexpat1",
        package_name = "libexpat1",
        sha256 = "c32e609bd3b0f09a7c24280c63281082eb853783427c168e924802871b83de65",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/e/expat/libexpat1_2.5.0-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libfontconfig1",
        package_name = "libfontconfig1",
        sha256 = "da6af54263ec32a709523001b07d69fe4c5e7e5ef712cc13b46c4c0dfb5f58ff",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/fontconfig/libfontconfig1_2.14.1-4_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libfreetype6",
        package_name = "libfreetype6",
        sha256 = "c80aff12f125afe6068ea1b155e70bfaae933eddca89790be74a465e9c913b80",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/f/freetype/libfreetype6_2.12.1+dfsg-5_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libgcc-s1",
        package_name = "libgcc-s1",
        sha256 = "beb6ead3623332a8d65523293b45c6770fe0f8396e13f9d9da2b38a905ef822b",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgcc-s1_12.2.0-14_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libglib2.0-0",
        package_name = "libglib2.0-0",
        sha256 = "71560b042a0c07258baebd6fef6c58f4eb856015a4f542055cdd08f5b39ced72",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/glib2.0/libglib2.0-0_2.74.6-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libgomp1",
        package_name = "libgomp1",
        sha256 = "c2c6111858661a8136ae8c41f465c851469740e6ae3e70b4d842b076a9c1eaf1",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libgomp1_12.2.0-14_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libgraphite2-3",
        package_name = "libgraphite2-3",
        sha256 = "5d11b4ffb8f9559b77b3b6981f3c59df5a446a075b2bcc0f6184c0d9ba8c4b1c",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libharfbuzz0b",
        package_name = "libharfbuzz0b",
        sha256 = "fcff4fc71a54a60e741d560fad3c5cf9465f6887294ab2e3b68d990bb9f59e63",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/h/harfbuzz/libharfbuzz0b_6.0.0+dfsg-3_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libjpeg62-turbo",
        package_name = "libjpeg62-turbo",
        sha256 = "1274a8aaa6bd5c64a3380eba30f5cbbb8abf0ef083d7809b4a5bb006d862e09d",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.1.5-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_liblcms2-2",
        package_name = "liblcms2-2",
        sha256 = "5c972b0d2cdc722ebc796ff22c3bd7e01cd6767e1b5e0d11b2d468c4012a5efc",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/l/lcms2/liblcms2-2_2.14-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libpcre2-8-0",
        package_name = "libpcre2-8-0",
        sha256 = "f7e39d23b97e7c30a0294c810b3df6bf4e974e9555cdaf8c1dc274195443fc32",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/p/pcre2/libpcre2-8-0_10.42-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libpng16-16",
        package_name = "libpng16-16",
        sha256 = "d936268159447ccda49e12760c7a482ba763207a7e1a220fd224a56acbf653f0",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/libp/libpng1.6/libpng16-16_1.6.39-2_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libssl3",
        package_name = "libssl3",
        sha256 = "491387ed28243a502054099524d6ded03c2ce6e2ee08bf717b91c7a6b7f0be51",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/libssl3_3.0.9-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libstdcpp6",
        package_name = "libstdc++6",
        sha256 = "04dbe0085f54cc8383a79fa0e77e5dd380738b0f5a29b72d8d189acc43be86d9",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/g/gcc-12/libstdc++6_12.2.0-14_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_libuuid1",
        package_name = "libuuid1",
        sha256 = "dc15297161de52ebf14bf6e78632a777a34a2b5d580ba8238342543e377fb270",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/u/util-linux/libuuid1_2.38.1-5+b1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_netbase",
        package_name = "netbase",
        sha256 = "29b23c48c0fe6f878e56c5ddc9f65d1c05d729360f3690a593a8c795031cd867",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/n/netbase/netbase_6.4_all.deb"],
    )
    debian_archive(
        name = "s390x_debian12_openjdk-17-jdk-headless",
        package_name = "openjdk-17-jdk-headless",
        sha256 = "c3eb93a46086df93f1d09c3461ae250af326f3b837c894919eff33e60db46f04",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.8+7-1~deb12u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_openjdk-17-jre-headless",
        package_name = "openjdk-17-jre-headless",
        sha256 = "6f0e1f8d772c0a8575339c5f239c2896c41c1426f204455c3c18b0a42b987ce3",
        urls = ["https://snapshot.debian.org/archive/debian-security/20230818T190531Z/pool/updates/main/o/openjdk-17/openjdk-17-jre-headless_17.0.8+7-1~deb12u1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_openssl",
        package_name = "openssl",
        sha256 = "a3792072f13bda094278159f6e2ccb4c872314b0aec787a9e2bd4260ef8293c4",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/o/openssl/openssl_3.0.9-1_s390x.deb"],
    )
    debian_archive(
        name = "s390x_debian12_tzdata",
        package_name = "tzdata",
        sha256 = "825efb56b6b9f7ca816074d7c2f6118894f455e64839d85eb1de53f4a610991e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/t/tzdata/tzdata_2023c-5_all.deb"],
    )
    debian_archive(
        name = "s390x_debian12_zlib1g",
        package_name = "zlib1g",
        sha256 = "aaa18b6281d1e5a5ba82bdb951d1b0fed43829f52a285f351dc5352880e3ef7e",
        urls = ["https://snapshot.debian.org/archive/debian/20230816T213052Z/pool/main/z/zlib/zlib1g_1.2.13.dfsg-1_s390x.deb"],
    )
