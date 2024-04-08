load("@rules_oci//oci:defs.bzl", "oci_image")
load("@rules_rust//rust:defs.bzl", "rust_binary")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

def rust_image(name, srcs, base, tags):
    rust_binary(
        name = "%s_binary" % name,
        srcs = srcs,
        tags = tags,
    )

    pkg_tar(
        name = "%s_layer" % name,
        srcs = [
            ":%s_binary" % name,
        ],
        tags = tags,
    )

    oci_image(
        name = name,
        base = base,
        entrypoint = [
            "/%s_binary" % name,
        ],
        tars = [
            ":%s_layer" % name,
        ],
        tags = tags,
    )
