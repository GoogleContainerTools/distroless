load("@rules_oci//oci:defs.bzl", "oci_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@rules_cc//cc:cc_binary.bzl", "cc_binary")

def cc_image(name, srcs, base):
    cc_binary(
        name = "%s_binary" % name,
        srcs = srcs,
    )

    pkg_tar(
        name = "%s_layer" % name,
        srcs = [
            ":%s_binary" % name,
        ],
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
    )
