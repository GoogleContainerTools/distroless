# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_load")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//python3:config.bzl", DISTROS = "PYTHON_DISTROS")

pkg_tar(
    name = "hello_py",
    srcs = ["hello.py"],
)

# This example runs a python program that walks the filesystem under "/etc" and prints every filename.
[
    oci_image(
        name = "hello_" + distro,
        base = "//python3:python3_root_amd64_" + distro,
        cmd = [
            "hello.py",
            "/etc",
        ],
        tars = [
            ":hello_py",
        ],
    )
    for distro in DISTROS
]

# Run
# podman load -i bazel-bin/examples/python3/tarball/tarball.tar
# podman run localhost/distroless/examples/py:latest
[
    oci_load(
        name = "tarball_" + distro,
        image = ":hello_" + distro,
        repo_tags = ["distroless/examples/py:latest"],
    )
    for distro in DISTROS
]
