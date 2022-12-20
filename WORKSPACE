workspace(name = "distroless")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# rules_oci setup
# local_repository(
#     name = "contrib_rules_oci",
#     path = "../rules/rules_oci"
# )
git_repository(
    name = "contrib_rules_oci",
    remote = "https://github.com/bazel-contrib/rules_oci.git",
    commit = "835d1977718db84e8d87aa8086517cda623d0a7c",
    shallow_since = "1671569474 +0300"
)

load("@contrib_rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")

rules_oci_dependencies()

#load("@contrib_rules_oci//oci:repositories.bzl", "LATEST_CRANE_VERSION", "LATEST_ZOT_VERSION", "LATEST_COSIGN_VERSION", "oci_register_toolchains")
load("@contrib_rules_oci//oci:repositories.bzl", "LATEST_CRANE_VERSION", "LATEST_ZOT_VERSION", "oci_register_toolchains")

oci_register_toolchains(
    name = "oci",
    crane_version = LATEST_CRANE_VERSION,
    zot_version = LATEST_ZOT_VERSION,
    # cosign_version = LATEST_COSIGN_VERSION
)

# rules_go setup
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
# bazel_gazelle is used by rules_docker, and needs to be updated to override the very old version
# used in that workspace. We must use a version compatible with our version of rules_go. See:
# https://github.com/bazelbuild/bazel-gazelle#compatibility-with-rules-go
http_archive(
    name = "bazel_gazelle",
    sha256 = "222e49f034ca7a1d1231422cdb67066b885819885c356673cb1f72f748a3c9d4",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.3/bazel-gazelle-v0.22.3.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.3/bazel-gazelle-v0.22.3.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load(":debian_archives.bzl", debian_repositories = "repositories")
debian_repositories()

load(":busybox_archives.bzl", busybox_repositories = "repositories")
busybox_repositories()

load(":node_archives.bzl", node_repositories = "repositories")
node_repositories()

# For Jetty
http_archive(
    name = "jetty",
    build_file = "//java:BUILD.jetty",
    sha256 = "50d6eccd349d2e671bfea710cee833911287eb706fe1d39503eab76fc6fc1a0c",
    strip_prefix = "jetty-distribution-9.4.48.v20220622/",
    type = "tar.gz",
    urls = ["https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.48.v20220622/jetty-distribution-9.4.48.v20220622.tar.gz"],
)

# rules_pkg setup
http_archive(
    name = "rules_pkg",
    urls = ["https://github.com/bazelbuild/rules_pkg/releases/download/0.7.1/rules_pkg-0.7.1.tar.gz"],
    sha256 = "451e08a4d78988c06fa3f9306ec813b836b1d076d0f055595444ba4ff22b867f",
)
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
rules_pkg_dependencies()


# rules_rust setup
http_archive(
    name = "rules_rust",
    sha256 = "5c2b6745236f8ce547f82eeacbbcc81d736734cc8bd92e60d3e3cdfa6e167bb5",
    urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.15.0/rules_rust-v0.15.0.tar.gz"],
)
load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()
rust_register_toolchains()


# rules_docker setup. 
# NOTE: this ruleset is almost unused and replaced by rules_oci completely expect a few helper macros that'll be hosted on distroless-tools.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "92779d3445e7bdc79b961030b996cb0c91820ade7ffa7edca69273f404b085d5",
    strip_prefix = "rules_docker-0.20.0",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.20.0/rules_docker-v0.20.0.tar.gz"],
)
