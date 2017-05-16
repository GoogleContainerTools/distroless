workspace(name = "distroless")

git_repository(
    name = "io_bazel_rules_go",
    remote = "https://github.com/bazelbuild/rules_go.git",
    tag = "0.4.0",
)

load("@io_bazel_rules_go//go:def.bzl", "go_repositories")

go_repositories()

# For the glibc base image.
http_file(
   name = "glibc",
   url = "http://deb.debian.org/debian/pool/main/g/glibc/libc6-udeb_2.19-18+deb8u9_amd64.udeb",
   sha256 = "017146eb35bcc93e301e52e9fe9bf2093d17f40dcf65911bf206be4475bdbc1d",
)

http_file(
    name = "ca_certificates",
    url = "http://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20141019+deb8u3_all.deb",
    sha256 = "bd799f47f5ae3260b6402b1fe19fe2c37f2f4125afcd19327bf69a9cf436aeff",
)

http_file(
    name = "openssl",
    url = "http://deb.debian.org/debian/pool/main/o/openssl/openssl_1.0.1t-1+deb8u6_amd64.deb",
    sha256 = "41613658b4e93ffaa7de25060a4a1ab2f8dfa1ee15ed90aeac850a9bf5a134bb",
)

http_file(
    name = "libssl",
    url = "http://deb.debian.org/debian/pool/main/o/openssl/libssl1.1-udeb_1.1.0e-1_amd64.udeb",
    sha256 = "d3819ceeb2becc96aea4b0fceda48f6e68f84193526bc67f6895c00796ee99d6",
)

# For the debug image
http_file(
    name = "busybox",
    executable = True,
    url = "https://busybox.net/downloads/binaries/1.21.1/busybox-x86_64"
)

# For Java
http_file(
   name = "zlib",
   url = "http://ftp.us.debian.org/debian/pool/main/z/zlib/zlib1g_1.2.8.dfsg-2+b1_amd64.deb",
   sha256 = "b75102f61ace79c14ea6f06fdd9509825ee2af694c6aa503253df4e6659d6772",
)

http_file(
   name = "openjdk_jre8",
   url = "http://ftp.us.debian.org/debian/pool/main/o/openjdk-8/openjdk-8-jre-headless_8u121-b13-1~bpo8+1_amd64.deb",
   sha256 = "16c3846091ab2ba9ff5938a8ace017ef2b8aafa1585f2eed120da26d30d658a5",
)

http_file(
   name = "libstdcpp6",
   url = "http://ftp.us.debian.org/debian/pool/main/g/gcc-4.9/libstdc++6_4.9.2-10_amd64.deb",
   sha256 = "f1509bbabd78e89c861de16931aec5988e1215649688fd4f8dfe1af875a7fbef",
)

http_file(
   name = "libgcc1",
   url = "http://ftp.us.debian.org/debian/pool/main/g/gcc-4.9/libgcc1_4.9.2-10_amd64.deb",
   sha256 = "a1402290165e8d91b396a33d79580a4501041e92bdb62ef23929a0c207cd9af9",
)

# Docker rules.
git_repository(
    name = "io_bazel_rules_docker",
    remote = "https://github.com/bazelbuild/rules_docker.git",
    commit = "cd0363f77182689303f3d5a871348fa8ab78491e",
)

load(
  "@io_bazel_rules_docker//docker:docker.bzl",
  "docker_repositories",
)
docker_repositories()
