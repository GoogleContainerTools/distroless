"rust_image rule for creating Rust container images"

load("@rules_oci//oci:defs.bzl", "oci_image")
load("//private/util:tar.bzl", "tar")
load("@rules_rust//rust:defs.bzl", "rust_binary")

def rust_image(name, srcs, base, tags):
    rust_binary(
        name = "%s_binary" % name,
        srcs = srcs,
        tags = tags,
    )

    tar(
        name = "%s_layer" % name,
        extension = "tar.gz",
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
