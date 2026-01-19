"go_image rule for creating Go container images"

load("@rules_go//go:def.bzl", "go_binary")
load("@rules_oci//oci:defs.bzl", "oci_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

def go_image(name, srcs, base, arch = "amd64", os = "linux"):
    go_binary(
        name = "{}_binary".format(name),
        srcs = srcs,
        goarch = arch,
        goos = os,
        pure = "on",
    )

    pkg_tar(
        name = "{}_layer".format(name),
        extension = "tar.gz",
        srcs = ["{}_binary".format(name)],
    )

    oci_image(
        name = name,
        base = base,
        entrypoint = ["/{}_binary".format(name)],
        tars = [
            "{}_layer".format(name),
        ],
    )
