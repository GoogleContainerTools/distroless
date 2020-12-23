workspace(name = "distroless")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "a8d6b1b354d371a646d2f7927319974e0f9e52f73a2452d2b3877118169eb6bb",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.23.3/rules_go-v0.23.3.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.23.3/rules_go-v0.23.3.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

load("//package_manager:dpkg.bzl", "dpkg_list", "dpkg_src")
load(
    "//:checksums.bzl",
    "ARCHITECTURES",
    "BASE_ARCHITECTURES",
    "DEBIAN_SECURITY_SNAPSHOT",
    "DEBIAN_SNAPSHOT",
    "SHA256s",
    "VERSIONS",
)

[
    dpkg_src(
        name = arch + "_" + name,
        arch = arch,
        distro = distro,
        sha256 = SHA256s[arch][name]["main"],
        snapshot = DEBIAN_SNAPSHOT,
        url = "https://snapshot.debian.org/archive",
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
]

[
    dpkg_src(
        name = arch + "_" + name + "_updates",
        arch = arch,
        distro = distro + "-updates",
        sha256 = SHA256s[arch][name]["updates"],
        snapshot = DEBIAN_SNAPSHOT,
        url = "https://snapshot.debian.org/archive",
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
]

[
    dpkg_src(
        name = arch + "_" + name + "_security",
        package_prefix = "https://snapshot.debian.org/archive/debian-security/{}/".format(DEBIAN_SECURITY_SNAPSHOT),
        packages_gz_url = "https://snapshot.debian.org/archive/debian-security/{}/dists/{}/updates/main/binary-{}/Packages.gz".format(DEBIAN_SECURITY_SNAPSHOT, distro, arch),
        sha256 = SHA256s[arch][name]["security"],
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
    if "security" in SHA256s[arch][name]
]

[
    dpkg_src(
        name = arch + "_" + name + "_backports",
        arch = arch,
        distro = distro + "-backports",
        sha256 = SHA256s[arch][name]["backports"],
        snapshot = DEBIAN_SNAPSHOT,
        url = "https://snapshot.debian.org/archive",
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
    if "backports" in SHA256s[arch][name]
]

[
    dpkg_list(
        name = "package_bundle_" + arch + "_debian9",
        packages = [
            "libc6",
            "base-files",
            "ca-certificates",
            "openssl",
            "libssl1.0.2",
            "libssl1.1",
            "libbz2-1.0",
            "libdb5.3",
            "libffi6",
            "libncursesw5",
            "liblzma5",
            "libexpat1",
            "libreadline7",
            "libtinfo5",
            "libsqlite3-0",
            "mime-support",
            "netbase",
            "readline-common",
            "tzdata",

            #c++
            "libgcc1",
            "libgomp1",
            "libstdc++6",

            #java
            "zlib1g",
            "libjpeg62-turbo",
            "libpng16-16",
            "liblcms2-2",
            "libfreetype6",
            "fonts-dejavu-core",
            "fontconfig-config",
            "libfontconfig1",
            "libuuid1",
            "openjdk-8-jre-headless",
            "openjdk-8-jdk-headless",
            "openjdk-11-jre-headless",
            "openjdk-11-jdk-headless",
            "libc-bin",

            #python
            "libpython2.7-minimal",
            "python2.7-minimal",
            "libpython2.7-stdlib",
            "dash",
            "libc-bin",

            #python3
            "libmpdec2",
            "libpython3.5-minimal",
            "libpython3.5-stdlib",
            "python3.5-minimal",

            #dotnet
            "libcurl3",
            "libgssapi-krb5-2",
            "libicu57",
            "liblttng-ust0",
            "libssl1.0.2",
            "libuuid1",
            "zlib1g",
            "curl",
            "libcomerr2",
            "libidn2-0",
            "libk5crypto3",
            "libkrb5-3",
            "libldap-2.4-2",
            "libldap-common",
            "libsasl2-2",
            "libnghttp2-14",
            "libpsl5",
            "librtmp1",
            "libssh2-1",
            "libkeyutils1",
            "libkrb5support0",
            "libunistring0",
            "libgnutls30",
            "libgmp10",
            "libhogweed4",
            "libidn11",
            "libnettle6",
            "libp11-kit0",
            "libffi6",
            "libtasn1-6",
            "libsasl2-modules-db",
            "libgcrypt20",
            "libgpg-error0",
            "libacl1",
            "libattr1",
            "libselinux1",
            "libpcre3",
            "libbz2-1.0",
            "liblzma5",
        ] + (["libunwind8"] if arch in BASE_ARCHITECTURES else []),
        sources = [
            "@" + arch + "_debian9_updates//file:Packages.json",
            "@" + arch + "_debian9_backports//file:Packages.json",
            "@" + arch + "_debian9//file:Packages.json",
        ] + (["@" + arch + "_debian9_security//file:Packages.json"] if arch in BASE_ARCHITECTURES else []),
    )
    for arch in ARCHITECTURES
]

[
    dpkg_list(
        name = "package_bundle_" + arch + "_debian10",
        packages = [
            "libc6",
            "base-files",
            "ca-certificates",
            "openssl",
            "libssl1.1",
            "libbz2-1.0",
            "libdb5.3",
            "libffi6",
            "liblzma5",
            "libexpat1",
            "libreadline7",
            "libsqlite3-0",
            "mime-support",
            "netbase",
            "readline-common",
            "tzdata",

            #c++
            "libgcc1",
            "libgomp1",
            "libstdc++6",

            #java
            "zlib1g",
            "libjpeg62-turbo",
            "libpng16-16",
            "liblcms2-2",
            "libfreetype6",
            "fonts-dejavu-core",
            "fontconfig-config",
            "libfontconfig1",
            "libuuid1",
            "openjdk-11-jre-headless",
            "openjdk-11-jdk-headless",
            "libc-bin",

            #python
            "dash",
            "libc-bin",
            "libpython2.7-minimal",
            "libpython2.7-stdlib",
            "python2.7-minimal",

            #python3
            "libmpdec2",
            "libpython3.7-minimal",
            "libpython3.7-stdlib",
            "libtinfo6",
            "libuuid1",
            "libncursesw6",
            "python3-distutils",
            "python3.7-minimal",

            #dotnet
            "libcurl4",
            "libgssapi-krb5-2",
            "libicu63",
            "liblttng-ust0",
            "libssl1.1",
            "libuuid1",
            "zlib1g",
            "curl",
            "libcomerr2",
            "libidn2-0",
            "libk5crypto3",
            "libkrb5-3",
            "libldap-2.4-2",
            "libldap-common",
            "libsasl2-2",
            "libnghttp2-14",
            "libpsl5",
            "librtmp1",
            "libssh2-1",
            "libkeyutils1",
            "libkrb5support0",
            "libunistring2",
            "libgnutls30",
            "libgmp10",
            "libhogweed4",
            "libidn11",
            "libnettle6",
            "libp11-kit0",
            "libffi6",
            "libtasn1-6",
            "libsasl2-modules-db",
            "libgcrypt20",
            "libgpg-error0",
            "libacl1",
            "libattr1",
            "libselinux1",
            "libpcre3",
            "libbz2-1.0",
            "liblzma5",
        ] + (["libunwind8"] if arch in BASE_ARCHITECTURES else []),
        sources = [
            "@" + arch + "_debian10_security//file:Packages.json",
            "@" + arch + "_debian10_updates//file:Packages.json",
            "@" + arch + "_debian10//file:Packages.json",
        ],
    )
    for arch in ARCHITECTURES
]

# For Jetty
http_archive(
    name = "jetty",
    build_file = "//java:BUILD.jetty",
    sha256 = "1b9ec532cd9b94550fad655e066a1f9cc2d350a1c79daea85d5c56fdbcd9aaa8",
    strip_prefix = "jetty-distribution-9.4.22.v20191022/",
    type = "tar.gz",
    urls = ["https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.22.v20191022/jetty-distribution-9.4.22.v20191022.tar.gz"],
)

# Node (https://nodejs.org/en/about/releases/)
# Follow Node's maintainence schedule and support all LTS versions that are not end of life
http_archive(
    name = "nodejs10_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "2a5f9d862468a4c677630923531e52339526cfd075cc6df30da4636782eb7bda",
    strip_prefix = "node-v10.23.1-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v10.23.1/node-v10.23.1-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs12_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "c4d45bf46d4ef4b6a72384dfb0ab6c07aed5750bcd1c2fc9f29c0aaccc6a4363",
    strip_prefix = "node-v12.20.1-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v12.20.1/node-v12.20.1-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs14_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "b51c033d40246cd26e52978125a3687df5cd02ee532e8614feff0ba6c13a774f",
    strip_prefix = "node-v14.15.4-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v14.15.4/node-v14.15.4-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs10_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "e7d0476b1e9add7b21297698517356bb7c7d7f10e75f5abad6ab5806518a6cd6",
    strip_prefix = "node-v10.23.1-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v10.23.1/node-v10.23.1-linux-arm64.tar.gz"],
)

http_archive(
    name = "nodejs12_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "3154628c02f2c920fed77e8dce1a8ae32333260666ebaaa7a3cd230f45d13e42",
    strip_prefix = "node-v12.20.1-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v12.20.1/node-v12.20.1-linux-arm64.tar.gz"],
)

http_archive(
    name = "nodejs14_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "b681bda8eaa1ed2ac85e0ed2c2041a0408963c2198a24da183dc3ab60d93d975",
    strip_prefix = "node-v14.15.4-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v14.15.4/node-v14.15.4-linux-arm64.tar.gz"],
)

http_archive(
    name = "dotnet",
    build_file = "//experimental/dotnet:BUILD.dotnet",
    sha256 = "69ecad24bce4f2132e0db616b49e2c35487d13e3c379dabc3ec860662467b714",
    type = "tar.gz",
    urls = ["https://download.microsoft.com/download/5/F/0/5F0362BD-7D0A-4A9D-9BF9-022C6B15B04D/dotnet-runtime-2.0.0-linux-x64.tar.gz"],
)

http_archive(
    name = "dotnet_core_aspnet",
    build_file = "//experimental/dotnet:BUILD.dotnet",
    sha256 = "823f8ea555fd56ab40d56d423748036204c4540c08baa61de4462978a0c35583",
    type = "tar.gz",
    urls = ["https://download.visualstudio.microsoft.com/download/pr/f7c8f82a-8c47-497d-875b-2ac210599ec5/e8aea0c195efed8a9aff2ba687db8c26/aspnetcore-runtime-3.1.8-linux-x64.tar.gz"],
)

http_archive(
    name = "dotnet_core_runtime",
    build_file = "//experimental/dotnet:BUILD.dotnet",
    sha256 = "c50800e02cea23609ec6a009b1fbfe6b1f7ec4634c54bee089f918fca8fe2323",
    type = "tar.gz",
    urls = ["https://download.visualstudio.microsoft.com/download/pr/e4e47a0a-132e-416a-b8eb-f3373ad189d9/43af4412e27696c3c16e50f496f6c7af/dotnet-runtime-3.1.8-linux-x64.tar.gz"],
)

http_archive(
    name = "dotnet_core_sdk",
    build_file = "//experimental/dotnet:BUILD.dotnet",
    sha256 = "2b6b172f9483e499141e37a6b932a547d9476bf03f3e71a0fefb76c52e01a9ee",
    type = "tar.gz",
    urls = ["https://download.visualstudio.microsoft.com/download/pr/f01e3d97-c1c3-4635-bc77-0c893be36820/6ec6acabc22468c6cc68b61625b14a7d/dotnet-sdk-3.1.402-linux-x64.tar.gz"],
)

# For the debug image
http_file(
    name = "busybox_amd64",
    executable = True,
    sha256 = "51fcb60efbdf3e579550e9ab893730df56b33d0cc928a2a6467bd846cdfef7d8",
    urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-x86_64"],
)

http_file(
    name = "busybox_arm",
    executable = True,
    sha256 = "cd04052b8b6885f75f50b2a280bfcbf849d8710c8e61d369c533acf307eda064",
    urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-armv7l"],
)

http_file(
    name = "busybox_arm64",
    executable = True,
    sha256 = "141adb1b625a6f44c4b114f76b4387b4ea4f7ab802b88eb40e0d2f6adcccb1c3",
    urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-armv8l"],
)

http_file(
    name = "busybox_s390x",
    executable = True,
    sha256 = "48d13ac057046b95ba58921958be639cc3a179ac888cdd65aacd7a69139aa857",
    urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-s390x"],
)

http_file(
    name = "busybox_ppc64le",
    executable = True,
    sha256 = "7f896a2560ef3e2d11438018fef2fbdf8c2a6a2e4b84b1bcbaacc669967532d4",
    urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-powerpc64"],
)

# Docker rules.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "2dcf63f5c36c50def7091ef94ffcf94cce4056f3e0a968876f4ec41953a8fbfb",
    strip_prefix = "rules_docker-feaaebdd3162fb643494af07698f56ca9aba1241",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/feaaebdd3162fb643494af07698f56ca9aba1241.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load(
    "@io_bazel_rules_docker//python:image.bzl",
    _py_image_repos = "repositories",
)

_py_image_repos()

# Have the java_image dependencies for testing.
load(
    "@io_bazel_rules_docker//java:image.bzl",
    _java_image_repos = "repositories",
)

_java_image_repos()

# Have the go_image dependencies for testing.
load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

# Rust repositories
http_archive(
    name = "io_bazel_rules_rust",
    sha256 = "e7632fb27da7b303e6a08e75a2cc0d5e954552a8a6637c633cedadb93c59c0dc",
    strip_prefix = "rules_rust-c409198dcc26a276dfca8bb83c8941052c7dad5b",
    urls = [
        # Master branch as of 2020-09-29
        "https://github.com/bazelbuild/rules_rust/archive/c409198dcc26a276dfca8bb83c8941052c7dad5b.tar.gz",
    ],
)

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")
