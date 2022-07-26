# AUTO GENERATED
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def repositories():
    http_file(
        name = "amd64_debian10_base-files",
        downloaded_file_path = "base-files_10.3+deb10u12_amd64.deb",
        sha256 = "287647524f9e42fcc8777c5a9cfc175c1362da48f7c4a58bdda7853de226cdc6",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_10.3+deb10u12_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_ca-certificates",
        downloaded_file_path = "ca-certificates_20200601~deb10u2_all.deb",
        sha256 = "a9e267a24088c793a9cf782455fd344db5fdced714f112a8857c5bfd07179387",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20200601~deb10u2_all.deb"],
    )
    http_file(
        name = "amd64_debian10_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.6-9.2~deb10u1_amd64.deb",
        sha256 = "238193cbaa71cc5365ef2aa5ad45de8521ac38dd54f4ab53bafa7de15046fa89",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/bzip2/libbz2-1.0_1.0.6-9.2~deb10u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libc-bin",
        downloaded_file_path = "libc-bin_2.28-10+deb10u1_amd64.deb",
        sha256 = "a7da2f4902811548fbf9b1111951cdb2c254f23824af99817f7c4da179cbc6df",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.28-10+deb10u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libc6",
        downloaded_file_path = "libc6_2.28-10+deb10u1_amd64.deb",
        sha256 = "0ee0f0bfcd7b59ffda1dbc76ef58fa79512913204f2a336206467bfbf45bc69f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.28-10+deb10u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.5_amd64.deb",
        sha256 = "c7f0e9a423840731362ee52d4344c0bcf84318fbc06dad4fefe0e61d9e7062bc",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libffi6",
        downloaded_file_path = "libffi6_3.2.1-9_amd64.deb",
        sha256 = "d4d748d897e8e53aa239ead23a18724a1a30085cc6ca41a8c31b3b1e1b3452f4",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libf/libffi/libffi6_3.2.1-9_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libgcc1",
        downloaded_file_path = "libgcc1_8.3.0-6_amd64.deb",
        sha256 = "b1bb7611f3372732889d502cb1d09fe572b5fbb5288a4a8b1ed0363fecc3555a",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgcc1_8.3.0-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libgomp1",
        downloaded_file_path = "libgomp1_8.3.0-6_amd64.deb",
        sha256 = "909fcd28491d7ebecf44ee2e8d0269b600271b0b6d236b19f2c0469cde162d21",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgomp1_8.3.0-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_liblzma5",
        downloaded_file_path = "liblzma5_5.2.4-1+deb10u1_amd64.deb",
        sha256 = "c054750abd5b2c5b2b023329d04e4a8b432df11cd4a64bf842478a4b60a8e140",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/x/xz-utils/liblzma5_5.2.4-1+deb10u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libreadline7",
        downloaded_file_path = "libreadline7_7.0-5_amd64.deb",
        sha256 = "01e99d68427722e64c603d45f00063c303b02afb53d85c8d1476deca70db64c6",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/libreadline7_7.0-5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.27.2-3+deb10u1_amd64.deb",
        sha256 = "19268b796e62f754400c67c69cb759220089cf10aaa5dfd72a84ab1a818caa08",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/s/sqlite3/libsqlite3-0_3.27.2-3+deb10u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb10u3_amd64.deb",
        sha256 = "92247c2c011ec4c01f5832a38de0ec1a9c2cfac5c6c5dc229e5a1ac81148854c",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb10u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_libstdcpp6",
        downloaded_file_path = "libstdc++6_8.3.0-6_amd64.deb",
        sha256 = "5cc70625329655ff9382580971d4616db8aa39af958b7c995ee84598f142a4ee",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libstdc++6_8.3.0-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_mime-support",
        downloaded_file_path = "mime-support_3.62_all.deb",
        sha256 = "776efd686af26fa26325450280e3305463b1faef75d82b383bb00da61893d8ca",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/m/mime-support/mime-support_3.62_all.deb"],
    )
    http_file(
        name = "amd64_debian10_netbase",
        downloaded_file_path = "netbase_5.6_all.deb",
        sha256 = "baf0872964df0ccb10e464b47d995acbba5a0d12a97afe2646d9a6bb97e8d79d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_5.6_all.deb"],
    )
    http_file(
        name = "amd64_debian10_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb10u3_amd64.deb",
        sha256 = "fc49ee3ce9e774ea9f243ea7b53a732ee1c86b5f746c0a686a24383fa20c5a58",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb10u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian10_readline-common",
        downloaded_file_path = "readline-common_7.0-5_all.deb",
        sha256 = "153d8a5ddb04044d10f877a8955d944612ec9035f4c73eec99d85a92c3816712",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/readline-common_7.0-5_all.deb"],
    )
    http_file(
        name = "amd64_debian10_tzdata",
        downloaded_file_path = "tzdata_2021a-0+deb10u5_all.deb",
        sha256 = "cd98ec676778c1612cffb6e3b16dece8597f4a72b2ca3258cbbbba733e850245",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-0+deb10u5_all.deb"],
    )
    http_file(
        name = "amd64_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u4_amd64.deb",
        sha256 = "430c8b87648137e775bfca1fc5715e63be67ebb80fb84ad81c61173f440f7b23",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_11.1+deb11u4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "amd64_debian11_dash",
        downloaded_file_path = "dash_0.5.11+git20200708+dd9ef66-5_amd64.deb",
        sha256 = "0a4cc532fbf2c78cb4090a659fb73560981e626849532e6186f3a3ac6a45b3bc",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_amd64.deb",
        sha256 = "65ca7d8b03e9dac09c5d544a89dd52d1aeb74f6a19583d32e4ff5f0c77624c24",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.8-4_amd64.deb",
        sha256 = "16e27c3ebd97981e70db3733f899963362748f178a62644df69d1f247e741379",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u3_amd64.deb",
        sha256 = "2b85212a300c614627c5c7bf519f6570dfdd23e8b1d059a6ed522038eb34e437",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u3_amd64.deb",
        sha256 = "2f029f16c32a7cf0403f8038c1cc8decc9d3a5fadffe087be0dfa2235bec2564",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.31-13+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcom-err2",
        downloaded_file_path = "libcom-err2_1.46.2-2_amd64.deb",
        sha256 = "d478f132871f4ab8352d39becf936d0ad74db905398bf98465d8fe3da6fb1126",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcrypt1",
        downloaded_file_path = "libcrypt1_4.4.18-4_amd64.deb",
        sha256 = "f617952df0c57b4ee039448e3941bccd3f97bfff71e9b0f87ca6dae15cb3f5ef",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.8_amd64.deb",
        sha256 = "00b9e63e287f45300d4a4f59b6b88e25918443c932ae3e5845d5761ae193c530",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.8_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u3_amd64.deb",
        sha256 = "e3069628af14657a2fb2cc597c35982bf71d392ccf4e70207c92b156a0e341f5",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libffi7",
        downloaded_file_path = "libffi7_3.3-6_amd64.deb",
        sha256 = "30ca89bfddae5fa6e0a2a044f22b6e50cd17c4bc6bc850c579819aeab7101f0f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libf/libffi/libffi7_3.3-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_amd64.deb",
        sha256 = "b92861827627a76e74d6f447a5577d039ef2f95da18af1f29aa98fb96baea4c1",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_amd64.deb",
        sha256 = "b21cfdd12adf6cac4af320c2485fb62a8a5edc6f9768bc2288fd686f4fa6dfdf",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_amd64.deb",
        sha256 = "e478f2709d8474165bb664de42e16950c391f30eaa55bc9b3573281d83a29daf",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libglib2.0-0",
        downloaded_file_path = "libglib2.0-0_2.66.8-1_amd64.deb",
        sha256 = "995469490dcc8f667df8051a39dd5abd7149d849456c28af4e58cbfd6d6dc4f8",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_amd64.deb",
        sha256 = "4530c95aefa48e33fd8cf4acbe5c4b559dbe7bdf4c56469986c83a203982cef1",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgraphite2-3",
        downloaded_file_path = "libgraphite2-3_1.3.14-1_amd64.deb",
        sha256 = "31113b9e20c89d3b923da0540d6f30535b8d14f32e5904de89e34537fa87d59a",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgssapi-krb5-2",
        downloaded_file_path = "libgssapi-krb5-2_1.18.3-6+deb11u1_amd64.deb",
        sha256 = "2ab853cbd0494c06fa694906c6eeea4df79720f461c76d080eb21a3e98f44115",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libharfbuzz0b",
        downloaded_file_path = "libharfbuzz0b_2.7.4-1_amd64.deb",
        sha256 = "c76825341b5877240ff2511a376844a50ffda19d9d019ae65a5b3a97f9a1a183",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_amd64.deb",
        sha256 = "28de780a1605cf501c3a4ebf3e588f5110e814b208548748ab064100c32202ea",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libk5crypto3",
        downloaded_file_path = "libk5crypto3_1.18.3-6+deb11u1_amd64.deb",
        sha256 = "4a010fc69322b6be9e141a76593f46e6588c968ee3b7cf79a3b8b7efda9aeeba",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkeyutils1",
        downloaded_file_path = "libkeyutils1_1.6.1-2_amd64.deb",
        sha256 = "f01060b434d8cad3c58d5811d2082389f11b3db8152657d6c22c1d298953f2a5",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkrb5-3",
        downloaded_file_path = "libkrb5-3_1.18.3-6+deb11u1_amd64.deb",
        sha256 = "afb9dced3fcbdbc439a166eaa217dbfd485585842f12ce4587123009618e8bfe",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkrb5support0",
        downloaded_file_path = "libkrb5support0_1.18.3-6+deb11u1_amd64.deb",
        sha256 = "1f19908dbd37bd2ba9b3b3c9eb6ab8bee9a72f72745e6887f5366bb5fece654b",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_liblcms2-2",
        downloaded_file_path = "liblcms2-2_2.12~rc1-2_amd64.deb",
        sha256 = "0608ecb6ed258814e390b52b3fb50f2a6d3239b5ecb1086292ae08be00a67b0f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_liblzma5",
        downloaded_file_path = "liblzma5_5.2.5-2.1~deb11u1_amd64.deb",
        sha256 = "1c79a02415ca5ee7234ac60502fb33ee94fa70b02d1c329a6a14178f8329c435",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/x/xz-utils/liblzma5_5.2.5-2.1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libmpdec3",
        downloaded_file_path = "libmpdec3_2.5.1-1_amd64.deb",
        sha256 = "816404866f754d5662d69db50072018dccb78cf372fc38e0be961fab0f57d741",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libncursesw6",
        downloaded_file_path = "libncursesw6_6.2+20201114-2_amd64.deb",
        sha256 = "ee3cd315dfa18865cf888ba6813a552077a4f3d1439dd225e4a0d0fee53aadc2",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libnsl2",
        downloaded_file_path = "libnsl2_1.3.0-2_amd64.deb",
        sha256 = "c0d83437fdb016cb289436f49f28a36be44b3e8f1f2498c7e3a095f709c0d6f8",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_amd64.deb",
        sha256 = "48efcf2348967c211cd9408539edf7ec3fa9d800b33041f6511ccaecc1ffa9d0",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/pcre3/libpcre3_8.39-13_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_amd64.deb",
        sha256 = "7d5336af395d1f658d0e66d74d0e1f4c632028750e7e04314d1a650e0317f3d6",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3.9-minimal",
        downloaded_file_path = "libpython3.9-minimal_3.9.2-1_amd64.deb",
        sha256 = "594283526d67e03e3c4e96534f6bfe5da1bf41da5d49360553c9b79fbf08c4ab",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libpython3.9-stdlib",
        downloaded_file_path = "libpython3.9-stdlib_3.9.2-1_amd64.deb",
        sha256 = "32ac64d959ac2dbc5bb289532fc9834dab8f671b5455695a3a9315aad973c65b",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libreadline8",
        downloaded_file_path = "libreadline8_8.1-1_amd64.deb",
        sha256 = "162ba9fdcde81b5502953ed4d84b24e8ad4e380bbd02990ab1a0e3edffca3c22",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/libreadline8_8.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.34.1-3_amd64.deb",
        sha256 = "a0b8d3acf4a0483048637637d269be93af48d5c16f6f139f53edd13384ad4686",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_amd64.deb",
        sha256 = "c3480bf90725c993187de02e5144e90ea81226e7e2538ba24687f5a0adc8ca5c",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_amd64.deb",
        sha256 = "5c155c58935870bf3b4bfe769116841c0d286a74f59eccfd5645693ac23f06b1",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libtinfo6",
        downloaded_file_path = "libtinfo6_6.2+20201114-2_amd64.deb",
        sha256 = "aeaf942c71ecc0ed081efdead1a1de304dcd513a9fc06791f26992e76986597b",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/ncurses/libtinfo6_6.2+20201114-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libtirpc3",
        downloaded_file_path = "libtirpc3_1.3.1-1_amd64.deb",
        sha256 = "c5d032254fa0af1a752b09246e4cb97b1866022786f225081122c5eb420d48da",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libt/libtirpc/libtirpc3_1.3.1-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libuuid1",
        downloaded_file_path = "libuuid1_2.36.1-8+deb11u1_amd64.deb",
        sha256 = "31250af4dd3b7d1519326a9a6764d1466a93d8f498cf6545058761ebc38b2823",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "amd64_debian11_openjdk-11-jdk-headless",
        downloaded_file_path = "openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_amd64.deb",
        sha256 = "79d86d53db7cf6dabe64c2ea867dc248af3b6657a750dbb5a6fefda22794ad92",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openjdk-11-jre-headless",
        downloaded_file_path = "openjdk-11-jre-headless_11.0.16+8-1~deb11u1_amd64.deb",
        sha256 = "8313d235ce8d6df19d4a586d4119ae5866520494df6ea20bf27926fd74b31471",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.16+8-1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openjdk-17-jdk-headless",
        downloaded_file_path = "openjdk-17-jdk-headless_17.0.3+7-1~deb11u1_amd64.deb",
        sha256 = "bc27979aeac2e9ee7ca0b846bd5a28cd2d179da4f0b4e929af175dfc0ab99364",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.3+7-1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openjdk-17-jre-headless",
        downloaded_file_path = "openjdk-17-jre-headless_17.0.3+7-1~deb11u1_amd64.deb",
        sha256 = "acd9f47e32b66cec23a6abc060719e11626efe712f3aa7f4bec2b68ef2168605",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.3+7-1~deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_amd64.deb",
        sha256 = "3691cf432febeb8dd621c6a36e3cc66b45fc119016532ffb33c742861aec868b",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_python3-distutils",
        downloaded_file_path = "python3-distutils_3.9.2-1_all.deb",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    http_file(
        name = "amd64_debian11_python3.9-minimal",
        downloaded_file_path = "python3.9-minimal_3.9.2-1_amd64.deb",
        sha256 = "5d6003c5c20223a2547ac4976e09a9ec778dbe351507a6292bef3b60df5f4aa7",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u4_all.deb",
        sha256 = "fbd924ad16be1933ee07f505e2fe5a98df8c143eacecbd6f830ce4e25d93ca11",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u4_all.deb"],
    )
    http_file(
        name = "amd64_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u1_amd64.deb",
        sha256 = "29f463841e21ee78ce717076975a8ebc2f2ee2979624402f3b88ec36ed713263",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u1_amd64.deb"],
    )
    http_file(
        name = "arm_debian10_base-files",
        downloaded_file_path = "base-files_10.3+deb10u12_armhf.deb",
        sha256 = "9d0ec607b7bfa858b4119123879665c59e35dc2d893dd66bec17876135ae8afb",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_10.3+deb10u12_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_ca-certificates",
        downloaded_file_path = "ca-certificates_20200601~deb10u2_all.deb",
        sha256 = "a9e267a24088c793a9cf782455fd344db5fdced714f112a8857c5bfd07179387",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20200601~deb10u2_all.deb"],
    )
    http_file(
        name = "arm_debian10_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.6-9.2~deb10u1_armhf.deb",
        sha256 = "4401482dad1f11e370b0d47078b0eef74593d3b12badd8d4277a1c448ab2de15",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/bzip2/libbz2-1.0_1.0.6-9.2~deb10u1_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libc-bin",
        downloaded_file_path = "libc-bin_2.28-10+deb10u1_armhf.deb",
        sha256 = "2cfeae4106a0c879ae3ce57766f14fb536a0a5403d79272ac94d1782492b1ce1",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.28-10+deb10u1_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libc6",
        downloaded_file_path = "libc6_2.28-10+deb10u1_armhf.deb",
        sha256 = "c10a2ee12efdb773c1c626ed318f0d74108fce0aa11d66350b1c23ddbc8d5711",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.28-10+deb10u1_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.5_armhf.deb",
        sha256 = "d34c3f927b13c17550313dd314cb064b66846279afd032574bff16aab62f0697",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.5_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libffi6",
        downloaded_file_path = "libffi6_3.2.1-9_armhf.deb",
        sha256 = "420723ea7f56f2e9dfa20f683117a9e6f5ec9336b88c3ef5a7f69622ab815872",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libf/libffi/libffi6_3.2.1-9_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libgcc1",
        downloaded_file_path = "libgcc1_8.3.0-6_armhf.deb",
        sha256 = "2303bab1cc54099a8de5ced6601c10d4abedc62d3c12addc097f03cba1355d2d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgcc1_8.3.0-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libgomp1",
        downloaded_file_path = "libgomp1_8.3.0-6_armhf.deb",
        sha256 = "0ee637d20d92fb217def838cf7a0591f05384dced5f5ec9885f93b61931f1522",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgomp1_8.3.0-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_liblzma5",
        downloaded_file_path = "liblzma5_5.2.4-1+deb10u1_armhf.deb",
        sha256 = "37af727c1714977551fba83c38e2123b2363680fbae24d78c9747b9bc8325be9",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/x/xz-utils/liblzma5_5.2.4-1+deb10u1_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libreadline7",
        downloaded_file_path = "libreadline7_7.0-5_armhf.deb",
        sha256 = "de3aa01b6ecfa5b57e5011e400abddf9174056588c21b42189b497e65a67d983",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/libreadline7_7.0-5_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.27.2-3+deb10u1_armhf.deb",
        sha256 = "f35d1f408b1ef9e6c0cbb2d5989f60f06faa07536a9b0ffd5c07f3b2be2eb301",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/s/sqlite3/libsqlite3-0_3.27.2-3+deb10u1_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb10u3_armhf.deb",
        sha256 = "f24b7c099c32b4a84ba4a3955b8f61637aca4fd7e30d848858776ec128d9ffac",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb10u3_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_libstdcpp6",
        downloaded_file_path = "libstdc++6_8.3.0-6_armhf.deb",
        sha256 = "2a22648689ca745554599a818f01241605b2548540d62026116cb07a15df8d09",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libstdc++6_8.3.0-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_mime-support",
        downloaded_file_path = "mime-support_3.62_all.deb",
        sha256 = "776efd686af26fa26325450280e3305463b1faef75d82b383bb00da61893d8ca",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/m/mime-support/mime-support_3.62_all.deb"],
    )
    http_file(
        name = "arm_debian10_netbase",
        downloaded_file_path = "netbase_5.6_all.deb",
        sha256 = "baf0872964df0ccb10e464b47d995acbba5a0d12a97afe2646d9a6bb97e8d79d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_5.6_all.deb"],
    )
    http_file(
        name = "arm_debian10_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb10u3_armhf.deb",
        sha256 = "9f17422231a02f6906811e4ef235962a5d99e2a56eec91b64a43e10ea0bf870e",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb10u3_armhf.deb"],
    )
    http_file(
        name = "arm_debian10_readline-common",
        downloaded_file_path = "readline-common_7.0-5_all.deb",
        sha256 = "153d8a5ddb04044d10f877a8955d944612ec9035f4c73eec99d85a92c3816712",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/readline-common_7.0-5_all.deb"],
    )
    http_file(
        name = "arm_debian10_tzdata",
        downloaded_file_path = "tzdata_2021a-0+deb10u5_all.deb",
        sha256 = "cd98ec676778c1612cffb6e3b16dece8597f4a72b2ca3258cbbbba733e850245",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-0+deb10u5_all.deb"],
    )
    http_file(
        name = "arm_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u4_armhf.deb",
        sha256 = "9e7744490b256b0a866a5ec3920184c5cccbc88b49e8324d1c6404752892ac5e",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_11.1+deb11u4_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "arm_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u3_armhf.deb",
        sha256 = "64ee4d2fce0c770333fe0dcbd769235e24e7c3b8a53b9fe28b733019ab1daee1",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u3_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u3_armhf.deb",
        sha256 = "ffd7e76d66ae8b2e5080077504658052759269fa965e69ff0aa6eedc052120c8",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.31-13+deb11u3_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_armhf.deb",
        sha256 = "4cfff89c7f492090c5988298f9f9419d3464d294c43883800a2ed55676581d26",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_armhf.deb",
        sha256 = "c046673580eef1ef3b2778c37c8baccbb5510195e8008f789b8309b38345abc0",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_armhf.deb",
        sha256 = "5b7b4564c99a450e75a299d8d554eb8fe8fc3f8561073d93317c38c36c1d195c",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_armhf.deb",
        sha256 = "879258df2ac36d9733df014c5a5443944e1a5c4ba9a7eebe5dd28547b4ebb541",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "arm_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_armhf.deb",
        sha256 = "780a64b4e26ca70538898ef3e0ed43bb02271d3b82c9b6906e8ba77157cb9761",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_armhf.deb"],
    )
    http_file(
        name = "arm_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u4_all.deb",
        sha256 = "fbd924ad16be1933ee07f505e2fe5a98df8c143eacecbd6f830ce4e25d93ca11",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u4_all.deb"],
    )
    http_file(
        name = "arm64_debian10_base-files",
        downloaded_file_path = "base-files_10.3+deb10u12_arm64.deb",
        sha256 = "d2e1166024fb46ce26e02c4a0566e2c6084c0fed813180c91480ad65e6be34e8",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_10.3+deb10u12_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_ca-certificates",
        downloaded_file_path = "ca-certificates_20200601~deb10u2_all.deb",
        sha256 = "a9e267a24088c793a9cf782455fd344db5fdced714f112a8857c5bfd07179387",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20200601~deb10u2_all.deb"],
    )
    http_file(
        name = "arm64_debian10_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.6-9.2~deb10u1_arm64.deb",
        sha256 = "759f72ebadc1c8a790a1260c29d40736d0ebc2ee1a4e003ea70704631b42614e",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/bzip2/libbz2-1.0_1.0.6-9.2~deb10u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libc-bin",
        downloaded_file_path = "libc-bin_2.28-10+deb10u1_arm64.deb",
        sha256 = "27d669def3898ad624c3a136913f2c751e91e15f259d13c30fdbafd86dfd4bb2",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.28-10+deb10u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libc6",
        downloaded_file_path = "libc6_2.28-10+deb10u1_arm64.deb",
        sha256 = "09f5e92b1527cdc06b757499bb4d97ddf1b064fc3d163f978e5de18b131cd330",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.28-10+deb10u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.5_arm64.deb",
        sha256 = "d2086e5495ea348d0bf5118ca427fcd22fcd1b9390d3938d90d71ab98d667050",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libffi6",
        downloaded_file_path = "libffi6_3.2.1-9_arm64.deb",
        sha256 = "c5f7f4158dc6821bf37dd44ce0fe4399b5798d4ae7e821ad85b63059a2b31c0f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libf/libffi/libffi6_3.2.1-9_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libgcc1",
        downloaded_file_path = "libgcc1_8.3.0-6_arm64.deb",
        sha256 = "2851ac25d12958586c035de5ec4f2fc17272dec48f776dd0dd24c62f62674fd9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgcc1_8.3.0-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libgomp1",
        downloaded_file_path = "libgomp1_8.3.0-6_arm64.deb",
        sha256 = "a147bccae845e5405941df3f761065cbc68f06bb29fccb46bfce7dff562cc0fa",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgomp1_8.3.0-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_liblzma5",
        downloaded_file_path = "liblzma5_5.2.4-1+deb10u1_arm64.deb",
        sha256 = "dc81fe6c195f0d2498b2043bbc1443d881d7196dbc445f052dd58f574b3ab95a",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/x/xz-utils/liblzma5_5.2.4-1+deb10u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libreadline7",
        downloaded_file_path = "libreadline7_7.0-5_arm64.deb",
        sha256 = "2c11b5542b1d9ef224fccb08e0c3e6a1b27e083320aede9620822f60a161e1f7",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/libreadline7_7.0-5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.27.2-3+deb10u1_arm64.deb",
        sha256 = "986a89ba0b20c24925c7dbeeafeb1fdc6d696971e060a15fb1abd150821d9cf0",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/s/sqlite3/libsqlite3-0_3.27.2-3+deb10u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb10u3_arm64.deb",
        sha256 = "9d6db56bf17ec079675e0f6f7772af65b832dd3ad55c02c5409462cf6b052e23",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb10u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_libstdcpp6",
        downloaded_file_path = "libstdc++6_8.3.0-6_arm64.deb",
        sha256 = "52cf36333a405867a079a695f6a37cb63558859d7d19cef40fc7d112c39fefd6",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libstdc++6_8.3.0-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_mime-support",
        downloaded_file_path = "mime-support_3.62_all.deb",
        sha256 = "776efd686af26fa26325450280e3305463b1faef75d82b383bb00da61893d8ca",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/m/mime-support/mime-support_3.62_all.deb"],
    )
    http_file(
        name = "arm64_debian10_netbase",
        downloaded_file_path = "netbase_5.6_all.deb",
        sha256 = "baf0872964df0ccb10e464b47d995acbba5a0d12a97afe2646d9a6bb97e8d79d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_5.6_all.deb"],
    )
    http_file(
        name = "arm64_debian10_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb10u3_arm64.deb",
        sha256 = "23d7f4ba9265a18e9e138f82fe6d23bffdab2be4eb1674f0d6bfbe318b145e1e",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb10u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian10_readline-common",
        downloaded_file_path = "readline-common_7.0-5_all.deb",
        sha256 = "153d8a5ddb04044d10f877a8955d944612ec9035f4c73eec99d85a92c3816712",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/readline-common_7.0-5_all.deb"],
    )
    http_file(
        name = "arm64_debian10_tzdata",
        downloaded_file_path = "tzdata_2021a-0+deb10u5_all.deb",
        sha256 = "cd98ec676778c1612cffb6e3b16dece8597f4a72b2ca3258cbbbba733e850245",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-0+deb10u5_all.deb"],
    )
    http_file(
        name = "arm64_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u4_arm64.deb",
        sha256 = "d44362d336001591716ff09b27aa175f78cfed833188460a61bc6c58258c2086",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_11.1+deb11u4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "arm64_debian11_dash",
        downloaded_file_path = "dash_0.5.11+git20200708+dd9ef66-5_arm64.deb",
        sha256 = "542980a48d96c1124a9664cae06dbb8b813417daa1de1b6ed4cb49e0766da932",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/dash/dash_0.5.11+git20200708+dd9ef66-5_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_arm64.deb",
        sha256 = "52ca7f90de6cb6576a0a5cf5712fc4ae7344b79c44b8a1548087fd5d92bf1f64",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.8-4_arm64.deb",
        sha256 = "da340e8470e96445c56966f74e48a9a91dee0fa5c89876e88a4575cc17d17a97",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/bzip2/libbz2-1.0_1.0.8-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u3_arm64.deb",
        sha256 = "11830150c5ce37fffefd28c09150edfaa882df634ee52c1854de69ae2ee5959f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u3_arm64.deb",
        sha256 = "5b0217b10ecea21052f8f43bee393c601f632f3be1e9d98b8ea5c6629df253f4",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.31-13+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcom-err2",
        downloaded_file_path = "libcom-err2_1.46.2-2_arm64.deb",
        sha256 = "fc95d415c35f5b687871f660a5bf66963fd117daa490110499119411e2d6145e",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcrypt1",
        downloaded_file_path = "libcrypt1_4.4.18-4_arm64.deb",
        sha256 = "22b586b29e840dabebf0bf227d233376628b87954915d064bc142ae85d1b7979",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.8_arm64.deb",
        sha256 = "cf9aa3eae9cfc4c84f93e32f3d11e2707146e4d9707712909e3c61530b50353e",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.8_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u3_arm64.deb",
        sha256 = "d9bae74ea4fed5a5616c4acf67914a12d485fa50be729468cfbc5d2d54c91cfc",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libffi7",
        downloaded_file_path = "libffi7_3.3-6_arm64.deb",
        sha256 = "eb748e33ae4ed46f5a4c14b7a2a09792569f2029ede319d0979c373829ba1532",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libf/libffi/libffi7_3.3-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_arm64.deb",
        sha256 = "18b13ef8a46e9d79ba6a6ba2db0c86e42583277b5d47f6942f3223e349c22641",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_arm64.deb",
        sha256 = "b25f1c148498dd2b49dc30da0a2b2537a7bd0cb34afb8ea681dd145053c9a3f8",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_arm64.deb",
        sha256 = "e2fcdb378d3c1ad1bcb64d4fb6b37aab44011152beca12a4944f435a2582df1f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libglib2.0-0",
        downloaded_file_path = "libglib2.0-0_2.66.8-1_arm64.deb",
        sha256 = "667d1b891bcf9b8cc47385c19b39271c74f48fd2b6b457474184f85ce63ea261",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_arm64.deb",
        sha256 = "813af2e0b8ba0a7cea18c988cd843412ef6d0415700fc860d62816750e741670",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgraphite2-3",
        downloaded_file_path = "libgraphite2-3_1.3.14-1_arm64.deb",
        sha256 = "473362a74ba74ae630fc43675460fb5a1058564a635a301875e00f1c6f9b27cb",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgssapi-krb5-2",
        downloaded_file_path = "libgssapi-krb5-2_1.18.3-6+deb11u1_arm64.deb",
        sha256 = "8c312707d3ce00ed24ef65d4309393bd5489ff7edc613e13983a046af59356e9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libharfbuzz0b",
        downloaded_file_path = "libharfbuzz0b_2.7.4-1_arm64.deb",
        sha256 = "d9f0345391cc661503d1508ccd318b3db48add354e706cf9d66fa16bf99e2d03",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_arm64.deb",
        sha256 = "8903394de23dc6ead5abfc80972c8fd44300c9903ad4589d0df926e71977d881",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libk5crypto3",
        downloaded_file_path = "libk5crypto3_1.18.3-6+deb11u1_arm64.deb",
        sha256 = "3a0e20fb005aaff0c3fe6df4ab3de85a4b25270defa6e58cc09c407169cca970",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkeyutils1",
        downloaded_file_path = "libkeyutils1_1.6.1-2_arm64.deb",
        sha256 = "7101c2380ab47a3627a6fa076a149ab71078263064f936fccbd43efbaed4a2da",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkrb5-3",
        downloaded_file_path = "libkrb5-3_1.18.3-6+deb11u1_arm64.deb",
        sha256 = "99ff33f197614dd279e0858e0f7571dc0f3536cfa1865f2e7321b62c47630593",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkrb5support0",
        downloaded_file_path = "libkrb5support0_1.18.3-6+deb11u1_arm64.deb",
        sha256 = "91d0ca93375d35ef104c05a3eb05fbbcfc77d0578b14eb47e5614a24f3e562c5",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_liblcms2-2",
        downloaded_file_path = "liblcms2-2_2.12~rc1-2_arm64.deb",
        sha256 = "6d92ee1f0d427b88ab9bff32c769b61e2597c8fb289589ca0731a7e77d490d6e",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_liblzma5",
        downloaded_file_path = "liblzma5_5.2.5-2.1~deb11u1_arm64.deb",
        sha256 = "d865bba41952c707b3fa3ae8cab4d4bd337ee92991d2aead66c925bf7cc48846",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/x/xz-utils/liblzma5_5.2.5-2.1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libmpdec3",
        downloaded_file_path = "libmpdec3_2.5.1-1_arm64.deb",
        sha256 = "171e2581970f36a39f65d1ca3c761e76b103844daae7903fcc07f7c3822a05bb",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/m/mpdecimal/libmpdec3_2.5.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libncursesw6",
        downloaded_file_path = "libncursesw6_6.2+20201114-2_arm64.deb",
        sha256 = "4ff84101deab5af44f91df40a8220995a501c0f875f70ede51ce8c7dce7c475c",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/ncurses/libncursesw6_6.2+20201114-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libnsl2",
        downloaded_file_path = "libnsl2_1.3.0-2_arm64.deb",
        sha256 = "8f9ba58b219779b43c4ccc78c79b0a23f721fc96323c202abb31e02f942104b3",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libn/libnsl/libnsl2_1.3.0-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_arm64.deb",
        sha256 = "21cac4064a41dbc354295c437f37bf623f9004513a97a6fa030248566aa986e9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/pcre3/libpcre3_8.39-13_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_arm64.deb",
        sha256 = "f5f61274aa5f71b9e44b077bd7b9fa9cd5ff71d8b8295f47dc1b2d45378aa73e",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3.9-minimal",
        downloaded_file_path = "libpython3.9-minimal_3.9.2-1_arm64.deb",
        sha256 = "b49736ab0e8b8577f97a474ca67e20c1c025f9d7394ec8d7820de6314c903cf9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/python3.9/libpython3.9-minimal_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libpython3.9-stdlib",
        downloaded_file_path = "libpython3.9-stdlib_3.9.2-1_arm64.deb",
        sha256 = "3b3612dcd7550f01ec3517fbe955838223f4cf115b6983e4ed6d7320cd4b05c4",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/python3.9/libpython3.9-stdlib_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libreadline8",
        downloaded_file_path = "libreadline8_8.1-1_arm64.deb",
        sha256 = "500c3cdc00dcaea2c4ed736e00bfcb6cb43c3415e808566c5dfa266dbfc0c5e5",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/libreadline8_8.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.34.1-3_arm64.deb",
        sha256 = "1e33cd39dc4fff2a7edd7bb7e90a71e20fb528f6a581fe0287652e4dae77e0d0",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/s/sqlite3/libsqlite3-0_3.34.1-3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_arm64.deb",
        sha256 = "8d4ef5a06719fabd90a6a27729ade7b9dde1a1c923a89ba1406af6489fa7c82f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_arm64.deb",
        sha256 = "7869aa540cc46e9f3d4267d5bde2af0e5b429a820c1d6f1a4cfccfe788c31890",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libtinfo6",
        downloaded_file_path = "libtinfo6_6.2+20201114-2_arm64.deb",
        sha256 = "21c0c33e00d091d0f326a083a77531270b8c56468500f0948d149f3e20b95385",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/ncurses/libtinfo6_6.2+20201114-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libtirpc3",
        downloaded_file_path = "libtirpc3_1.3.1-1_arm64.deb",
        sha256 = "84100fa6acef0eb8b0315f7b7b733da00a5d3357cca2e1ff530b5729ccf33c5b",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libt/libtirpc/libtirpc3_1.3.1-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libuuid1",
        downloaded_file_path = "libuuid1_2.36.1-8+deb11u1_arm64.deb",
        sha256 = "3d677da6a22e9cac519fed5a2ed5b20a4217f51ca420fce57434b5e813c26e03",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "arm64_debian11_openjdk-11-jdk-headless",
        downloaded_file_path = "openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_arm64.deb",
        sha256 = "8c2f0817cdd92a203b25e95164789c9e13a5efc6f222fcf604c7e929ab18b36c",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openjdk-11-jre-headless",
        downloaded_file_path = "openjdk-11-jre-headless_11.0.16+8-1~deb11u1_arm64.deb",
        sha256 = "790b763a30a1b1f508b7abe0c765bc09728a7529de9c390b9cee7b899c920222",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.16+8-1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openjdk-17-jdk-headless",
        downloaded_file_path = "openjdk-17-jdk-headless_17.0.3+7-1~deb11u1_arm64.deb",
        sha256 = "b8f7418834cbf2384a2049cca5a7b2b9f107713a81c67b5e7c37e710d9b25f88",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.3+7-1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openjdk-17-jre-headless",
        downloaded_file_path = "openjdk-17-jre-headless_17.0.3+7-1~deb11u1_arm64.deb",
        sha256 = "e2024d0a46db9b118628c6b0f8cd3a601ac4271e20158c7e946528562af71cc9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.3+7-1~deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_arm64.deb",
        sha256 = "ff9a7649fa24c5d1fa5ddcbd4c4e9fd5facb205ddc7b796f61de1107dabb00fd",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_python3-distutils",
        downloaded_file_path = "python3-distutils_3.9.2-1_all.deb",
        sha256 = "05ec4080e0f05ba6b1c339d89c97f6343919be450b66cf4cfb215f54dcb85e58",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/python3-stdlib-extensions/python3-distutils_3.9.2-1_all.deb"],
    )
    http_file(
        name = "arm64_debian11_python3.9-minimal",
        downloaded_file_path = "python3.9-minimal_3.9.2-1_arm64.deb",
        sha256 = "bc0d0ed39ebc066020c3a16afdab4fd3e0260b41ae799273531d5b2403ae7b27",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/python3.9/python3.9-minimal_3.9.2-1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u4_all.deb",
        sha256 = "fbd924ad16be1933ee07f505e2fe5a98df8c143eacecbd6f830ce4e25d93ca11",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u4_all.deb"],
    )
    http_file(
        name = "arm64_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u1_arm64.deb",
        sha256 = "a061275b0bad47da2ea8bf03b9aa34dd11241ce9cd70680a8e520b43e947a883",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u1_arm64.deb"],
    )
    http_file(
        name = "ppc64le_debian10_base-files",
        downloaded_file_path = "base-files_10.3+deb10u12_ppc64el.deb",
        sha256 = "2bd05cfc8277924ebef46515cd53efb7d483eae88e25e1565e429fdae35c9ca9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_10.3+deb10u12_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_ca-certificates",
        downloaded_file_path = "ca-certificates_20200601~deb10u2_all.deb",
        sha256 = "a9e267a24088c793a9cf782455fd344db5fdced714f112a8857c5bfd07179387",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20200601~deb10u2_all.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.6-9.2~deb10u1_ppc64el.deb",
        sha256 = "1413dfaaa438ee49639ccda11c76a1cacd7c5f419773d9e916f9ee62947da0cf",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/bzip2/libbz2-1.0_1.0.6-9.2~deb10u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libc-bin",
        downloaded_file_path = "libc-bin_2.28-10+deb10u1_ppc64el.deb",
        sha256 = "ac41b283d7e53e953f9ba950cccec3a61ed778e1e7f8e576bd40cb686055ba1d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.28-10+deb10u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libc6",
        downloaded_file_path = "libc6_2.28-10+deb10u1_ppc64el.deb",
        sha256 = "8d2e8afacf87601560518cd287a348ef1e92566f82803a157b24fe90d3d630f6",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.28-10+deb10u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.5_ppc64el.deb",
        sha256 = "bb88ea970d2ce4fa9c99c2e87b51d7dc5e2b5e4d5c9bfb61ef400d64cb3838c2",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.5_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libffi6",
        downloaded_file_path = "libffi6_3.2.1-9_ppc64el.deb",
        sha256 = "5beaac75e6942695b691b8f740cf4116a1245112d7f8389b57eea33a9282b800",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libf/libffi/libffi6_3.2.1-9_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libgcc1",
        downloaded_file_path = "libgcc1_8.3.0-6_ppc64el.deb",
        sha256 = "a6f4853c856b55d8d1abd9b69cff2f173950ad99a8b76eaed5a189f192849501",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgcc1_8.3.0-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libgomp1",
        downloaded_file_path = "libgomp1_8.3.0-6_ppc64el.deb",
        sha256 = "e816594ad2898d08323b427b553bfcc85078a414fbacbee554df6d39043b2105",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgomp1_8.3.0-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_liblzma5",
        downloaded_file_path = "liblzma5_5.2.4-1+deb10u1_ppc64el.deb",
        sha256 = "072b21410518fb604643701a2af810828b1681d32530f732080645e6a3ca2797",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/x/xz-utils/liblzma5_5.2.4-1+deb10u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libreadline7",
        downloaded_file_path = "libreadline7_7.0-5_ppc64el.deb",
        sha256 = "7211013401adc0e17960e8a1d285bccceb50b14d9c34d4ffc4cae20a61888a15",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/libreadline7_7.0-5_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.27.2-3+deb10u1_ppc64el.deb",
        sha256 = "64a54e6070f42605fcdcb63c0b2a992358b93b4d28d097c65614a06792890814",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/s/sqlite3/libsqlite3-0_3.27.2-3+deb10u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb10u3_ppc64el.deb",
        sha256 = "c7710fb28638db9f9a607c36dad0509d269cb3799c20b03666e026d324665d8b",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb10u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_libstdcpp6",
        downloaded_file_path = "libstdc++6_8.3.0-6_ppc64el.deb",
        sha256 = "c4870020ef41e32c9db755b3de2d5a379fac497925d1fc571ab4f5e71878cb24",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libstdc++6_8.3.0-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_mime-support",
        downloaded_file_path = "mime-support_3.62_all.deb",
        sha256 = "776efd686af26fa26325450280e3305463b1faef75d82b383bb00da61893d8ca",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/m/mime-support/mime-support_3.62_all.deb"],
    )
    http_file(
        name = "ppc64le_debian10_netbase",
        downloaded_file_path = "netbase_5.6_all.deb",
        sha256 = "baf0872964df0ccb10e464b47d995acbba5a0d12a97afe2646d9a6bb97e8d79d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_5.6_all.deb"],
    )
    http_file(
        name = "ppc64le_debian10_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb10u3_ppc64el.deb",
        sha256 = "e1a01b42fc8bcb6b3307d356391ec89bc0742e4b81908a738a7da0d690f5f95f",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb10u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian10_readline-common",
        downloaded_file_path = "readline-common_7.0-5_all.deb",
        sha256 = "153d8a5ddb04044d10f877a8955d944612ec9035f4c73eec99d85a92c3816712",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/readline-common_7.0-5_all.deb"],
    )
    http_file(
        name = "ppc64le_debian10_tzdata",
        downloaded_file_path = "tzdata_2021a-0+deb10u5_all.deb",
        sha256 = "cd98ec676778c1612cffb6e3b16dece8597f4a72b2ca3258cbbbba733e850245",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-0+deb10u5_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u4_ppc64el.deb",
        sha256 = "6470bf8e4ffbf033d9ccdfd0b71cb53755d0a32ab9f34d4940c78ad8ea15b717",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_11.1+deb11u4_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_ppc64el.deb",
        sha256 = "a7a7099df1c6ab6c3472731d88892e83f0077b2d3ec1414ff8f1c311a55a9f92",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u3_ppc64el.deb",
        sha256 = "f69385530c120572c6705965c38a0c60c2b7b1d2c9725bc39cae5a7036ad45d9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u3_ppc64el.deb",
        sha256 = "2ee2338437d1110920eb08ee21d5bb14fa21e30e5506e22c72041d79250c350a",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.31-13+deb11u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libcrypt1",
        downloaded_file_path = "libcrypt1_4.4.18-4_ppc64el.deb",
        sha256 = "0087ad3e3d01968c3fb354f77b46966e4ca79246a08caca9257695095befcf05",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u3_ppc64el.deb",
        sha256 = "3dff2b7c1c8dd378744b5790f10f977cc8ab9065197e2e57ba915e9660cdbce7",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_ppc64el.deb",
        sha256 = "a4eed4b8c8cefe48e0567a0c098a7bf9fc6aab4093a9dd2e75fbdfa2d1ef7aa8",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_ppc64el.deb",
        sha256 = "6ca7c822898cf4664023a614af17bb139647ff9fa6e56546f1504c5f1d6ca76f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_ppc64el.deb",
        sha256 = "8b612f798430a6dd8b8b5e8f712b7ea92329201c6a438a9d176e9e285f1c14d5",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libglib2.0-0",
        downloaded_file_path = "libglib2.0-0_2.66.8-1_ppc64el.deb",
        sha256 = "c31d5cac3c9b6d861b62a5f9972f1351355d57a622d1669fa410457c912ab905",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_ppc64el.deb",
        sha256 = "f4b1f093072bf65694a98432d108e5c62756c147f5e92e657021428dc602b9f4",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libgraphite2-3",
        downloaded_file_path = "libgraphite2-3_1.3.14-1_ppc64el.deb",
        sha256 = "6998cf0f9dd4c0d09ce0521e26ed967f596fc1e8b394edbc49fc0cd4a969a3d2",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libharfbuzz0b",
        downloaded_file_path = "libharfbuzz0b_2.7.4-1_ppc64el.deb",
        sha256 = "eceadc98a48d3950cd69be4648ef134b76a224415a6fad9193407860604d6a9b",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_ppc64el.deb",
        sha256 = "7c198ae4e27ddb57d53ee68bf2846b3dc88d33b9948d5f2903ee9e69312848b9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_liblcms2-2",
        downloaded_file_path = "liblcms2-2_2.12~rc1-2_ppc64el.deb",
        sha256 = "e4b32374b944aae5c4ab9e3742a68ad978faae9403c2685c5e44c7aa4d6e0123",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_ppc64el.deb",
        sha256 = "c24f9bb2b39d2fb9750a52a9ba512754079062c92be5f51b204689117c11868a",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/pcre3/libpcre3_8.39-13_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_ppc64el.deb",
        sha256 = "ea4e1daaeab93a09f9fc943a852099c89d69da0c9606d0f4419ae0c5d4b5c10d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_ppc64el.deb",
        sha256 = "37b79758310e91ff2a634bd0d41730c6ac377054470ba4f0f0e809fac94008aa",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_ppc64el.deb",
        sha256 = "cda71acea3aba81ccb555f7b2355a6a3944b0f09049945a351d8e7682058daa9",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_libuuid1",
        downloaded_file_path = "libuuid1_2.36.1-8+deb11u1_ppc64el.deb",
        sha256 = "8c5a094cf457ffedcd3c401f8aef735a4e9a405cd07208ec6c8e57441f650bdf",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openjdk-11-jdk-headless",
        downloaded_file_path = "openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_ppc64el.deb",
        sha256 = "4f3322ddcb02ee4f0618aad88490a09da17a2324ed1b2ee0628ef6e18282de46",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openjdk-11-jre-headless",
        downloaded_file_path = "openjdk-11-jre-headless_11.0.16+8-1~deb11u1_ppc64el.deb",
        sha256 = "236ec1d4db30db54d36c34a44229d19297babcdfb94f805acf62a3748b0ea489",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.16+8-1~deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openjdk-17-jdk-headless",
        downloaded_file_path = "openjdk-17-jdk-headless_17.0.3+7-1~deb11u1_ppc64el.deb",
        sha256 = "7fbd5f2ebb3be81079afea042968a90040c09cee79f90b2a9e920a67741e5c4f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.3+7-1~deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openjdk-17-jre-headless",
        downloaded_file_path = "openjdk-17-jre-headless_17.0.3+7-1~deb11u1_ppc64el.deb",
        sha256 = "46300431b51adc127590b92e0f08c0d45ab690b950944ac8440270e93008384d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.3+7-1~deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_ppc64el.deb",
        sha256 = "36165f48b57041a49ce4d9a8aff6c2927719db8f5c06d9ff7925010ced0576ed",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_ppc64el.deb"],
    )
    http_file(
        name = "ppc64le_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u4_all.deb",
        sha256 = "fbd924ad16be1933ee07f505e2fe5a98df8c143eacecbd6f830ce4e25d93ca11",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u4_all.deb"],
    )
    http_file(
        name = "ppc64le_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u1_ppc64el.deb",
        sha256 = "3d60e6988425f58b56878a7c3aa1e24342b49d68faab50865dde37c8170eedf0",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u1_ppc64el.deb"],
    )
    http_file(
        name = "s390x_debian10_base-files",
        downloaded_file_path = "base-files_10.3+deb10u12_s390x.deb",
        sha256 = "ed2286ab28de991892db5718a8271dad6b09777e91fe4f628ad2e1ea6debdb1f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_10.3+deb10u12_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_ca-certificates",
        downloaded_file_path = "ca-certificates_20200601~deb10u2_all.deb",
        sha256 = "a9e267a24088c793a9cf782455fd344db5fdced714f112a8857c5bfd07179387",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20200601~deb10u2_all.deb"],
    )
    http_file(
        name = "s390x_debian10_libbz2-1.0",
        downloaded_file_path = "libbz2-1.0_1.0.6-9.2~deb10u1_s390x.deb",
        sha256 = "3aa57be9e3542ad674a7bbe06f13ec2367bb8154c1a6e7022a1c3fc603d3ebab",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/bzip2/libbz2-1.0_1.0.6-9.2~deb10u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libc-bin",
        downloaded_file_path = "libc-bin_2.28-10+deb10u1_s390x.deb",
        sha256 = "998150db2c85ed4c26511f664cd1c7ac1107a585de3e884c424144181a98f4c2",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.28-10+deb10u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libc6",
        downloaded_file_path = "libc6_2.28-10+deb10u1_s390x.deb",
        sha256 = "cd7ed97dde516a5008fa1682b913e28e8b93aaa82239f5c3554edd03d82f0f33",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.28-10+deb10u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libdb5.3",
        downloaded_file_path = "libdb5.3_5.3.28+dfsg1-0.5_s390x.deb",
        sha256 = "e81e7e9ad1f19bf2cebb003146a51b8b8e7a21c2d73f65c38bc55ccf55c852df",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/d/db5.3/libdb5.3_5.3.28+dfsg1-0.5_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libffi6",
        downloaded_file_path = "libffi6_3.2.1-9_s390x.deb",
        sha256 = "3b56eee17d9d26e2f93a434593bc0966202b2000e83d21302ad0df9ce3a2859a",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libf/libffi/libffi6_3.2.1-9_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libgcc1",
        downloaded_file_path = "libgcc1_8.3.0-6_s390x.deb",
        sha256 = "1aa8d5e3f57c0505bf6d5e9a466caeb544d827565aee921494f4c691828227b8",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgcc1_8.3.0-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libgomp1",
        downloaded_file_path = "libgomp1_8.3.0-6_s390x.deb",
        sha256 = "195699453739401a3c2f4f2d8252f4e7625d95c03352378e2331e0aadf8316f4",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libgomp1_8.3.0-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_liblzma5",
        downloaded_file_path = "liblzma5_5.2.4-1+deb10u1_s390x.deb",
        sha256 = "f34909d99dbb83eb550d0cc2ea0aec4dfac7593426d2e6da3c514a9d4ab0a76d",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/x/xz-utils/liblzma5_5.2.4-1+deb10u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libreadline7",
        downloaded_file_path = "libreadline7_7.0-5_s390x.deb",
        sha256 = "eebbcfec6ed9fcd27332fc8681d8810504f3ad3e73590c9ac1745a9e9d5613a6",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/libreadline7_7.0-5_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libsqlite3-0",
        downloaded_file_path = "libsqlite3-0_3.27.2-3+deb10u1_s390x.deb",
        sha256 = "6ba267e698a5137f430460cc97a64986173086757976ce3baace1ae04390b50d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/s/sqlite3/libsqlite3-0_3.27.2-3+deb10u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb10u3_s390x.deb",
        sha256 = "3add692449b04711366c11fb8d396c8aa141cba7ab71d9cdcb24b6f394ca23b4",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/libssl1.1_1.1.1n-0+deb10u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_libstdcpp6",
        downloaded_file_path = "libstdc++6_8.3.0-6_s390x.deb",
        sha256 = "a9a22948e4703252474f9d3679593c2f165d452b4d3b8bd0e91c1520cf8b5bda",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-8/libstdc++6_8.3.0-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_mime-support",
        downloaded_file_path = "mime-support_3.62_all.deb",
        sha256 = "776efd686af26fa26325450280e3305463b1faef75d82b383bb00da61893d8ca",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/m/mime-support/mime-support_3.62_all.deb"],
    )
    http_file(
        name = "s390x_debian10_netbase",
        downloaded_file_path = "netbase_5.6_all.deb",
        sha256 = "baf0872964df0ccb10e464b47d995acbba5a0d12a97afe2646d9a6bb97e8d79d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_5.6_all.deb"],
    )
    http_file(
        name = "s390x_debian10_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb10u3_s390x.deb",
        sha256 = "bd9cf3c372885e22b6026d557c7137925e5c87a52d3bd2efed82a5599f7f470f",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openssl/openssl_1.1.1n-0+deb10u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian10_readline-common",
        downloaded_file_path = "readline-common_7.0-5_all.deb",
        sha256 = "153d8a5ddb04044d10f877a8955d944612ec9035f4c73eec99d85a92c3816712",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/r/readline/readline-common_7.0-5_all.deb"],
    )
    http_file(
        name = "s390x_debian10_tzdata",
        downloaded_file_path = "tzdata_2021a-0+deb10u5_all.deb",
        sha256 = "cd98ec676778c1612cffb6e3b16dece8597f4a72b2ca3258cbbbba733e850245",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-0+deb10u5_all.deb"],
    )
    http_file(
        name = "s390x_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u4_s390x.deb",
        sha256 = "26d2312150336f8836635ca98b636885db140af485acd297592884c4e2a43a16",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/base-files/base-files_11.1+deb11u4_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "s390x_debian11_fontconfig-config",
        downloaded_file_path = "fontconfig-config_2.13.1-4.2_all.deb",
        sha256 = "48afb6ad7d15e6104a343b789f73697301ad8bff77b69927bc998f5a409d8e90",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fontconfig/fontconfig-config_2.13.1-4.2_all.deb"],
    )
    http_file(
        name = "s390x_debian11_fonts-dejavu-core",
        downloaded_file_path = "fonts-dejavu-core_2.37-2_all.deb",
        sha256 = "1f67421437b6eb18669d2868e3e02cb88668683d635198142f48aacc5b397118",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fonts-dejavu/fonts-dejavu-core_2.37-2_all.deb"],
    )
    http_file(
        name = "s390x_debian11_libbrotli1",
        downloaded_file_path = "libbrotli1_1.0.9-2+b2_s390x.deb",
        sha256 = "3f2ebe4c83833f374f3aad7f3b6aa9cf68ca3511544b97a185ab5c126790ac5f",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/b/brotli/libbrotli1_1.0.9-2+b2_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u3_s390x.deb",
        sha256 = "8b9e2baa3af8df5d391216271963ba0a83735bfa624beb2687f9d435919ed3db",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u3_s390x.deb",
        sha256 = "d9cc29a64ac364a6c541c56128299e10861964fbc69dacb8594337daeb1b53cc",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glibc/libc6_2.31-13+deb11u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libcrypt1",
        downloaded_file_path = "libcrypt1_4.4.18-4_s390x.deb",
        sha256 = "dbab47c5dedde0c5dfc6f5c974e23bd4a48ebc48cb8a56e2cabded6fc52818b7",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libx/libxcrypt/libcrypt1_4.4.18-4_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libexpat1",
        downloaded_file_path = "libexpat1_2.2.10-2+deb11u3_s390x.deb",
        sha256 = "7970986f9c9770b4a9b001917da23262200b1ef1727ed444aca6c65946de669c",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/e/expat/libexpat1_2.2.10-2+deb11u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libfontconfig1",
        downloaded_file_path = "libfontconfig1_2.13.1-4.2_s390x.deb",
        sha256 = "3890eb7a635164973f4205f75586a0a60a681328f730a9e0002af80e143cb036",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/fontconfig/libfontconfig1_2.13.1-4.2_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libfreetype6",
        downloaded_file_path = "libfreetype6_2.10.4+dfsg-1+deb11u1_s390x.deb",
        sha256 = "8aecea8b8a908817f4367b451e83c5f8dbb7cc8372dfaa7df80c9898d03cf550",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/f/freetype/libfreetype6_2.10.4+dfsg-1+deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_s390x.deb",
        sha256 = "129b6403af3832426f470a30a3f01a71725eb38b7b7a93de4480f56ae5393e22",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libglib2.0-0",
        downloaded_file_path = "libglib2.0-0_2.66.8-1_s390x.deb",
        sha256 = "2166169b9c7d5a639bf8e5b018a7f48a240c36d404d1e2db8d4ce2acafc4b907",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/glib2.0/libglib2.0-0_2.66.8-1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_s390x.deb",
        sha256 = "d836fcc5ba63095ed15efefee912c83902c7213f40b6aece73455c9348d5e462",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libgraphite2-3",
        downloaded_file_path = "libgraphite2-3_1.3.14-1_s390x.deb",
        sha256 = "5d11b4ffb8f9559b77b3b6981f3c59df5a446a075b2bcc0f6184c0d9ba8c4b1c",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/graphite2/libgraphite2-3_1.3.14-1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libharfbuzz0b",
        downloaded_file_path = "libharfbuzz0b_2.7.4-1_s390x.deb",
        sha256 = "a54b2558537d4758b51db666cba7e27c9dd83ad8b19f727a9eb2008576b2900c",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/h/harfbuzz/libharfbuzz0b_2.7.4-1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libjpeg62-turbo",
        downloaded_file_path = "libjpeg62-turbo_2.0.6-4_s390x.deb",
        sha256 = "a75580859d0a161124bb1f3dd0ecb9f96786c18b5d39a02b57eb4cf7d7dd8653",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libj/libjpeg-turbo/libjpeg62-turbo_2.0.6-4_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_liblcms2-2",
        downloaded_file_path = "liblcms2-2_2.12~rc1-2_s390x.deb",
        sha256 = "0de7a9428b71b6abcaa0cccf2bb37aa6800d58baf5ca5fc063c4827703614853",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/l/lcms2/liblcms2-2_2.12~rc1-2_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libpcre3",
        downloaded_file_path = "libpcre3_8.39-13_s390x.deb",
        sha256 = "ff08eb6d116b07affbed8cdd7c519caf2fc56beffef5dd7b6519eda670c1a7f7",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/p/pcre3/libpcre3_8.39-13_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libpng16-16",
        downloaded_file_path = "libpng16-16_1.6.37-3_s390x.deb",
        sha256 = "34b92145dcf4a532dab76086ec30a636a58d31c635e7c6f9d4cb47dfc4704512",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/libp/libpng1.6/libpng16-16_1.6.37-3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_s390x.deb",
        sha256 = "34e3cae0b30acc3b4d2c57ebc55288506a72b737d8e54feb33e6efb452d0cad8",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_s390x.deb",
        sha256 = "d632c1fc45ab0ef8bc9c8cbbc9436dd82340bf0c1e44bd8b791662057ef05505",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_libuuid1",
        downloaded_file_path = "libuuid1_2.36.1-8+deb11u1_s390x.deb",
        sha256 = "8df64efb47308f903f0b9835b697c84a2be133ffa9af0ac9d93414a2f6771fae",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/u/util-linux/libuuid1_2.36.1-8+deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "s390x_debian11_openjdk-11-jdk-headless",
        downloaded_file_path = "openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_s390x.deb",
        sha256 = "e3ded1b1aeb26134e4f0f64ffef7be519c2cb365e51bc5a27c742c5495923cb2",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openjdk-11/openjdk-11-jdk-headless_11.0.16+8-1~deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_openjdk-11-jre-headless",
        downloaded_file_path = "openjdk-11-jre-headless_11.0.16+8-1~deb11u1_s390x.deb",
        sha256 = "488a42b9b62f2b881364d42505b18b8e4523dce658e29e5d34c76590f66ef6f2",
        urls = ["https://snapshot.debian.org/archive/debian-security/20220723T085529Z/pool/updates/main/o/openjdk-11/openjdk-11-jre-headless_11.0.16+8-1~deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_openjdk-17-jdk-headless",
        downloaded_file_path = "openjdk-17-jdk-headless_17.0.3+7-1~deb11u1_s390x.deb",
        sha256 = "a97ca3e25867fcac3c5c41e8491f1e83073d4638e6b3f40731c42f2520ecfcde",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openjdk-17/openjdk-17-jdk-headless_17.0.3+7-1~deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_openjdk-17-jre-headless",
        downloaded_file_path = "openjdk-17-jre-headless_17.0.3+7-1~deb11u1_s390x.deb",
        sha256 = "a8a95b70bdc9945592b55c4fec26248a863d5781e83a6dd43950fb167c8a2393",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openjdk-17/openjdk-17-jre-headless_17.0.3+7-1~deb11u1_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_s390x.deb",
        sha256 = "b8ae06fe42b0dc3f3d796b6d8bf519a71496cd72a403da72e43c191bcf44841d",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_s390x.deb"],
    )
    http_file(
        name = "s390x_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u4_all.deb",
        sha256 = "fbd924ad16be1933ee07f505e2fe5a98df8c143eacecbd6f830ce4e25d93ca11",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u4_all.deb"],
    )
    http_file(
        name = "s390x_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u1_s390x.deb",
        sha256 = "4a20d1f44bd13529754e019dee4026e1dd5c45533de8bea23ba67fb0a04ad8c7",
        urls = ["https://snapshot.debian.org/archive/debian/20220723T220108Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u1_s390x.deb"],
    )
