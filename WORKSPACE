workspace(name = "distroless")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "8df59f11fb697743cbb3f26cfb8750395f30471e9eabde0d174c3aebc7a1cd39",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/0.19.1/rules_go-0.19.1.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/0.19.1/rules_go-0.19.1.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

load("//package_manager:package_manager.bzl", "package_manager_repositories")
load("//package_manager:dpkg.bzl", "dpkg_list", "dpkg_src")

package_manager_repositories()

dpkg_src(
    name = "debian_stretch",
    arch = "amd64",
    distro = "stretch",
    sha256 = "2b13362808b7bd90d24db2e0804c799288694ae44bd7e3d123becc191451fc67",
    snapshot = "20191007T205138Z",
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_backports",
    arch = "amd64",
    distro = "stretch-backports",
    sha256 = "bd6367868cc115619cdc97d2bdb33c913c3b114827074220df42214de542647f",
    snapshot = "20191007T205138Z",
    url = "https://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_security",
    package_prefix = "https://snapshot.debian.org/archive/debian-security/20191007T195307Z/",
    packages_gz_url = "https://snapshot.debian.org/archive/debian-security/20191007T195307Z/dists/stretch/updates/main/binary-amd64/Packages.gz",
    sha256 = "bf33fc3876b644e546ce595b60437b75b750842ae85a98a47b2c22dc1f78826e",
)

dpkg_list(
    name = "package_bundle",
    packages = [
        # Version required to skip a security fix to the pre-release library
        # TODO: Remove when there is a security fix or dpkg_list finds the recent version
        "libc6=2.24-11+deb9u4",
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
        "openjdk-8-jre-headless",
        "openjdk-11-jre-headless",

        #python
        "libpython2.7-minimal",
        "python2.7-minimal",
        "libpython2.7-stdlib",
        "dash",
        # Version required to skip a security fix to the pre-release library
        # TODO: Remove when there is a security fix or dpkg_list finds the recent version
        "libc-bin=2.24-11+deb9u4",

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
    # Takes the first package found: security updates should go first
    # If there was a security fix to a package before the stable release, this will find
    # the older security release. This happened for stretch libc6.
    sources = [
        "@debian_stretch_security//file:Packages.json",
        "@debian_stretch_backports//file:Packages.json",
        "@debian_stretch//file:Packages.json",
    ],
)

# For Jetty
http_archive(
    name = "jetty",
    build_file = "//:BUILD.jetty",
    sha256 = "c66abd7323f6df5b28690e145d2ae829dbd12b8a2923266fa23ab5139a9303c5",
    strip_prefix = "jetty-distribution-9.4.14.v20181114/",
    type = "tar.gz",
    urls = ["https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.14.v20181114/jetty-distribution-9.4.14.v20181114.tar.gz"],
)

# Node
http_archive(
    name = "nodejs",
    build_file = "//experimental/nodejs:BUILD.nodejs",
    sha256 = "2f0397bb81c1d0c9901b9aff82a933257bf60f3992227b86107111a75b9030d9",
    strip_prefix = "node-v10.16.3-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz"],
)

# dotnet
http_archive(
    name = "dotnet",
    build_file = "//experimental/dotnet:BUILD.dotnet",
    sha256 = "69ecad24bce4f2132e0db616b49e2c35487d13e3c379dabc3ec860662467b714",
    type = "tar.gz",
    urls = ["https://download.microsoft.com/download/5/F/0/5F0362BD-7D0A-4A9D-9BF9-022C6B15B04D/dotnet-runtime-2.0.0-linux-x64.tar.gz"],
)

# For the debug image
http_file(
    name = "busybox",
    executable = True,
    sha256 = "b51b9328eb4e60748912e1c1867954a5cf7e9d5294781cae59ce225ed110523c",
    urls = ["https://busybox.net/downloads/binaries/1.27.1-i686/busybox"],
)

# Docker rules.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "413bb1ec0895a8d3249a01edf24b82fd06af3c8633c9fb833a0cb1d4b234d46d",
    strip_prefix = "rules_docker-0.12.0",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.12.0.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

# Used to generate java ca certs.
container_pull(
    name = "debian9",
    # From tag: 2019-02-27-130449
    digest = "sha256:fd26dfa474b76ef931e439537daba90bbd90d6c5bbdd0252616e6d87251cd9cd",
    registry = "gcr.io",
    repository = "google-appengine/debian9",
)

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

dpkg_src(
    name = "debian10",
    arch = "amd64",
    distro = "buster",
    sha256 = "ca19e4187523f4b087a2e7aaa2662c6a0b46dc81ff2f3dd44d9c5d95df0df212",
    snapshot = "20191007T205138Z",
    url = "https://snapshot.debian.org/archive",
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
        # "libjpeg62-turbo",
        # "libpng16-16",
        # "liblcms2-2",
        # "libfreetype6",
        # "fonts-dejavu-core",
        # "fontconfig-config",
        # "libfontconfig1",
        # "openjdk-8-jre-headless",
        # "openjdk-11-jre-headless",

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
        "python3.7-minimal",

        #dotnet
        # "libcurl3",
        # "libgssapi-krb5-2",
        # "libicu57",
        # "liblttng-ust0",
        # "libssl1.0.2",
        # "libunwind8",
        # "libuuid1",
        # "zlib1g",
        # "curl",
        # "libcomerr2",
        # "libidn2-0",
        # "libk5crypto3",
        # "libkrb5-3",
        # "libldap-2.4-2",
        # "libldap-common",
        # "libsasl2-2",
        # "libnghttp2-14",
        # "libpsl5",
        # "librtmp1",
        # "libssh2-1",
        # "libkeyutils1",
        # "libkrb5support0",
        # "libunistring0",
        # "libgnutls30",
        # "libgmp10",
        # "libhogweed4",
        # "libidn11",
        # "libnettle6",
        # "libp11-kit0",
        # "libffi6",
        # "libtasn1-6",
        # "libsasl2-modules-db",
        # "libgcrypt20",
        # "libgpg-error0",
        # "libacl1",
        # "libattr1",
        # "libselinux1",
        # "libpcre3",
        # "libbz2-1.0",
        # "liblzma5",
    ],
    # Takes the first package found: security updates should go first
    # If there was a security fix to a package before the stable release, this will find
    # the older security release. This happened for stretch libc6.
    sources = [
        "@debian10_security//file:Packages.json",
        "@debian10//file:Packages.json",
    ],
)

dpkg_src(
    name = "debian10_security",
    package_prefix = "https://snapshot.debian.org/archive/debian-security/20191007T195307Z/",
    packages_gz_url = "https://snapshot.debian.org/archive/debian-security/20191007T195307Z/dists/buster/updates/main/binary-amd64/Packages.gz",
    sha256 = "ddc8d3e9708f1a44a4329fd748dc2fe128e08743a3590cf31dfc0ed3d914ff9c",
)
