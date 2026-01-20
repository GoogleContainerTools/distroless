"cc_image rule for creating C++ container images"

load("@rules_cc//cc:cc_binary.bzl", "cc_binary")
load("@rules_oci//oci:defs.bzl", "oci_image")
load("//private/util:tar.bzl", "pkg_tar")

def cc_image(name, srcs, base):
    cc_binary(
        name = "%s_binary" % name,
        srcs = srcs,
    )

    pkg_tar(
        name = "%s_layer" % name,
        extension = "tar.gz",
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
