workspace(name = "distroless")

git_repository(
    name = "io_bazel_rules_go",
    remote = "https://github.com/bazelbuild/rules_go.git",
    tag = "0.7.0",
)

load("@io_bazel_rules_go//go:def.bzl", "go_rules_dependencies", "go_register_toolchains")

go_rules_dependencies()

go_register_toolchains()

load(
    "//package_manager:package_manager.bzl",
    "package_manager_repositories",
    "dpkg_src",
    "dpkg_list",
)

package_manager_repositories()

dpkg_src(
    name = "debian_stretch",
    arch = "amd64",
    distro = "stretch",
    sha256 = "186cb62b5b21c778637c0aac0e74c3fdefcdd5853065645ace65503232eab25a",
    snapshot = "20180130T043019Z",
    url = "http://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_backports",
    arch = "amd64",
    distro = "stretch-backports",
    sha256 = "bb4c9c16c4235376f71ea58b2e8c48428c10d5fd351d0caccd67cf1065bf9e52",
    snapshot = "20180130T043019Z",
    url = "http://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_stretch_security",
    package_prefix = "http://snapshot.debian.org/archive/debian-security/20180130T144658Z",
    packages_gz_url = "http://snapshot.debian.org/archive/debian-security/20180130T144658Z/dists/stretch/updates/main/binary-amd64/Packages.gz",
    sha256 = "517e8a015226f97e71640a9d68372e6f4a873be29fd63cf860d5add914df843f",
)

dpkg_list(
    name = "package_bundle",
    packages = [
        "libc6",
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
        "openjdk-8-jre-headless",

        #python
        "libpython2.7-minimal",
        "python2.7-minimal",
        "libpython2.7-stdlib",

        #python3
        "libpython3.5-minimal",
        "python3.5-minimal",
        "libpython3.5-stdlib",

        #dotnet
        "libcurl3",
        "libgssapi-krb5-2",
        "libicu57",
        "liblttng-ust0",
        "libunwind8",
        "libuuid1",
        "liblzma5",
    ],
    sources = [
        "@debian_stretch//file:Packages.json",
        "@debian_stretch_backports//file:Packages.json",
        "@debian_stretch_security//file:Packages.json",
    ],
)

# For Jetty
new_http_archive(
    name = "jetty",
    build_file = "BUILD.jetty",
    sha256 = "ca93c7f88e842fcb1e7bd551c071b3302b7be1faf9cad3ce415af19c77d6cb74",
    strip_prefix = "jetty-distribution-9.4.4.v20170414/",
    type = "tar.gz",
    urls = ["http://central.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.4.v20170414/jetty-distribution-9.4.4.v20170414.tar.gz"],
)

# Node
new_http_archive(
    name = "nodejs",
    build_file = "BUILD.nodejs",
    sha256 = "0e49da19cdf4c89b52656e858346775af21f1953c308efbc803b665d6069c15c",
    strip_prefix = "node-v8.9.1-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v8.9.1/node-v8.9.1-linux-x64.tar.gz"],
)

# dotnet
new_http_archive(
    name = "dotnet",
    build_file = "BUILD.dotnet",
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
git_repository(
    name = "io_bazel_rules_docker",
    remote = "https://github.com/bazelbuild/rules_docker.git",
    tag = "v0.4.0",
)

load(
    "@io_bazel_rules_docker//docker:docker.bzl",
    "docker_repositories",
    "docker_pull",
)

# Used to generate java ca certs.
docker_pull(
    name = "debian8",
    # From tag: 2017-09-11-115552
    digest = "sha256:6d381d0bf292e31291136cff03b3209eb40ef6342fb790483fa1b9d3af84ae46",
    registry = "gcr.io",
    repository = "google-appengine/debian8",
)

docker_repositories()

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

git_repository(
    name = "runtimes_common",
    remote = "https://github.com/GoogleCloudPlatform/runtimes-common.git",
    tag = "v0.1.0",
)
