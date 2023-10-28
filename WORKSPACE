workspace(name = "distroless")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# rules_oci setup
http_archive(
    name = "contrib_rules_oci",
    sha256 = "d6bdc1767d326c67b4cbdc79abfed00c8a4ca14b92adea9faf3db4710d514596",
    strip_prefix = "rules_oci-0.3.2",
    url = "https://github.com/bazel-contrib/rules_oci/releases/download/v0.3.2/rules_oci-v0.3.2.tar.gz",
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
load(":debian_archives.bzl", debian_repositories = "repositories")

debian_repositories()

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
    sha256 = "50d6eccd349d2e671bfea710cee833911287eb706fe1d39503eab76fc6fc1a0c",
    strip_prefix = "jetty-distribution-9.4.48.v20220622/",
    type = "tar.gz",
    urls = ["https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.48.v20220622/jetty-distribution-9.4.48.v20220622.tar.gz"],
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

# rules_docker setup.
# NOTE: this ruleset is almost unused and replaced by rules_oci completely expect a few helper macros that'll be hosted on distroless-tools.
http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
)
