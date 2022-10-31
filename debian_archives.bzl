# AUTO GENERATED
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def repositories():
    http_file(
        name = "amd64_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u5_amd64.deb",
        sha256 = "49dd2535afe494e00e64e9ee82131d0c5a5d0644207c65c04a9a891fbdad4a0e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/base-files/base-files_11.1+deb11u5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "amd64_debian11_dash",
        downloaded_file_path = "dash_0.5.11+git20200708+dd9ef66-5_amd64.deb",
        sha256 = "0a4cc532fbf2c78cb4090a659fb73560981e626849532e6186f3a3ac6a45b3bc",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_amd64.deb",
        sha256 = "65ca7d8b03e9dac09c5d544a89dd52d1aeb74f6a19583d32e4ff5f0c77624c24",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.8-4_amd64.deb",
        sha256 = "16e27c3ebd97981e70db3733f899963362748f178a62644df69d1f247e741379",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u5_amd64.deb",
        sha256 = "92a19a31dd2ed0c1881bee02a8b3d026cb971ec916d5ef6332f9dd378798f06a",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u5_amd64.deb",
        sha256 = "adf6994e4c000ff5b882db411a23925a5860a10146e27fa08fc08cb4d08e6d85",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc6_2.31-13+deb11u5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcom-err2",
        downloaded_file_path = "libcom-err2_1.46.2-2_amd64.deb",
        sha256 = "d478f132871f4ab8352d39becf936d0ad74db905398bf98465d8fe3da6fb1126",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcrypt1",
        downloaded_file_path = "libcrypt1_4.4.18-4_amd64.deb",
        sha256 = "f617952df0c57b4ee039448e3941bccd3f97bfff71e9b0f87ca6dae15cb3f5ef",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.8_amd64.deb",
        sha256 = "00b9e63e287f45300d4a4f59b6b88e25918443c932ae3e5845d5761ae193c530",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.8_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u5_amd64.deb",
        sha256 = "5744040c4735bcdd51238aebfa3e402b857244897f1007f61154982ebe5abbd7",
        urls = ["https://snapshot.debian.org/archive/debian-security/20221031T080605Z/pool/updates/main/e/expat/libexpat1_2.2.10-2+deb11u5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libffi7",
        downloaded_file_path = "libffi7_3.3-6_amd64.deb",
        sha256 = "30ca89bfddae5fa6e0a2a044f22b6e50cd17c4bc6bc850c579819aeab7101f0f",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libf/libffi/libffi7_3.3-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_amd64.deb",
        sha256 = "b92861827627a76e74d6f447a5577d039ef2f95da18af1f29aa98fb96baea4c1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_amd64.deb",
        sha256 = "b21cfdd12adf6cac4af320c2485fb62a8a5edc6f9768bc2288fd686f4fa6dfdf",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_amd64.deb",
        sha256 = "e478f2709d8474165bb664de42e16950c391f30eaa55bc9b3573281d83a29daf",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libglib2.0-0",
        downloaded_file_path = "libglib2.0-0_2.66.8-1_amd64.deb",
        sha256 = "995469490dcc8f667df8051a39dd5abd7149d849456c28af4e58cbfd6d6dc4f8",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_amd64.deb",
        sha256 = "4530c95aefa48e33fd8cf4acbe5c4b559dbe7bdf4c56469986c83a203982cef1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgraphite2-3",
        downloaded_file_path = "libgraphite2-3_1.3.14-1_amd64.deb",
        sha256 = "31113b9e20c89d3b923da0540d6f30535b8d14f32e5904de89e34537fa87d59a",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgssapi-krb5-2",
        downloaded_file_path = "libgssapi-krb5-2_1.18.3-6+deb11u2_amd64.deb",
        sha256 = "228780bcccf07a27decdb09db5dc166a4817f9c8056546723b175aadc632c63a",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libharfbuzz0b",
        downloaded_file_path = "libharfbuzz0b_2.7.4-1_amd64.deb",
        sha256 = "c76825341b5877240ff2511a376844a50ffda19d9d019ae65a5b3a97f9a1a183",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_amd64.deb",
        sha256 = "28de780a1605cf501c3a4ebf3e588f5110e814b208548748ab064100c32202ea",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libk5crypto3",
        downloaded_file_path = "libk5crypto3_1.18.3-6+deb11u2_amd64.deb",
        sha256 = "75dff43e5e685bb9e7dfcf76c72e82114631559898379a0c97362264625e17ec",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkeyutils1",
        downloaded_file_path = "libkeyutils1_1.6.1-2_amd64.deb",
        sha256 = "f01060b434d8cad3c58d5811d2082389f11b3db8152657d6c22c1d298953f2a5",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkrb5-3",
        downloaded_file_path = "libkrb5-3_1.18.3-6+deb11u2_amd64.deb",
        sha256 = "31a8a35297bcd3503892c283fe1ba237024c04002cfc5529454d0fe1dadc589a",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkrb5support0",
        downloaded_file_path = "libkrb5support0_1.18.3-6+deb11u2_amd64.deb",
        sha256 = "6be76ba2573851a8223a799ee9eb34f03a686ef449bf95aadc9739ecbdf7b355",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_liblcms2-2",
        downloaded_file_path = "liblcms2-2_2.12~rc1-2_amd64.deb",
        sha256 = "0608ecb6ed258814e390b52b3fb50f2a6d3239b5ecb1086292ae08be00a67b0f",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_liblzma5",
        downloaded_file_path = "liblzma5_5.2.5-2.1~deb11u1_amd64.deb",
        sha256 = "1c79a02415ca5ee7234ac60502fb33ee94fa70b02d1c329a6a14178f8329c435",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/x/xz-utils/liblzma5_5.2.5-2.1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libmpdec3",
        downloaded_file_path = "libmpdec3_2.5.1-1_amd64.deb",
        sha256 = "816404866f754d5662d69db50072018dccb78cf372fc38e0be961fab0f57d741",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libncursesw6",
        downloaded_file_path = "libncursesw6_6.2+20201114-2_amd64.deb",
        sha256 = "ee3cd315dfa18865cf888ba6813a552077a4f3d1439dd225e4a0d0fee53aadc2",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libnsl2",
        downloaded_file_path = "libnsl2_1.3.0-2_amd64.deb",
        sha256 = "c0d83437fdb016cb289436f49f28a36be44b3e8f1f2498c7e3a095f709c0d6f8",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_amd64.deb",
        sha256 = "48efcf2348967c211cd9408539edf7ec3fa9d800b33041f6511ccaecc1ffa9d0",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/pcre3/libpcre3_8.39-13_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_amd64.deb",
        sha256 = "7d5336af395d1f658d0e66d74d0e1f4c632028750e7e04314d1a650e0317f3d6",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3.9-minimal",
        downloaded_file_path = "libpython3.9-minimal_3.9.2-1_amd64.deb",
        sha256 = "594283526d67e03e3c4e96534f6bfe5da1bf41da5d49360553c9b79fbf08c4ab",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3.9-stdlib",
        downloaded_file_path = "libpython3.9-stdlib_3.9.2-1_amd64.deb",
        sha256 = "32ac64d959ac2dbc5bb289532fc9834dab8f671b5455695a3a9315aad973c65b",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libreadline8",
        downloaded_file_path = "libreadline8_8.1-1_amd64.deb",
        sha256 = "162ba9fdcde81b5502953ed4d84b24e8ad4e380bbd02990ab1a0e3edffca3c22",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/r/readline/libreadline8_8.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.34.1-3_amd64.deb",
        sha256 = "a0b8d3acf4a0483048637637d269be93af48d5c16f6f139f53edd13384ad4686",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_amd64.deb",
        sha256 = "c3480bf90725c993187de02e5144e90ea81226e7e2538ba24687f5a0adc8ca5c",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_amd64.deb",
        sha256 = "5c155c58935870bf3b4bfe769116841c0d286a74f59eccfd5645693ac23f06b1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libtinfo6",
        downloaded_file_path = "libtinfo6_6.2+20201114-2_amd64.deb",
        sha256 = "aeaf942c71ecc0ed081efdead1a1de304dcd513a9fc06791f26992e76986597b",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/ncurses/libtinfo6_6.2+20201114-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libtirpc3",
        downloaded_file_path = "libtirpc3_1.3.1-1+deb11u1_amd64.deb",
        sha256 = "86b216d59b6efcd07d56d14b8f4281d5c47f24e9c962f46bbaf02fce762c5e6a",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libt/libtirpc/libtirpc3_1.3.1-1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libuuid1",
        downloaded_file_path = "libuuid1_2.36.1-8+deb11u1_amd64.deb",
        sha256 = "31250af4dd3b7d1519326a9a6764d1466a93d8f498cf6545058761ebc38b2823",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "amd64_debian11_openjdk-11-jdk-headless",
        downloaded_file_path = "openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_amd64.deb",
        sha256 = "79d86d53db7cf6dabe64c2ea867dc248af3b6657a750dbb5a6fefda22794ad92",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openjdk-11-jre-headless",
        downloaded_file_path = "openjdk-11-jre-headless_11.0.16+8-1~deb11u1_amd64.deb",
        sha256 = "8313d235ce8d6df19d4a586d4119ae5866520494df6ea20bf27926fd74b31471",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-11/openjdk-11-jre-headless_11.0.16+8-1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openjdk-17-jdk-headless",
        downloaded_file_path = "openjdk-17-jdk-headless_17.0.4+8-1~deb11u1_amd64.deb",
        sha256 = "bf92c4e5f612191eefd9a67c5838696f171adb85a36d86b7189578752c9294d8",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.4+8-1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openjdk-17-jre-headless",
        downloaded_file_path = "openjdk-17-jre-headless_17.0.4+8-1~deb11u1_amd64.deb",
        sha256 = "55cb9edf04124a6308ef8f480964950d7cc6f8ade002fe71c16c39c92fef6d4e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.4+8-1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_amd64.deb",
        sha256 = "3691cf432febeb8dd621c6a36e3cc66b45fc119016532ffb33c742861aec868b",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_python3-distutils",
        downloaded_file_path = "python3-distutils_3.9.2-1_all.deb",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_python3.9-minimal",
        downloaded_file_path = "python3.9-minimal_3.9.2-1_amd64.deb",
        sha256 = "5d6003c5c20223a2547ac4976e09a9ec778dbe351507a6292bef3b60df5f4aa7",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u7_all.deb",
        sha256 = "77dd83992ad98576e7a174b35a26d1a6631115d1946a3fd60a94803546047ff1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u7_all.deb"],
    )
    http_file(
        name = "amd64_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u2_amd64.deb",
        sha256 = "03d2ab2174af76df6f517b854b77460fbdafc3dac0dca979317da67538159a3e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_amd64.deb"],
    )
    http_file(
        name = "arm_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u5_armhf.deb",
        sha256 = "1f4eff0435abb1b103fbc7abd26d6d47a19fc68b6000ed0f42cfff968d0a4c17",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/base-files/base-files_11.1+deb11u5_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "arm_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u5_armhf.deb",
        sha256 = "8ad7d41a14c934e65df4505aed1dee42bdacc9ac68981e2d66dad7f1a8792178",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u5_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u5_armhf.deb",
        sha256 = "3b1253ae82414527373b84fa34584cb5223bafbc0ab27fb713c539bbae4ee39e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc6_2.31-13+deb11u5_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_armhf.deb",
        sha256 = "4cfff89c7f492090c5988298f9f9419d3464d294c43883800a2ed55676581d26",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_armhf.deb",
        sha256 = "c046673580eef1ef3b2778c37c8baccbb5510195e8008f789b8309b38345abc0",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_armhf.deb",
        sha256 = "5b7b4564c99a450e75a299d8d554eb8fe8fc3f8561073d93317c38c36c1d195c",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_armhf.deb",
        sha256 = "879258df2ac36d9733df014c5a5443944e1a5c4ba9a7eebe5dd28547b4ebb541",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "arm_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_armhf.deb",
        sha256 = "780a64b4e26ca70538898ef3e0ed43bb02271d3b82c9b6906e8ba77157cb9761",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u7_all.deb",
        sha256 = "77dd83992ad98576e7a174b35a26d1a6631115d1946a3fd60a94803546047ff1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u7_all.deb"],
    )
    http_file(
        name = "arm64_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u5_arm64.deb",
        sha256 = "b186dd274ab656eb0ca2a94d6af5c104ce7a4ed0142608656204c9cd453a1338",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/base-files/base-files_11.1+deb11u5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "arm64_debian11_dash",
        downloaded_file_path = "dash_0.5.11+git20200708+dd9ef66-5_arm64.deb",
        sha256 = "542980a48d96c1124a9664cae06dbb8b813417daa1de1b6ed4cb49e0766da932",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_arm64.deb",
        sha256 = "52ca7f90de6cb6576a0a5cf5712fc4ae7344b79c44b8a1548087fd5d92bf1f64",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.8-4_arm64.deb",
        sha256 = "da340e8470e96445c56966f74e48a9a91dee0fa5c89876e88a4575cc17d17a97",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u5_arm64.deb",
        sha256 = "8a691cca6e8a841bd9d9a95ccb21222c2feb6c9b996fc3776f8f1a3bffc0f004",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u5_arm64.deb",
        sha256 = "6f32b8a6bf691b2fa63ba9a4eddba9a29f34c209fd7a64df86585d2b58c567f8",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc6_2.31-13+deb11u5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcom-err2",
        downloaded_file_path = "libcom-err2_1.46.2-2_arm64.deb",
        sha256 = "fc95d415c35f5b687871f660a5bf66963fd117daa490110499119411e2d6145e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcrypt1",
        downloaded_file_path = "libcrypt1_4.4.18-4_arm64.deb",
        sha256 = "22b586b29e840dabebf0bf227d233376628b87954915d064bc142ae85d1b7979",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.8_arm64.deb",
        sha256 = "cf9aa3eae9cfc4c84f93e32f3d11e2707146e4d9707712909e3c61530b50353e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.8_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u5_arm64.deb",
        sha256 = "8d20bfd061845bda0321d01accd6f8386ead5b1d7250a585d12b8d5fb1408ffa",
        urls = ["https://snapshot.debian.org/archive/debian-security/20221031T080605Z/pool/updates/main/e/expat/libexpat1_2.2.10-2+deb11u5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libffi7",
        downloaded_file_path = "libffi7_3.3-6_arm64.deb",
        sha256 = "eb748e33ae4ed46f5a4c14b7a2a09792569f2029ede319d0979c373829ba1532",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libf/libffi/libffi7_3.3-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_arm64.deb",
        sha256 = "18b13ef8a46e9d79ba6a6ba2db0c86e42583277b5d47f6942f3223e349c22641",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_arm64.deb",
        sha256 = "b25f1c148498dd2b49dc30da0a2b2537a7bd0cb34afb8ea681dd145053c9a3f8",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_arm64.deb",
        sha256 = "e2fcdb378d3c1ad1bcb64d4fb6b37aab44011152beca12a4944f435a2582df1f",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libglib2.0-0",
        downloaded_file_path = "libglib2.0-0_2.66.8-1_arm64.deb",
        sha256 = "667d1b891bcf9b8cc47385c19b39271c74f48fd2b6b457474184f85ce63ea261",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_arm64.deb",
        sha256 = "813af2e0b8ba0a7cea18c988cd843412ef6d0415700fc860d62816750e741670",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgraphite2-3",
        downloaded_file_path = "libgraphite2-3_1.3.14-1_arm64.deb",
        sha256 = "473362a74ba74ae630fc43675460fb5a1058564a635a301875e00f1c6f9b27cb",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgssapi-krb5-2",
        downloaded_file_path = "libgssapi-krb5-2_1.18.3-6+deb11u2_arm64.deb",
        sha256 = "b4eddfa2fbac0b9aa8d1d2479d4205ab1f30d80b05ab9e7beb8959f1a22a4ec9",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libharfbuzz0b",
        downloaded_file_path = "libharfbuzz0b_2.7.4-1_arm64.deb",
        sha256 = "d9f0345391cc661503d1508ccd318b3db48add354e706cf9d66fa16bf99e2d03",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_arm64.deb",
        sha256 = "8903394de23dc6ead5abfc80972c8fd44300c9903ad4589d0df926e71977d881",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libk5crypto3",
        downloaded_file_path = "libk5crypto3_1.18.3-6+deb11u2_arm64.deb",
        sha256 = "f56cf45a98f890c5ea95dc5c0e9909855dc017718d33b482e5a5fc255da6b03d",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkeyutils1",
        downloaded_file_path = "libkeyutils1_1.6.1-2_arm64.deb",
        sha256 = "7101c2380ab47a3627a6fa076a149ab71078263064f936fccbd43efbaed4a2da",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkrb5-3",
        downloaded_file_path = "libkrb5-3_1.18.3-6+deb11u2_arm64.deb",
        sha256 = "7954c0dbe7463ffdb9dd701ca3b96702a78394f239496c099d4cd8ed9150e2a9",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkrb5support0",
        downloaded_file_path = "libkrb5support0_1.18.3-6+deb11u2_arm64.deb",
        sha256 = "af4a786e6cdb4ed46040dcb1c00e08cb0de7f421708d3399026598357a35f588",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_liblcms2-2",
        downloaded_file_path = "liblcms2-2_2.12~rc1-2_arm64.deb",
        sha256 = "6d92ee1f0d427b88ab9bff32c769b61e2597c8fb289589ca0731a7e77d490d6e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_liblzma5",
        downloaded_file_path = "liblzma5_5.2.5-2.1~deb11u1_arm64.deb",
        sha256 = "d865bba41952c707b3fa3ae8cab4d4bd337ee92991d2aead66c925bf7cc48846",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/x/xz-utils/liblzma5_5.2.5-2.1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libmpdec3",
        downloaded_file_path = "libmpdec3_2.5.1-1_arm64.deb",
        sha256 = "171e2581970f36a39f65d1ca3c761e76b103844daae7903fcc07f7c3822a05bb",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libncursesw6",
        downloaded_file_path = "libncursesw6_6.2+20201114-2_arm64.deb",
        sha256 = "4ff84101deab5af44f91df40a8220995a501c0f875f70ede51ce8c7dce7c475c",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libnsl2",
        downloaded_file_path = "libnsl2_1.3.0-2_arm64.deb",
        sha256 = "8f9ba58b219779b43c4ccc78c79b0a23f721fc96323c202abb31e02f942104b3",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_arm64.deb",
        sha256 = "21cac4064a41dbc354295c437f37bf623f9004513a97a6fa030248566aa986e9",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/pcre3/libpcre3_8.39-13_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_arm64.deb",
        sha256 = "f5f61274aa5f71b9e44b077bd7b9fa9cd5ff71d8b8295f47dc1b2d45378aa73e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3.9-minimal",
        downloaded_file_path = "libpython3.9-minimal_3.9.2-1_arm64.deb",
        sha256 = "b49736ab0e8b8577f97a474ca67e20c1c025f9d7394ec8d7820de6314c903cf9",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3.9-stdlib",
        downloaded_file_path = "libpython3.9-stdlib_3.9.2-1_arm64.deb",
        sha256 = "3b3612dcd7550f01ec3517fbe955838223f4cf115b6983e4ed6d7320cd4b05c4",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libreadline8",
        downloaded_file_path = "libreadline8_8.1-1_arm64.deb",
        sha256 = "500c3cdc00dcaea2c4ed736e00bfcb6cb43c3415e808566c5dfa266dbfc0c5e5",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/r/readline/libreadline8_8.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.34.1-3_arm64.deb",
        sha256 = "1e33cd39dc4fff2a7edd7bb7e90a71e20fb528f6a581fe0287652e4dae77e0d0",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_arm64.deb",
        sha256 = "8d4ef5a06719fabd90a6a27729ade7b9dde1a1c923a89ba1406af6489fa7c82f",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_arm64.deb",
        sha256 = "7869aa540cc46e9f3d4267d5bde2af0e5b429a820c1d6f1a4cfccfe788c31890",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libtinfo6",
        downloaded_file_path = "libtinfo6_6.2+20201114-2_arm64.deb",
        sha256 = "21c0c33e00d091d0f326a083a77531270b8c56468500f0948d149f3e20b95385",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/ncurses/libtinfo6_6.2+20201114-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libtirpc3",
        downloaded_file_path = "libtirpc3_1.3.1-1+deb11u1_arm64.deb",
        sha256 = "ccff0927f55b97fe9ea13057fab8bff9920bf4628eb2d5d48b9656f2fb74d2e1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libt/libtirpc/libtirpc3_1.3.1-1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libuuid1",
        downloaded_file_path = "libuuid1_2.36.1-8+deb11u1_arm64.deb",
        sha256 = "3d677da6a22e9cac519fed5a2ed5b20a4217f51ca420fce57434b5e813c26e03",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "arm64_debian11_openjdk-11-jdk-headless",
        downloaded_file_path = "openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_arm64.deb",
        sha256 = "8c2f0817cdd92a203b25e95164789c9e13a5efc6f222fcf604c7e929ab18b36c",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openjdk-11-jre-headless",
        downloaded_file_path = "openjdk-11-jre-headless_11.0.16+8-1~deb11u1_arm64.deb",
        sha256 = "790b763a30a1b1f508b7abe0c765bc09728a7529de9c390b9cee7b899c920222",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-11/openjdk-11-jre-headless_11.0.16+8-1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openjdk-17-jdk-headless",
        downloaded_file_path = "openjdk-17-jdk-headless_17.0.4+8-1~deb11u1_arm64.deb",
        sha256 = "690971eb245c578ddf33d6215c3d5d5bed4e4ab375d640e55e7bfef50ca7c88d",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.4+8-1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openjdk-17-jre-headless",
        downloaded_file_path = "openjdk-17-jre-headless_17.0.4+8-1~deb11u1_arm64.deb",
        sha256 = "ca1d8dca1241d6caa270b1394854673ad8d0e2c72f87fe1e42664cd398d4e21f",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.4+8-1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_arm64.deb",
        sha256 = "ff9a7649fa24c5d1fa5ddcbd4c4e9fd5facb205ddc7b796f61de1107dabb00fd",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_python3-distutils",
        downloaded_file_path = "python3-distutils_3.9.2-1_all.deb",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_python3.9-minimal",
        downloaded_file_path = "python3.9-minimal_3.9.2-1_arm64.deb",
        sha256 = "bc0d0ed39ebc066020c3a16afdab4fd3e0260b41ae799273531d5b2403ae7b27",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u7_all.deb",
        sha256 = "77dd83992ad98576e7a174b35a26d1a6631115d1946a3fd60a94803546047ff1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u7_all.deb"],
    )
    http_file(
        name = "arm64_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u2_arm64.deb",
        sha256 = "e3963985d1a020d67ffd4180e6f9c4b5c600b515f0c9d8fda513d7a0e48e63a1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_arm64.deb"],
    )
    http_file(
        name = "ppc64le_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u5_ppc64el.deb",
        sha256 = "d348edda55ab8b6a180af231a35e098b43af1d641f5ceb5d074d1d48d183746c",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/base-files/base-files_11.1+deb11u5_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_ppc64el.deb",
        sha256 = "a7a7099df1c6ab6c3472731d88892e83f0077b2d3ec1414ff8f1c311a55a9f92",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u5_ppc64el.deb",
        sha256 = "20cf6c99d17883e372f2bd49ad34ef9c1819dab6b7ec314cb79d6ae550d9fe13",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u5_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u5_ppc64el.deb",
        sha256 = "0e5ab08c9de81e6cac721f6a7bf9c9db44dfed128957434e24bac677c2eafb6c",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc6_2.31-13+deb11u5_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libcrypt1",
        downloaded_file_path = "libcrypt1_4.4.18-4_ppc64el.deb",
        sha256 = "0087ad3e3d01968c3fb354f77b46966e4ca79246a08caca9257695095befcf05",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u5_ppc64el.deb",
        sha256 = "cbf5268366667e541654f4b7290c2baa5329aee2f25b18bea520f69063fc9474",
        urls = ["https://snapshot.debian.org/archive/debian-security/20221031T080605Z/pool/updates/main/e/expat/libexpat1_2.2.10-2+deb11u5_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_ppc64el.deb",
        sha256 = "a4eed4b8c8cefe48e0567a0c098a7bf9fc6aab4093a9dd2e75fbdfa2d1ef7aa8",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_ppc64el.deb",
        sha256 = "6ca7c822898cf4664023a614af17bb139647ff9fa6e56546f1504c5f1d6ca76f",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_ppc64el.deb",
        sha256 = "8b612f798430a6dd8b8b5e8f712b7ea92329201c6a438a9d176e9e285f1c14d5",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libglib2.0-0",
        downloaded_file_path = "libglib2.0-0_2.66.8-1_ppc64el.deb",
        sha256 = "c31d5cac3c9b6d861b62a5f9972f1351355d57a622d1669fa410457c912ab905",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_ppc64el.deb",
        sha256 = "f4b1f093072bf65694a98432d108e5c62756c147f5e92e657021428dc602b9f4",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libgraphite2-3",
        downloaded_file_path = "libgraphite2-3_1.3.14-1_ppc64el.deb",
        sha256 = "6998cf0f9dd4c0d09ce0521e26ed967f596fc1e8b394edbc49fc0cd4a969a3d2",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libharfbuzz0b",
        downloaded_file_path = "libharfbuzz0b_2.7.4-1_ppc64el.deb",
        sha256 = "eceadc98a48d3950cd69be4648ef134b76a224415a6fad9193407860604d6a9b",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_ppc64el.deb",
        sha256 = "7c198ae4e27ddb57d53ee68bf2846b3dc88d33b9948d5f2903ee9e69312848b9",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_liblcms2-2",
        downloaded_file_path = "liblcms2-2_2.12~rc1-2_ppc64el.deb",
        sha256 = "e4b32374b944aae5c4ab9e3742a68ad978faae9403c2685c5e44c7aa4d6e0123",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_ppc64el.deb",
        sha256 = "c24f9bb2b39d2fb9750a52a9ba512754079062c92be5f51b204689117c11868a",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/pcre3/libpcre3_8.39-13_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_ppc64el.deb",
        sha256 = "ea4e1daaeab93a09f9fc943a852099c89d69da0c9606d0f4419ae0c5d4b5c10d",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_ppc64el.deb",
        sha256 = "37b79758310e91ff2a634bd0d41730c6ac377054470ba4f0f0e809fac94008aa",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_ppc64el.deb",
        sha256 = "cda71acea3aba81ccb555f7b2355a6a3944b0f09049945a351d8e7682058daa9",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libuuid1",
        downloaded_file_path = "libuuid1_2.36.1-8+deb11u1_ppc64el.deb",
        sha256 = "8c5a094cf457ffedcd3c401f8aef735a4e9a405cd07208ec6c8e57441f650bdf",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openjdk-11-jdk-headless",
        downloaded_file_path = "openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_ppc64el.deb",
        sha256 = "4f3322ddcb02ee4f0618aad88490a09da17a2324ed1b2ee0628ef6e18282de46",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openjdk-11-jre-headless",
        downloaded_file_path = "openjdk-11-jre-headless_11.0.16+8-1~deb11u1_ppc64el.deb",
        sha256 = "236ec1d4db30db54d36c34a44229d19297babcdfb94f805acf62a3748b0ea489",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-11/openjdk-11-jre-headless_11.0.16+8-1~deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openjdk-17-jdk-headless",
        downloaded_file_path = "openjdk-17-jdk-headless_17.0.4+8-1~deb11u1_ppc64el.deb",
        sha256 = "98935e163bf5f83c4c4be507f08383d36fc1f44c2ef16a08f9ceeab528a686ab",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.4+8-1~deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openjdk-17-jre-headless",
        downloaded_file_path = "openjdk-17-jre-headless_17.0.4+8-1~deb11u1_ppc64el.deb",
        sha256 = "0e36bb8158d72816863fd6ad6a9f523d4781d34b0f941bd0d7ef46ff7e152762",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.4+8-1~deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_ppc64el.deb",
        sha256 = "36165f48b57041a49ce4d9a8aff6c2927719db8f5c06d9ff7925010ced0576ed",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u7_all.deb",
        sha256 = "77dd83992ad98576e7a174b35a26d1a6631115d1946a3fd60a94803546047ff1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u7_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u2_ppc64el.deb",
        sha256 = "7724f4d01fd987e023cf55f1cfc964a495408f30c1dd1470b66f7a8d43a868da",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_ppc64el.deb"],
    )
    http_file(
        name = "s390x_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u5_s390x.deb",
        sha256 = "2f646f1c1eeeacbff31f14851225d38733e0672c14c7f8419c78190906dae11e",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/base-files/base-files_11.1+deb11u5_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "s390x_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "s390x_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "s390x_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_s390x.deb",
        sha256 = "3f2ebe4c83833f374f3aad7f3b6aa9cf68ca3511544b97a185ab5c126790ac5f",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u5_s390x.deb",
        sha256 = "f774b09c946a284c59acca729368dae234c88ba2659e49c0a6bfbcffd3642c6a",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u5_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u5_s390x.deb",
        sha256 = "1bb4a382bb309f5505a2ff2c76447599cdb78fdd2e32b3573b488f35a44e57f4",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glibc/libc6_2.31-13+deb11u5_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libcrypt1",
        downloaded_file_path = "libcrypt1_4.4.18-4_s390x.deb",
        sha256 = "dbab47c5dedde0c5dfc6f5c974e23bd4a48ebc48cb8a56e2cabded6fc52818b7",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u5_s390x.deb",
        sha256 = "f3358a35ea71f682052c56db8d6f26fa95326cf672301f80d07ee770b4aa8bb4",
        urls = ["https://snapshot.debian.org/archive/debian-security/20221031T080605Z/pool/updates/main/e/expat/libexpat1_2.2.10-2+deb11u5_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_s390x.deb",
        sha256 = "3890eb7a635164973f4205f75586a0a60a681328f730a9e0002af80e143cb036",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_s390x.deb",
        sha256 = "8aecea8b8a908817f4367b451e83c5f8dbb7cc8372dfaa7df80c9898d03cf550",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_s390x.deb",
        sha256 = "129b6403af3832426f470a30a3f01a71725eb38b7b7a93de4480f56ae5393e22",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libglib2.0-0",
        downloaded_file_path = "libglib2.0-0_2.66.8-1_s390x.deb",
        sha256 = "2166169b9c7d5a639bf8e5b018a7f48a240c36d404d1e2db8d4ce2acafc4b907",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_s390x.deb",
        sha256 = "d836fcc5ba63095ed15efefee912c83902c7213f40b6aece73455c9348d5e462",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libgraphite2-3",
        downloaded_file_path = "libgraphite2-3_1.3.14-1_s390x.deb",
        sha256 = "5d11b4ffb8f9559b77b3b6981f3c59df5a446a075b2bcc0f6184c0d9ba8c4b1c",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libharfbuzz0b",
        downloaded_file_path = "libharfbuzz0b_2.7.4-1_s390x.deb",
        sha256 = "a54b2558537d4758b51db666cba7e27c9dd83ad8b19f727a9eb2008576b2900c",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_s390x.deb",
        sha256 = "a75580859d0a161124bb1f3dd0ecb9f96786c18b5d39a02b57eb4cf7d7dd8653",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_liblcms2-2",
        downloaded_file_path = "liblcms2-2_2.12~rc1-2_s390x.deb",
        sha256 = "0de7a9428b71b6abcaa0cccf2bb37aa6800d58baf5ca5fc063c4827703614853",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_s390x.deb",
        sha256 = "ff08eb6d116b07affbed8cdd7c519caf2fc56beffef5dd7b6519eda670c1a7f7",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/p/pcre3/libpcre3_8.39-13_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_s390x.deb",
        sha256 = "34b92145dcf4a532dab76086ec30a636a58d31c635e7c6f9d4cb47dfc4704512",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_s390x.deb",
        sha256 = "34e3cae0b30acc3b4d2c57ebc55288506a72b737d8e54feb33e6efb452d0cad8",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_s390x.deb",
        sha256 = "d632c1fc45ab0ef8bc9c8cbbc9436dd82340bf0c1e44bd8b791662057ef05505",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libuuid1",
        downloaded_file_path = "libuuid1_2.36.1-8+deb11u1_s390x.deb",
        sha256 = "8df64efb47308f903f0b9835b697c84a2be133ffa9af0ac9d93414a2f6771fae",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "s390x_debian11_openjdk-11-jdk-headless",
        downloaded_file_path = "openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_s390x.deb",
        sha256 = "e3ded1b1aeb26134e4f0f64ffef7be519c2cb365e51bc5a27c742c5495923cb2",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_openjdk-11-jre-headless",
        downloaded_file_path = "openjdk-11-jre-headless_11.0.16+8-1~deb11u1_s390x.deb",
        sha256 = "488a42b9b62f2b881364d42505b18b8e4523dce658e29e5d34c76590f66ef6f2",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-11/openjdk-11-jre-headless_11.0.16+8-1~deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_openjdk-17-jdk-headless",
        downloaded_file_path = "openjdk-17-jdk-headless_17.0.4+8-1~deb11u1_s390x.deb",
        sha256 = "3995445aeffd7be0f89aa373b9f0ede976cddb68ce710f0f450a5bf699a6a0a3",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.4+8-1~deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_openjdk-17-jre-headless",
        downloaded_file_path = "openjdk-17-jre-headless_17.0.4+8-1~deb11u1_s390x.deb",
        sha256 = "397f362207d1428815187e7eef755066150b7c7cf8f56c53d497ba6c94622d47",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.4+8-1~deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_s390x.deb",
        sha256 = "b8ae06fe42b0dc3f3d796b6d8bf519a71496cd72a403da72e43c191bcf44841d",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u7_all.deb",
        sha256 = "77dd83992ad98576e7a174b35a26d1a6631115d1946a3fd60a94803546047ff1",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u7_all.deb"],
    )
    http_file(
        name = "s390x_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u2_s390x.deb",
        sha256 = "98bc525aa0b4bf5b36c1366c9c28701f35c6b9d2af1ddf16d3dc14e961691f24",
        urls = ["https://snapshot.debian.org/archive/debian/20221030T084935Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u2_s390x.deb"],
    )
