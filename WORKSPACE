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
        packages_url = "https://snapshot.debian.org/archive/debian-security/{}/dists/{}/updates/main/binary-{}/Packages.xz".format(DEBIAN_SECURITY_SNAPSHOT, distro, arch),
        sha256 = SHA256s[arch][name]["security"],
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
    if "debian10" == name
    if "security" in SHA256s[arch][name]
]

# debian11 has a slightly different structure for security on snapshots
[
    dpkg_src(
        name = arch + "_" + name + "_security",
        package_prefix = "https://snapshot.debian.org/archive/debian-security/{}/".format(DEBIAN_SECURITY_SNAPSHOT),
        packages_url = "https://snapshot.debian.org/archive/debian-security/{}/dists/{}-security/main/binary-{}/Packages.xz".format(DEBIAN_SECURITY_SNAPSHOT, distro, arch),
        sha256 = SHA256s[arch][name]["security"],
    )
    for arch in ARCHITECTURES
    for (name, distro) in VERSIONS
    if "debian11" == name
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
        name = "package_bundle_" + arch + "_debian11",
        # only packages for static and base at the moment
        packages = [
            "base-files",
            "ca-certificates",
            "libc6",
            "libssl1.1",
            "netbase",
            "openssl",
            "tzdata",

            # c++
            "libgcc-s1",
            "libgomp1",
            "libstdc++6",

            #java
            "zlib1g",
            "libjpeg62-turbo",
            "libpng16-16",
            "liblcms2-2",
            "libexpat1",
            "libfreetype6",
            "fonts-dejavu-core",
            "fontconfig-config",
            "libfontconfig1",
            "libuuid1",
            "openjdk-11-jre-headless",
            "openjdk-11-jdk-headless",
            "libc-bin",
            "libgraphite2-3",
            "libharfbuzz0b",
            "libglib2.0-0",
            "libpcre3",
            "libbrotli1",
        ],
        sources = [
            "@" + arch + "_debian11_security//file:Packages.json",
            "@" + arch + "_debian11_updates//file:Packages.json",
            "@" + arch + "_debian11//file:Packages.json",
        ],
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
            "libgraphite2-3",
            "libharfbuzz0b",
            "libglib2.0-0",
            "libpcre3",

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
    sha256 = "01fae654b09932e446019aa859e7af6e05e27dbade12b54cd7bae3249fc723d9",
    strip_prefix = "jetty-distribution-9.4.43.v20210629/",
    type = "tar.gz",
    urls = ["https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.43.v20210629/jetty-distribution-9.4.43.v20210629.tar.gz"],
)

# Node (https://nodejs.org/en/about/releases/)
# Follow Node's maintainence schedule and support all LTS versions that are not end of life
http_archive(
    name = "nodejs10_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "7a70083a73719a3c7846533923d5c4e955405c2b4ba1c1abd95ed21ae8b52775",
    strip_prefix = "node-v10.24.1-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v10.24.1/node-v10.24.1-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs12_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "6e5ce9cc7dcd31b182730cd662b1813c201fa98089e1013db4abd141716852dc",
    strip_prefix = "node-v12.22.6-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v12.22.6/node-v12.22.6-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs14_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "19e376214450e93e58687198070b4ab46e42357032ec65f23a7e35b0e86ad6e2",
    strip_prefix = "node-v14.17.6-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v14.17.6/node-v14.17.6-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs10_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "0ae4931d0ea779ecb237c1fc9f4a27271b0054b1efabc783863478913fe6caa6",
    strip_prefix = "node-v10.24.1-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v10.24.1/node-v10.24.1-linux-arm64.tar.gz"],
)

http_archive(
    name = "nodejs12_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "f65bf376b6b074b78240ea84d0ab7ca6cacb34c1c066b6653d76045a38565bc2",
    strip_prefix = "node-v12.22.6-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v12.22.6/node-v12.22.6-linux-arm64.tar.gz"],
)

http_archive(
    name = "nodejs14_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "3355eae15582be48f6be0910e279abbf2324f4538d3ccb2da7e66edab6e6b0fe",
    strip_prefix = "node-v14.17.6-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v14.17.6/node-v14.17.6-linux-arm64.tar.gz"],
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

# To update ppc64le busybox binary (#723)
# Get the latest commit hash from dist-ppc64le branch of docker-library repo.
# Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/stable/musl/busybox.tar.xz
# Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
http_file(
    name = "busybox_ppc64le",
    executable = True,
    sha256 = "469297ea9293df0dcb6c3f8d344eaf9f9b6ec1732696ffe86994f87c3600423b",
    urls = ["https://github.com/docker-library/busybox/raw/c0125333c4c3dfa4b9e5fd9fe6fbb875242f3613/stable/musl/busybox.tar.xz"],
)

# Docker rules.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "1f4e59843b61981a96835dc4ac377ad4da9f8c334ebe5e0bb3f58f80c09735f4",
    strip_prefix = "rules_docker-0.19.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.19.0/rules_docker-v0.19.0.tar.gz"],
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
    name = "rules_rust",
    sha256 = "42e60f81e2b269d28334b73b70d02fb516c8de0c16242f5d376bfe6d94a3509f",
    strip_prefix = "rules_rust-58f709ffec90da93c4e622d8d94f0cd55cd2ef54",
    urls = [
        # Master branch as of 2021-02-04
        "https://github.com/bazelbuild/rules_rust/archive/58f709ffec90da93c4e622d8d94f0cd55cd2ef54.tar.gz",
    ],
)

load("@rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()
