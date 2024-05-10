load("@rules_oci//oci:defs.bzl", "oci_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

def java_image(name, srcs, main_class, base):
    native.java_binary(
        name = "%s_binary" % name,
        srcs = srcs,
        main_class = main_class,
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
        cmd = [
            "/%s_binary.jar" % name,
        ],
        tars = [
            ":%s_layer" % name,
        ],
    )
