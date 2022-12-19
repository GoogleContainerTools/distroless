# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_tarball")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

pkg_tar(
    name = "hello_py",
    srcs = ["hello.py"]
)

# This example runs a python program that walks the filesystem under "/etc" and prints every filename.
oci_image(
    name = "hello",
    base = "//experimental/python3:python3_root_arm64_debian11",
    cmd = ["hello.py", "/etc"],
    tars = [
        ":hello_py"
    ]
)

# Run
# podman load -i bazel-bin/examples/python3/tarball/tarball.tar
# podman run localhost/distroless/examples/py:latest
oci_tarball(
    name = "tarball",
    repotags = ["distroless/examples/py:latest"],
    image = ":hello"
)
