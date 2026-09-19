"Macros for generating ldconfig cache for python images"

load("@rules_oci//oci:defs.bzl", "oci_load")

def python_ldconfig(images):
    """Generate ldconfig cache targets for Python images.

    Args:
        images: image target names keyed by architecture
    """

    for arch, image in images.items():
        oci_load(
            name = "load_ldconfig_" + arch,
            image = ":" + image,
            repo_tags = ["bazel/python:ldconfig_" + arch],
        )

    for arch in images:
        native.genrule(
            name = "do_load_{}".format(arch),
            outs = ["do_load_{}.done".format(arch)],
            cmd = "$(location :load_ldconfig_{arch}) && touch $@".format(
                arch = arch,
            ),
            tags = [
                "local",
                "no-sandbox",
            ],
            tools = [":load_ldconfig_" + arch],
        )

    native.sh_binary(
        name = "update_ldconfig",
        srcs = ["ldconfig/ldconfig.sh"],
        args = ["update"] + images.keys(),
        data = ["ldconfig/ldconfig.sh"] + [":do_load_{}".format(arch) for arch in images],
        tags = ["local"],
    )

    for arch in images:
        native.sh_test(
            name = "check_ldconfig_{}_test".format(arch),
            srcs = ["ldconfig/ldconfig.sh"],
            args = [
                "check",
                arch,
            ],
            data = [
                "ldconfig/ld.so.cache.{}".format(arch),
                ":do_load_{}".format(arch),
            ],
            tags = [
                arch,
                "local",
                "manual",
                "external",
                "no-cache",
            ],
        )

    native.test_suite(
        name = "check_ldconfig_tests",
        tests = [
            ":check_ldconfig_{}_test".format(arch)
            for arch in images
        ],
        tags = ["manual"],
    )
