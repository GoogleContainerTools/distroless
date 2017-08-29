workspace(name = "distroless")

git_repository(
    name = "io_bazel_rules_go",
    remote = "https://github.com/bazelbuild/rules_go.git",
    tag = "0.5.3",
)

load("@io_bazel_rules_go//go:def.bzl", "go_repositories")

go_repositories()

# To build the par file for the deb_file_loader helper program in deb_helper
git_repository(
    name = "subpar",
    remote = "https://github.com/google/subpar",
    tag = "1.0.0",
)

# An example of actually using the new rules of this project:

# Load the rules
load(
    "//deb_helper:deb_helper.bzl",
    "deb_loader",
    "deb_packages",
)

# Initialize the deb_loader which downloads the deb files in deb_packages rules
deb_loader()

# For every source of deb packages create a deb_packages rule
# The name does not have to be like the one here, but it helps to know which source is used in BUILD files
deb_packages(
    name = "debian_jessie_amd64",
    architecture = "amd64",
    distro = "jessie",
    distro_type = "debian",
    mirrors = [
        "http://deb.debian.org",
    ],
    packages = {
        "ca-certificates": "pool/main/c/ca-certificates/ca-certificates_20141019+deb8u3_all.deb",
        "libc6": "pool/main/g/glibc/libc6_2.19-18+deb8u10_amd64.deb",
        "libgcc1": "pool/main/g/gcc-4.9/libgcc1_4.9.2-10_amd64.deb",
        "libjemalloc1": "pool/main/j/jemalloc/libjemalloc1_3.6.0-3_amd64.deb",
        "libpython2.7-minimal": "pool/main/p/python2.7/libpython2.7-minimal_2.7.9-2+deb8u1_amd64.deb",
        "libpython2.7-stdlib": "pool/main/p/python2.7/libpython2.7-stdlib_2.7.9-2+deb8u1_amd64.deb",
        "libssl1.0.0": "pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u6_amd64.deb",
        "libstdc++6": "pool/main/g/gcc-4.9/libstdc++6_4.9.2-10_amd64.deb",
        "netbase": "pool/main/n/netbase/netbase_5.3_all.deb",
        "openssl": "pool/main/o/openssl/openssl_1.0.1t-1+deb8u6_amd64.deb",
        "python2.7-minimal": "pool/main/p/python2.7/python2.7-minimal_2.7.9-2+deb8u1_amd64.deb",
        "zlib1g": "pool/main/z/zlib/zlib1g_1.2.8.dfsg-2+b1_amd64.deb",
    },
    packages_sha256 = {
        "ca-certificates": "bd799f47f5ae3260b6402b1fe19fe2c37f2f4125afcd19327bf69a9cf436aeff",
        "libc6": "0a95ee1c5bff7f73c1279b2b78f32d40da9025a76f93cb67c03f2867a7133e61",
        "libgcc1": "a1402290165e8d91b396a33d79580a4501041e92bdb62ef23929a0c207cd9af9",
        "libjemalloc1": "caeeb8b60bee0b732de25b6091dae30d58f1cebcf7467900525d5d266d4360ba",
        "libpython2.7-minimal": "916e2c541aa954239cb8da45d1d7e4ecec232b24d3af8982e76bf43d3e1758f3",
        "libpython2.7-stdlib": "cf1c9dfc12d6cfd42bb14bfb46ee3cec0f6ebc720a1419f017396739953b12c5",
        "libssl1.0.0": "0fc777d9242fd93851eb49c4aafd22505048b7797c0178f20c909ff918320619",
        "libstdc++6": "f1509bbabd78e89c861de16931aec5988e1215649688fd4f8dfe1af875a7fbef",
        "netbase": "3979bdd40c5666ef9bf71a5391ba01ad38e264f2ec96d289993f2a0805616dd3",
        "openssl": "41613658b4e93ffaa7de25060a4a1ab2f8dfa1ee15ed90aeac850a9bf5a134bb",
        "python2.7-minimal": "c89199f908d5a508d8d404efc0e1aef3d9db59ea23bd4532df9e59941643fcfb",
        "zlib1g": "b75102f61ace79c14ea6f06fdd9509825ee2af694c6aa503253df4e6659d6772",
    },
)

deb_packages(
    name = "debian_jessie_backports_amd64",
    architecture = "amd64",
    distro = "jessie-backports",
    distro_type = "debian",
    mirrors = [
        "http://deb.debian.org",
    ],
    packages = {
        "openjdk-8-jre-headless": "pool/main/o/openjdk-8/openjdk-8-jre-headless_8u131-b11-1~bpo8+1_amd64.deb",
        "redis-server": "pool/main/r/redis/redis-server_3.2.8-2~bpo8+1_amd64.deb",
    },
    packages_sha256 = {
        "openjdk-8-jre-headless": "11c592e237549d74bda30875979c2a937588667d10307c7c14047b8d03f5718a",
        "redis-server": "660fb0b07fad591fe6b44f547c0314b91f2fa1515375c51d7cf8be01072e1206",
    },
)

# In the BUILD file where you want to use this source, add a line like this (always @<rule_name>//debs:deb_packages.bzl):
#
# load("@debian_jessie_amd64//debs:deb_packages.bzl", "debian_jessie_amd64")
#
# and in the docker_build rule refer to packages like this:
#
# docker_build(
#     debs = [
#         debian_jessie_amd64["foo"],
#         [...]

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
    commit = "b65749d4ae364986ace9ce15d29708b266921d80",
    remote = "https://github.com/bazelbuild/rules_docker.git",
)

load(
    "@io_bazel_rules_docker//docker:docker.bzl",
    "docker_repositories",
)

docker_repositories()

# Have the py_image dependencies for testing.
load(
    "@io_bazel_rules_docker//docker/contrib/python:image.bzl",
    _py_image_repos = "repositories",
)

_py_image_repos()

# Have the java_image dependencies for testing.
load(
    "@io_bazel_rules_docker//docker/contrib/java:image.bzl",
    _java_image_repos = "repositories",
)

_java_image_repos()

# Have the go_image dependencies for testing.
load(
    "@io_bazel_rules_docker//docker/contrib/go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

git_repository(
    name = "runtimes_common",
    remote = "https://github.com/GoogleCloudPlatform/runtimes-common.git",
    tag = "v0.1.0",
)
