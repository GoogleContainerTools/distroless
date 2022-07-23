# AUTO GENERATED
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def repositories():
    http_file(
        name = "amd64_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u4_amd64.deb",
        sha256 = "430c8b87648137e775bfca1fc5715e63be67ebb80fb84ad81c61173f440f7b23",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/b/base-files/base-files_11.1+deb11u4_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "amd64_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u3_amd64.deb",
        sha256 = "2b85212a300c614627c5c7bf519f6570dfdd23e8b1d059a6ed522038eb34e437",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u3_amd64.deb",
        sha256 = "2f029f16c32a7cf0403f8038c1cc8decc9d3a5fadffe087be0dfa2235bec2564",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/glibc/libc6_2.31-13+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libcom-err2",
        downloaded_file_path = "libcom-err2_1.46.2-2_amd64.deb",
        sha256 = "d478f132871f4ab8352d39becf936d0ad74db905398bf98465d8fe3da6fb1126",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_amd64.deb",
        sha256 = "e478f2709d8474165bb664de42e16950c391f30eaa55bc9b3573281d83a29daf",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_amd64.deb",
        sha256 = "4530c95aefa48e33fd8cf4acbe5c4b559dbe7bdf4c56469986c83a203982cef1",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libgssapi-krb5-2",
        downloaded_file_path = "libgssapi-krb5-2_1.18.3-6+deb11u1_amd64.deb",
        sha256 = "2ab853cbd0494c06fa694906c6eeea4df79720f461c76d080eb21a3e98f44115",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libicu67",
        downloaded_file_path = "libicu67_67.1-7_amd64.deb",
        sha256 = "2bf5c46254f527865bfd6368e1120908755fa57d83634bd7d316c9b3cfd57303",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/i/icu/libicu67_67.1-7_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libk5crypto3",
        downloaded_file_path = "libk5crypto3_1.18.3-6+deb11u1_amd64.deb",
        sha256 = "4a010fc69322b6be9e141a76593f46e6588c968ee3b7cf79a3b8b7efda9aeeba",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkeyutils1",
        downloaded_file_path = "libkeyutils1_1.6.1-2_amd64.deb",
        sha256 = "f01060b434d8cad3c58d5811d2082389f11b3db8152657d6c22c1d298953f2a5",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkrb5-3",
        downloaded_file_path = "libkrb5-3_1.18.3-6+deb11u1_amd64.deb",
        sha256 = "afb9dced3fcbdbc439a166eaa217dbfd485585842f12ce4587123009618e8bfe",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libkrb5support0",
        downloaded_file_path = "libkrb5support0_1.18.3-6+deb11u1_amd64.deb",
        sha256 = "1f19908dbd37bd2ba9b3b3c9eb6ab8bee9a72f72745e6887f5366bb5fece654b",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u1_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_amd64.deb",
        sha256 = "c3480bf90725c993187de02e5144e90ea81226e7e2538ba24687f5a0adc8ca5c",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_amd64.deb",
        sha256 = "5c155c58935870bf3b4bfe769116841c0d286a74f59eccfd5645693ac23f06b1",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "amd64_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_amd64.deb",
        sha256 = "3691cf432febeb8dd621c6a36e3cc66b45fc119016532ffb33c742861aec868b",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_amd64.deb"],
    )
    http_file(
        name = "amd64_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u4_all.deb",
        sha256 = "fbd924ad16be1933ee07f505e2fe5a98df8c143eacecbd6f830ce4e25d93ca11",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u4_all.deb"],
    )
    http_file(
        name = "amd64_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u1_amd64.deb",
        sha256 = "29f463841e21ee78ce717076975a8ebc2f2ee2979624402f3b88ec36ed713263",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u1_amd64.deb"],
    )
    http_file(
        name = "arm64_debian11_base-files",
        downloaded_file_path = "base-files_11.1+deb11u4_arm64.deb",
        sha256 = "d44362d336001591716ff09b27aa175f78cfed833188460a61bc6c58258c2086",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/b/base-files/base-files_11.1+deb11u4_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_ca-certificates",
        downloaded_file_path = "ca-certificates_20210119_all.deb",
        sha256 = "b2d488ad4d8d8adb3ba319fc9cb2cf9909fc42cb82ad239a26c570a2e749c389",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/c/ca-certificates/ca-certificates_20210119_all.deb"],
    )
    http_file(
        name = "arm64_debian11_libc-bin",
        downloaded_file_path = "libc-bin_2.31-13+deb11u3_arm64.deb",
        sha256 = "11830150c5ce37fffefd28c09150edfaa882df634ee52c1854de69ae2ee5959f",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/glibc/libc-bin_2.31-13+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libc6",
        downloaded_file_path = "libc6_2.31-13+deb11u3_arm64.deb",
        sha256 = "5b0217b10ecea21052f8f43bee393c601f632f3be1e9d98b8ea5c6629df253f4",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/glibc/libc6_2.31-13+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libcom-err2",
        downloaded_file_path = "libcom-err2_1.46.2-2_arm64.deb",
        sha256 = "fc95d415c35f5b687871f660a5bf66963fd117daa490110499119411e2d6145e",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/e/e2fsprogs/libcom-err2_1.46.2-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgcc-s1",
        downloaded_file_path = "libgcc-s1_10.2.1-6_arm64.deb",
        sha256 = "e2fcdb378d3c1ad1bcb64d4fb6b37aab44011152beca12a4944f435a2582df1f",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/gcc-10/libgcc-s1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgomp1",
        downloaded_file_path = "libgomp1_10.2.1-6_arm64.deb",
        sha256 = "813af2e0b8ba0a7cea18c988cd843412ef6d0415700fc860d62816750e741670",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/gcc-10/libgomp1_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libgssapi-krb5-2",
        downloaded_file_path = "libgssapi-krb5-2_1.18.3-6+deb11u1_arm64.deb",
        sha256 = "8c312707d3ce00ed24ef65d4309393bd5489ff7edc613e13983a046af59356e9",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/krb5/libgssapi-krb5-2_1.18.3-6+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libicu67",
        downloaded_file_path = "libicu67_67.1-7_arm64.deb",
        sha256 = "776303db230b275d8a17dfe8f0012bf61093dfc910f0d51f175be36707686efe",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/i/icu/libicu67_67.1-7_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libk5crypto3",
        downloaded_file_path = "libk5crypto3_1.18.3-6+deb11u1_arm64.deb",
        sha256 = "3a0e20fb005aaff0c3fe6df4ab3de85a4b25270defa6e58cc09c407169cca970",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/krb5/libk5crypto3_1.18.3-6+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkeyutils1",
        downloaded_file_path = "libkeyutils1_1.6.1-2_arm64.deb",
        sha256 = "7101c2380ab47a3627a6fa076a149ab71078263064f936fccbd43efbaed4a2da",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/keyutils/libkeyutils1_1.6.1-2_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkrb5-3",
        downloaded_file_path = "libkrb5-3_1.18.3-6+deb11u1_arm64.deb",
        sha256 = "99ff33f197614dd279e0858e0f7571dc0f3536cfa1865f2e7321b62c47630593",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/krb5/libkrb5-3_1.18.3-6+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libkrb5support0",
        downloaded_file_path = "libkrb5support0_1.18.3-6+deb11u1_arm64.deb",
        sha256 = "91d0ca93375d35ef104c05a3eb05fbbcfc77d0578b14eb47e5614a24f3e562c5",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/k/krb5/libkrb5support0_1.18.3-6+deb11u1_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libssl1.1",
        downloaded_file_path = "libssl1.1_1.1.1n-0+deb11u3_arm64.deb",
        sha256 = "8d4ef5a06719fabd90a6a27729ade7b9dde1a1c923a89ba1406af6489fa7c82f",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/o/openssl/libssl1.1_1.1.1n-0+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_libstdcpp6",
        downloaded_file_path = "libstdc++6_10.2.1-6_arm64.deb",
        sha256 = "7869aa540cc46e9f3d4267d5bde2af0e5b429a820c1d6f1a4cfccfe788c31890",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/g/gcc-10/libstdc++6_10.2.1-6_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_netbase",
        downloaded_file_path = "netbase_6.3_all.deb",
        sha256 = "f444889ad3441758e3a5092418e062da2b0c6a811fdb0c262a6b70cb2518dbde",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/n/netbase/netbase_6.3_all.deb"],
    )
    http_file(
        name = "arm64_debian11_openssl",
        downloaded_file_path = "openssl_1.1.1n-0+deb11u3_arm64.deb",
        sha256 = "ff9a7649fa24c5d1fa5ddcbd4c4e9fd5facb205ddc7b796f61de1107dabb00fd",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/o/openssl/openssl_1.1.1n-0+deb11u3_arm64.deb"],
    )
    http_file(
        name = "arm64_debian11_tzdata",
        downloaded_file_path = "tzdata_2021a-1+deb11u4_all.deb",
        sha256 = "fbd924ad16be1933ee07f505e2fe5a98df8c143eacecbd6f830ce4e25d93ca11",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/t/tzdata/tzdata_2021a-1+deb11u4_all.deb"],
    )
    http_file(
        name = "arm64_debian11_zlib1g",
        downloaded_file_path = "zlib1g_1.2.11.dfsg-2+deb11u1_arm64.deb",
        sha256 = "a061275b0bad47da2ea8bf03b9aa34dd11241ce9cd70680a8e520b43e947a883",
        urls = ["https://snapshot.debian.org/archive/debian/20220726T090347Z/pool/main/z/zlib/zlib1g_1.2.11.dfsg-2+deb11u1_arm64.deb"],
    )
