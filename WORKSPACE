workspace(name = "distroless")

git_repository(
    name = "io_bazel_rules_go",
    remote = "https://github.com/bazelbuild/rules_go.git",
    tag = "0.4.4",
)

load("@io_bazel_rules_go//go:def.bzl", "go_repositories")

go_repositories()

load(
    "//package_manager:package_manager.bzl",
    "package_manager_repositories",
    "dpkg_src",
    "dpkg",
)

package_manager_repositories()

dpkg_src(
    name = "debian_jessie",
    arch = "amd64",
    distro = "jessie",
    url = "http://deb.debian.org",
)

dpkg_src(
    name = "debian_jessie_backports",
    arch = "amd64",
    distro = "jessie-backports",
    url = "http://deb.debian.org",
)

# For the glibc base image.
dpkg(
    name = "libc6",
    source = "@debian_jessie//file:Packages.json",
)

dpkg(
    name = "ca-certificates",
    source = "@debian_jessie//file:Packages.json",
)

dpkg(
    name = "openssl",
    source = "@debian_jessie//file:Packages.json",
)

dpkg(
    name = "libssl1.0.0",
    source = "@debian_jessie//file:Packages.json",
)

# For Java
dpkg(
    name = "zlib1g",
    source = "@debian_jessie//file:Packages.json",
)

dpkg(
    name = "openjdk-8-jre-headless",
    source = "@debian_jessie_backports//file:Packages.json",
)

dpkg(
    name = "libgcc1",
    source = "@debian_jessie//file:Packages.json",
)

http_file(
    name = "libstdcpp6",
    sha256 = "f1509bbabd78e89c861de16931aec5988e1215649688fd4f8dfe1af875a7fbef",
    url = "http://deb.debian.org/debian/pool/main/g/gcc-4.9/libstdc++6_4.9.2-10_amd64.deb",
)

# For Python
dpkg(
    name = "libpython2.7-minimal",
    source = "@debian_jessie//file:Packages.json",
)

dpkg(
    name = "python2.7-minimal",
    source = "@debian_jessie//file:Packages.json",
)

dpkg(
    name = "libpython2.7-stdlib",
    source = "@debian_jessie//file:Packages.json",
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

# For the debug image
http_file(
    name = "busybox",
    executable = True,
    sha256 = "8d7a4ac8629db62457447673fd5e3ae857bdf5c4bda46f6c2abc53b3315f4bf5",
    url = "https://busybox.net/downloads/binaries/1.21.1/busybox-x86_64",
)

# Docker rules.
git_repository(
    name = "io_bazel_rules_docker",
    commit = "c534c7c8859dd204e5fbdabde4c0092b78648247",
    remote = "https://github.com/bazelbuild/rules_docker.git",
)

load(
    "@io_bazel_rules_docker//docker:docker.bzl",
    "docker_repositories",
)

docker_repositories()

git_repository(
    name = "runtimes_common",
    commit = "3d73b4fecbd18de77588ab5eef712d50f34f601e",
    remote = "https://github.com/GoogleCloudPlatform/runtimes-common.git",
)
