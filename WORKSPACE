workspace(name = "distroless")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

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

http_archive(
    name = "rules_deb_packages",
    sha256 = "1584202216c4ac1b2263fd40865815aba7ae4059360cbe9191000322a45159a0",
    urls = ["https://github.com/petermylemans/rules_deb_packages/releases/download/v0.2.0/rules_deb_packages.tar.gz"],
)

load("@rules_deb_packages//:repositories.bzl", "deb_packages_dependencies")

deb_packages_dependencies()

http_file(
    name = "debian10_archive_key",
    sha256 = "9c854992fc6c423efe8622c3c326a66e73268995ecbe8f685129063206a18043",
    urls = ["https://ftp-master.debian.org/keys/archive-key-10.asc"],
)

http_file(
    name = "debian10_security_archive_key",
    sha256 = "4cf886d6df0fc1c185ce9fb085d1cd8d678bc460e6267d80a833d7ea507a0fbd",
    urls = ["https://ftp-master.debian.org/keys/archive-key-10-security.asc"],
)

http_file(
    name = "debian9_archive_key",
    sha256 = "33b6a997460e177804cc44c7049a19350c11034719219390b22887471f0a2b5e",
    urls = ["https://ftp-master.debian.org/keys/archive-key-9.asc"],
)

http_file(
    name = "debian9_security_archive_key",
    sha256 = "4adecda0885f192b82c19fde129ca9d991f937437835a058da355b352a97e7dc",
    urls = ["https://ftp-master.debian.org/keys/archive-key-9-security.asc"],
)

load(":packages_amd64_debian9.bzl", "packages_amd64_debian9")
load(":packages_arm64_debian9.bzl", "packages_arm64_debian9")

packages_amd64_debian9()

packages_arm64_debian9()

load(":packages_amd64_debian10.bzl", "packages_amd64_debian10")
load(":packages_arm64_debian10.bzl", "packages_arm64_debian10")

packages_amd64_debian10()

packages_arm64_debian10()

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
    name = "nodejs10_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "aa7e9e1d8abcc169119bf5c56ede515689f2644ccc4d40ca0fc33756a3deb1f7",
    strip_prefix = "node-v10.22.0-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v10.22.0/node-v10.22.0-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs12_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "8cdacecc43c35bcfa5474c793b9e7a01835e4171264f7b13f3e57093371872e9",
    strip_prefix = "node-v12.18.3-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v12.18.3/node-v12.18.3-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs14_amd64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "5e2c59200c86c37a0c800fe2cd2cfabc459f8a3ae3f83c3611483c485ad32e4f",
    strip_prefix = "node-v14.6.0-linux-x64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v14.6.0/node-v14.6.0-linux-x64.tar.gz"],
)

http_archive(
    name = "nodejs10_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "8e59eb6865f704785a9aa53ccf9f4cb10412caaf778cee617241a0d0684e008d",
    strip_prefix = "node-v10.22.0-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v10.22.0/node-v10.22.0-linux-arm64.tar.gz"],
)

http_archive(
    name = "nodejs12_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "f2b8b7f34966a03f03fcd89fa4924fb97ea680eae4c4e02ff1aafd9ea89ecad8",
    strip_prefix = "node-v12.18.3-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v12.18.3/node-v12.18.3-linux-arm64.tar.gz"],
)

http_archive(
    name = "nodejs14_arm64",
    build_file = "//nodejs:BUILD.nodejs",
    sha256 = "eb4f98efe22057a831415c2367416330878f0e1ad9a9bb5c25a6631031588075",
    strip_prefix = "node-v14.6.0-linux-arm64/",
    type = "tar.gz",
    urls = ["https://nodejs.org/dist/v14.6.0/node-v14.6.0-linux-arm64.tar.gz"],
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
    name = "busybox_arm64",
    executable = True,
    sha256 = "141adb1b625a6f44c4b114f76b4387b4ea4f7ab802b88eb40e0d2f6adcccb1c3",
    urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-armv8l"],
)

# Docker rules.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "cf53839c398e464b10ec2fbeb11aedb446f078c28e3b4ce372461bb105ef435c",
    strip_prefix = "rules_docker-f8478e57ab7457e403fda474f06ac0bb120d92a7",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/f8478e57ab7457e403fda474f06ac0bb120d92a7.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//repositories:pip_repositories.bzl", "pip_deps")

pip_deps()

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
        # Master branch as of 2020-09-29
        "https://github.com/bazelbuild/rules_rust/archive/c409198dcc26a276dfca8bb83c8941052c7dad5b.tar.gz",
    ],
)

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")
