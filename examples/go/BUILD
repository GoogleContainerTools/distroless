# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@rules_oci//oci:defs.bzl", "oci_load")
load("//private/oci:defs.bzl", "go_image")

package(default_visibility = ["//visibility:public"])

go_image(
    name = "go_example",
    srcs = ["main.go"],
    base = "//base:base_root_amd64_debian12",
)

# Run
# bazel run //examples/go:tarball
# podman run localhost/distroless/examples/go:latest
oci_load(
    name = "tarball",
    image = ":go_example",
    repo_tags = ["distroless/examples/go:latest"],
)
