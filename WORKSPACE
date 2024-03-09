workspace(name = "distroless")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# rules_distroless setup
http_archive(
    name = "rules_distroless",
    # sha256 = "9306b5b8a296d95745d7b38be20c320db125f1b5f6fc3ad507de21c8d562b159",
    strip_prefix = "rules_distroless-d3d8ee9efc4e925057a3b720fff733063e2f9944",
    url = "https://github.com/GoogleContainerTools/rules_distroless/archive/d3d8ee9efc4e925057a3b720fff733063e2f9944.tar.gz",
)

load("@rules_distroless//distroless:dependencies.bzl", "distroless_dependencies")

distroless_dependencies()

load("@rules_distroless//distroless:toolchains.bzl", "distroless_register_toolchains")

distroless_register_toolchains()

# rules_oci setup
http_archive(
    name = "rules_oci",
    sha256 = "56d5499025d67a6b86b2e6ebae5232c72104ae682b5a21287770bd3bf0661abf",
    strip_prefix = "rules_oci-1.7.5",
    url = "https://github.com/bazel-contrib/rules_oci/releases/download/v1.7.5/rules_oci-v1.7.5.tar.gz",
)

load("@rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")

rules_oci_dependencies()

load("@rules_oci//oci:repositories.bzl", "LATEST_CRANE_VERSION", "LATEST_ZOT_VERSION", "oci_register_toolchains")

oci_register_toolchains(
    name = "oci",
    crane_version = LATEST_CRANE_VERSION,
    zot_version = LATEST_ZOT_VERSION,
)

load("@rules_oci//cosign:repositories.bzl", "cosign_register_toolchains")

cosign_register_toolchains(name = "oci_cosign")

# setup container_structure_test
http_archive(
    name = "container_structure_test",
    sha256 = "2da13da4c4fec9d4627d4084b122be0f4d118bd02dfa52857ff118fde88e4faa",
    strip_prefix = "container-structure-test-1.16.0",
    urls = ["https://github.com/GoogleContainerTools/container-structure-test/archive/v1.16.0.zip"],
)

load("@container_structure_test//:repositories.bzl", "container_structure_test_register_toolchain")

container_structure_test_register_toolchain(name = "cst")

# platforms
http_archive(
    name = "platforms",
    sha256 = "5308fc1d8865406a49427ba24a9ab53087f17f5266a7aabbfc28823f3916e1ca",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/platforms/releases/download/0.0.6/platforms-0.0.6.tar.gz",
        "https://github.com/bazelbuild/platforms/releases/download/0.0.6/platforms-0.0.6.tar.gz",
    ],
)

# rules_go setup
# NOTE: cannot upgrade past v0.35.0 until https://github.com/bazelbuild/rules_go/issues/3531 is resolved.
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "099a9fb96a376ccbbb7d291ed4ecbdfd42f6bc822ab77ae6f1b5cb9e914e94fa",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.19.1")

http_archive(
    name = "bazel_gazelle",
    sha256 = "29218f8e0cebe583643cbf93cae6f971be8a2484cdcfa1e45057658df8d54002",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.32.0/bazel-gazelle-v0.32.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.32.0/bazel-gazelle-v0.32.0.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

gazelle_dependencies()

go_repository(
    name = "com_github_ulikunitz_xz",
    importpath = "github.com/ulikunitz/xz",
    sum = "h1:kpFauv27b6ynzBNT/Xy+1k+fK4WswhN/6PN5WhFAGw8=",
    version = "v0.5.11",
)

go_repository(
    name = "com_github_spdx_tools_golang",
    importpath = "github.com/spdx/tools-golang",
    sum = "h1:9B623Cfs+mclYK6dsae7gLSwuIBHvlgmEup87qpqsAQ=",
    version = "v0.3.1-0.20230104082527-d6f58551be3f",
)

# Custom archives
load("//common/package:repositories.bzl", debian_repositories = "repositories")

debian_repositories()

load("//common/package:packages.bzl", debian_packages = "packages")

debian_packages()

load(":busybox_archives.bzl", busybox_repositories = "repositories")

busybox_repositories()

load(":node_archives.bzl", node_repositories = "repositories")

node_repositories()

load(":java_archives.bzl", java_repositories = "repositories")

java_repositories()

# For Jetty
http_archive(
    name = "jetty",
    add_prefix = "output",
    build_file = "//java:BUILD.jetty",
    sha256 = "b04b4cd45f3bf3c09a26bdf7f4e8d1a67e1a0f224ef4539534a0719b2c701088",
    strip_prefix = "jetty-distribution-9.4.53.v20231009/",
    type = "tar.gz",
    urls = ["https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.53.v20231009/jetty-distribution-9.4.53.v20231009.tar.gz"],
)

# rules_pkg setup
http_archive(
    name = "rules_pkg",
    sha256 = "8f9ee2dc10c1ae514ee599a8b42ed99fa262b757058f65ad3c384289ff70c4b8",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
    ],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()

# rules_rust setup
http_archive(
    name = "rules_rust",
    sha256 = "9d04e658878d23f4b00163a72da3db03ddb451273eb347df7d7c50838d698f49",
    urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.26.0/rules_rust-v0.26.0.tar.gz"],
)

load("@rules_rust//rust:repositories.bzl", "rust_register_toolchains", "rust_repositories")

rust_repositories(edition = "2021")

rust_register_toolchains()
