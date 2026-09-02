"Macros for generating ldconfig cache for python images"

load("@rules_oci//oci:defs.bzl", "oci_load")

def python_ldconfig(architectures, distro):
    """Generate ldconfig cache targets for Python images.

    Args:
        architectures: architectures to support
        distro: distribution name, such as debian13
    """

    for arch in architectures:
        oci_load(
            name = "load_python314_root_{}_{}".format(arch, distro),
            image = ":python314_root_{}_{}".format(arch, distro),
            repo_tags = ["bazel/python:python314_root_{}_{}".format(arch, distro)],
        )

    for arch in architectures:
        native.genrule(
            name = "do_load_{}".format(arch),
            outs = ["do_load_{}.done".format(arch)],
            cmd = "$(location :load_python314_root_{arch}_{distro}) && touch $@".format(
                arch = arch,
                distro = distro,
            ),
            tags = [
                "local",
                "no-sandbox",
            ],
            tools = [":load_python314_root_{}_{}".format(arch, distro)],
        )

    native.sh_binary(
        name = "update_ldconfig",
        srcs = ["ldconfig/ldconfig.sh"],
        args = ["update"] + architectures,
        data = ["ldconfig/ldconfig.sh"] + [":do_load_{}".format(arch) for arch in architectures],
        tags = ["local"],
    )

    for arch in architectures:
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
            for arch in architectures
        ],
        tags = ["manual"],
    )
