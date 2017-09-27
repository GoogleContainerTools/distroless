workspace(name = "distroless")

git_repository(
    name = "io_bazel_rules_go",
    remote = "https://github.com/bazelbuild/rules_go.git",
    tag = "0.5.5",
)

load("@io_bazel_rules_go//go:def.bzl", "go_repositories")

go_repositories()

load(
    "//package_manager:package_manager.bzl",
    "package_manager_repositories",
    "dpkg_src",
    "dpkg_list",
)

package_manager_repositories()

dpkg_src(
    name = "debian_jessie",
    arch = "amd64",
    distro = "jessie",
    sha256 = "142cceae78a1343e66a0d27f1b142c406243d7940f626972c2c39ef71499ce61",
    snapshot = "20170821T035341Z",
    url = "http://snapshot.debian.org/archive",
)

dpkg_src(
    name = "debian_jessie_backports",
    arch = "amd64",
    distro = "jessie-backports",
    sha256 = "eba769f0a0bcaffbb82a8b61d4a9c8a0a3299d5111a68daeaf7e50cc0f76e0ab",
    snapshot = "20170821T035341Z",
    url = "http://snapshot.debian.org/archive",
)

dpkg_list(
    name = "package_bundle",
    packages = [
        "libc6",
        "ca-certificates",
        "openssl",
        "libssl1.0.0",
        "netbase",
        "tzdata",

        #java
        "zlib1g",
        "libgcc1",
        "libstdc++6",
        "openjdk-8-jre-headless",

        #python
        "libpython2.7-minimal",
        "python2.7-minimal",
        "libpython2.7-stdlib",

        #dotnet
        "libcurl3",
        "libgssapi-krb5-2",
        "libicu52",
        "liblttng-ust0",
        "libunwind8",
        "libuuid1",
        "liblzma5",
    ],
    sources = [
        "@debian_jessie//file:Packages.json",
        "@debian_jessie_backports//file:Packages.json",
    ],
)

# For Jetty
new_http_archive(
    name = "jetty",
    build_file = "BUILD.jetty",
    sha256 = "ca93c7f88e842fcb1e7bd551c071b3302b7be1faf9cad3ce415af19c77d6cb74",
    strip_prefix = "jetty-distribution-9.4.4.v20170414/",
    type = "tgz",
    url = "http://central.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.4.v20170414/jetty-distribution-9.4.4.v20170414.tar.gz",
)

# Node
new_http_archive(
    name = "nodejs",
    build_file = "BUILD.nodejs",
    sha256 = "c6a60f823a4df31f1ed3a4044d250e322f2f2794d97798d47c6ee4af9376f927",
    strip_prefix = "node-v6.10.3-linux-x64/",
    type = "tgz",
    url = "https://nodejs.org/dist/v6.10.3/node-v6.10.3-linux-x64.tar.gz",
)

# dotnet
new_http_archive(
    name = "dotnet",
    build_file = "BUILD.dotnet",
    sha256 = "69ecad24bce4f2132e0db616b49e2c35487d13e3c379dabc3ec860662467b714",
    type = "tgz",
    url = "https://download.microsoft.com/download/5/F/0/5F0362BD-7D0A-4A9D-9BF9-022C6B15B04D/dotnet-runtime-2.0.0-linux-x64.tar.gz",
)

# For the debug image
http_file(
    name = "busybox",
    executable = True,
    sha256 = "b51b9328eb4e60748912e1c1867954a5cf7e9d5294781cae59ce225ed110523c",
    url = "https://busybox.net/downloads/binaries/1.27.1-i686/busybox",
)

# Docker rules.
git_repository(
    name = "io_bazel_rules_docker",
    commit = "839a297d4e874216b4fd93f09dd35be5592dc10e",
    remote = "https://github.com/bazelbuild/rules_docker.git",
)

load(
    "@io_bazel_rules_docker//docker:docker.bzl",
    "docker_repositories",
    "docker_pull",
)

# Used to generate java ca certs.
docker_pull(
    name = "debian8",
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
