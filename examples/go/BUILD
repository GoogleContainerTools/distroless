# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@contrib_rules_oci//oci:defs.bzl", "oci_tarball")
load("//private/oci:defs.bzl", "go_image")

package(default_visibility = ["//visibility:public"])


go_image(
    name = "go_example",
    base = "//base:base_root_amd64_debian11",
    srcs = ["main.go"],
)

# Run
# bazel build //examples/go:tarball
# podman load -i bazel-bin/examples/go/tarball/tarball.tar
# podman run localhost/distroless/examples/go:latest
oci_tarball(
    name = "tarball",
    repotags = ["distroless/examples/go:latest"],
    image = ":go_example"
)
