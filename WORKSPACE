workspace(name = "distroless")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# rules_oci setup
http_archive(
    name = "contrib_rules_oci",
    strip_prefix = "rules_oci-91327d960263fac3c038c1900bb2ae398a4122f1",
    url = "https://github.com/bazel-contrib/rules_oci/archive/91327d960263fac3c038c1900bb2ae398a4122f1.tar.gz",
)

load("@contrib_rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")
rules_oci_dependencies()

load("@contrib_rules_oci//oci:repositories.bzl", "LATEST_CRANE_VERSION", "LATEST_ZOT_VERSION", "oci_register_toolchains")
oci_register_toolchains(
    name = "oci",
    crane_version = LATEST_CRANE_VERSION,
    zot_version = LATEST_ZOT_VERSION,
)

load("@contrib_rules_oci//cosign:repositories.bzl", "cosign_register_toolchains")
cosign_register_toolchains(name = "oci_cosign")

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
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "dd926a88a564a9246713a9c00b35315f54cbd46b31a26d5d8fb264c07045f05d",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.19.5")

http_archive(
    name = "bazel_gazelle",
    sha256 = "ecba0f04f96b4960a5b250c8e8eeec42281035970aa8852dda73098274d14a1d",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.29.0/bazel-gazelle-v0.29.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.29.0/bazel-gazelle-v0.29.0.tar.gz",
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
load(":debian_archives.bzl", debian_repositories = "repositories")

debian_repositories()

load(":busybox_archives.bzl", busybox_repositories = "repositories")

busybox_repositories()

load(":node_archives.bzl", node_repositories = "repositories")

node_repositories()

# For Jetty
http_archive(
    name = "jetty",
    add_prefix = "output",
    build_file = "//java:BUILD.jetty",
    sha256 = "50d6eccd349d2e671bfea710cee833911287eb706fe1d39503eab76fc6fc1a0c",
    strip_prefix = "jetty-distribution-9.4.48.v20220622/",
    type = "tar.gz",
    urls = ["https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.48.v20220622/jetty-distribution-9.4.48.v20220622.tar.gz"],
)

# rules_pkg setup
http_archive(
    name = "rules_pkg",
    sha256 = "451e08a4d78988c06fa3f9306ec813b836b1d076d0f055595444ba4ff22b867f",
    urls = ["https://github.com/bazelbuild/rules_pkg/releases/download/0.7.1/rules_pkg-0.7.1.tar.gz"],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()

# rules_rust setup
http_archive(
    name = "rules_rust",
    sha256 = "2466e5b2514772e84f9009010797b9cd4b51c1e6445bbd5b5e24848d90e6fb2e",
    urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.18.0/rules_rust-v0.18.0.tar.gz"],
)

load("@rules_rust//rust:repositories.bzl", "rust_register_toolchains", "rust_repositories")

rust_repositories(edition = "2021")

rust_register_toolchains()

# rules_docker setup.
# NOTE: this ruleset is almost unused and replaced by rules_oci completely expect a few helper macros that'll be hosted on distroless-tools.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "92779d3445e7bdc79b961030b996cb0c91820ade7ffa7edca69273f404b085d5",
    strip_prefix = "rules_docker-0.20.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.20.0/rules_docker-v0.20.0.tar.gz"],
)
