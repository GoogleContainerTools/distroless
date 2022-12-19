# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_tarball")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

package(default_visibility = ["//visibility:public"])

ARCH = "arm64"

go_binary(
    name = "main",
    srcs = ["main.go"],
    goarch = ARCH,
    goos = "linux",
    pure = "on",
)

pkg_tar(
    name = "main_tar",
    srcs = [":main"]
)

oci_image(
    name = "go",
    base = "//base:base_root_{arch}_debian11".format(arch = ARCH),
    entrypoint = ["/main"],
    tars = [
        ":main_tar"
    ]
)

# Run
# podman load -i bazel-bin/examples/go/tarball/tarball.tar
# podman run localhost/distroless/examples/go:latest
oci_tarball(
    name = "tarball",
    repotags = ["distroless/examples/go:latest"],
    image = ":go"
)
