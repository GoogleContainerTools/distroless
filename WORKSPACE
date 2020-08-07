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

DEBIAN_SNAPSHOT = "20200805T024503Z"

DEBIAN_SECURITY_SNAPSHOT = "20200804T162312Z"

DEBIAN_STRETCH_SHA256 = "90ff32c8226b57b879bf6b8c3cfda15e24f2b8c22de28426872f162db4e8d444"

DEBIAN_STRETCH_BACKPORTS_SHA256 = "c6aa4e13236c86b3ab0e1714ff10f1d31e0533d7fb0d05cf64e12a02accd981c"

DEBIAN_STRETCH_UPDATES_SHA256 = "b702e0888f32074ee212accbf56c732beacf0d9f570ca082a9c859b23a2596e9"

DEBIAN_STRETCH_SECURITY_SHA256 = "03c2b87d786024b61cab2a63c10aa36929ca4d6468a0ec34435235476fdd2c90"

DEBIAN_BUSTER_SHA256 = "a7f65cd4f022ad9c5cee5dace254d8d32d797887082437273223771ddbb8203f"

DEBIAN_BUSTER_UPDATES_SHA256 = "80f0b86ca11476ea485625c3dff1505285f249f5603dd9458415707dacc5fb71"

DEBIAN_BUSTER_SECURITY_SHA256 = "17f9decd681a3eeed242a27e22c60bc32687aa6b64b229d11db426b7f878b323"

dpkg_src(
    name = "debian_stretch",
    arch = "amd64",
    distro = "stretch",
    sha256 = DEBIAN_STRETCH_SHA256,
    snapshot = DEBIAN_SNAPSHOT,
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_backports",
    arch = "amd64",
    distro = "stretch-backports",
    sha256 = DEBIAN_STRETCH_BACKPORTS_SHA256,
    snapshot = DEBIAN_SNAPSHOT,
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_updates",
    arch = "amd64",
    distro = "stretch-updates",
    sha256 = DEBIAN_STRETCH_UPDATES_SHA256,
    snapshot = DEBIAN_SNAPSHOT,
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_security",
    package_prefix = "https://snapshot.debian.org/archive/debian-security/{}/".format(DEBIAN_SECURITY_SNAPSHOT),
    packages_gz_url = "https://snapshot.debian.org/archive/debian-security/{}/dists/stretch/updates/main/binary-amd64/Packages.gz".format(DEBIAN_SECURITY_SNAPSHOT),
    sha256 = DEBIAN_STRETCH_SECURITY_SHA256,
)

dpkg_list(
    name = "package_bundle",
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
        "libunwind8",
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
    ],
    sources = [
        "@debian_stretch_security//file:Packages.json",
        "@debian_stretch_updates//file:Packages.json",
        "@debian_stretch_backports//file:Packages.json",
        "@debian_stretch//file:Packages.json",
    ],
)

# For Jetty
http_archive(
    name = "jetty",
    build_file = "//:BUILD.jetty",
    sha256 = "1b9ec532cd9b94550fad655e066a1f9cc2d350a1c79daea85d5c56fdbcd9aaa8",
    strip_prefix = "jetty-distribution-9.4.22.v20191022/",
    type = "tar.gz",
    urls = ["https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.22.v20191022/jetty-distribution-9.4.22.v20191022.tar.gz"],
)

# Node (https://nodejs.org/en/about/releases/)
# Follow Node's maintainence schedule and support all LTS versions that are not end of life
http_archive(
    name = "nodejs10",
    build_file = "//experimental/nodejs:BUILD.nodejs",
    sha256 = "aa7e9e1d8abcc169119bf5c56ede515689f2644ccc4d40ca0fc33756a3deb1f7",
    strip_prefix = "node-v10.22.0-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v10.22.0/node-v10.22.0-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs12",
    build_file = "//experimental/nodejs:BUILD.nodejs",
    sha256 = "8cdacecc43c35bcfa5474c793b9e7a01835e4171264f7b13f3e57093371872e9",
    strip_prefix = "node-v12.18.3-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v12.18.3/node-v12.18.3-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs14",
    build_file = "//experimental/nodejs:BUILD.nodejs",
    sha256 = "5e2c59200c86c37a0c800fe2cd2cfabc459f8a3ae3f83c3611483c485ad32e4f",
    strip_prefix = "node-v14.6.0-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v14.6.0/node-v14.6.0-linux-x64.tar.gz"],
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
    sha256 = "ca41ea778e93449c1b37dea3e50850ce170c3737fe367a39d02eb786d6fdf97e",
    type = "tar.gz",
    urls = ["https://download.visualstudio.microsoft.com/download/pr/a1ddc998-933c-47af-b8c7-dc2503e44e91/42d8cd08b2055df52c9457c993911f2e/aspnetcore-runtime-3.1.4-linux-x64.tar.gz"],
)

http_archive(
    name = "dotnet_core_runtime",
    build_file = "//experimental/dotnet:BUILD.dotnet",
    sha256 = "cdc992eab0f35a12a2ef90867a87409f020e48f53cde8f49d24d141f51e65e2f",
    type = "tar.gz",
    urls = ["https://download.visualstudio.microsoft.com/download/pr/c3558096-9333-41fe-9195-0bd5558bde88/7a1ff566cbdab177d49fafcb66f4316b/dotnet-runtime-3.1.4-linux-x64.tar.gz"],
)

http_archive(
    name = "dotnet_core_sdk",
    build_file = "//experimental/dotnet:BUILD.dotnet",
    sha256 = "afae21afbf12d255604531cf57ee1d020aee62875a418f498e1f1385dadb719e",
    type = "tar.gz",
    urls = ["https://download.visualstudio.microsoft.com/download/pr/c9c8cca6-2281-4ce8-980f-f49723057f09/06fef88edc9d38fbfefc315953e368ea/dotnet-sdk-3.1.104-linux-x64.tar.gz"],
)

# For the debug image
http_file(
    name = "busybox",
    executable = True,
    sha256 = "51fcb60efbdf3e579550e9ab893730df56b33d0cc928a2a6467bd846cdfef7d8",
    urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-x86_64"],
)

# Docker rules.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "6287241e033d247e9da5ff705dd6ef526bac39ae82f3d17de1b69f8cb313f9cd",
    strip_prefix = "rules_docker-0.14.3",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.14.3.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

# Have the py_image dependencies for testing.
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
        # Master branch as of 2020-06-12
        "https://github.com/bazelbuild/rules_rust/archive/c409198dcc26a276dfca8bb83c8941052c7dad5b.tar.gz",
    ],
)

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")

dpkg_src(
    name = "debian10",
    arch = "amd64",
    distro = "buster",
    sha256 = DEBIAN_BUSTER_SHA256,
    snapshot = DEBIAN_SNAPSHOT,
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian10_updates",
    arch = "amd64",
    distro = "buster-updates",
    sha256 = DEBIAN_BUSTER_UPDATES_SHA256,
    snapshot = DEBIAN_SNAPSHOT,
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian10_security",
    package_prefix = "https://snapshot.debian.org/archive/debian-security/{}/".format(DEBIAN_SECURITY_SNAPSHOT),
    packages_gz_url = "https://snapshot.debian.org/archive/debian-security/{}/dists/buster/updates/main/binary-amd64/Packages.gz".format(DEBIAN_SECURITY_SNAPSHOT),
    sha256 = DEBIAN_BUSTER_SECURITY_SHA256,
)

dpkg_list(
    name = "package_bundle_debian10",
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
        "libunwind8",
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
    ],
    sources = [
        "@debian10_security//file:Packages.json",
        "@debian10_updates//file:Packages.json",
        "@debian10//file:Packages.json",
    ],
)
