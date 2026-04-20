"Macros for generating ldconfig cache for python images"

load("@rules_oci//oci:defs.bzl", "oci_load")

def python3_ldconfig(architectures, distro):
    """Generates ldconfig cache targets for python images.

    Args:
        architectures: list of architectures to support
        distro: the distribution name (e.g. debian13)
    """

    # 1. Create the oci_load targets (the scripts that load images into docker)
    for arch in architectures:
        oci_load(
            name = "load_python3_root_{}_{}".format(arch, distro),
            image = ":python3_root_{}_{}".format(arch, distro),
            repo_tags = ["bazel/python3:python3_root_{}_{}".format(arch, distro)],
        )

    # 2. Create the genrules that actually trigger the loading during 'bazel build'
    for arch in architectures:
        native.genrule(
            name = "do_load_{}".format(arch),
            outs = ["do_load_{}.done".format(arch)],
            cmd = "$(location :load_python3_root_{arch}_{distro}) && touch $@".format(
                arch = arch,
                distro = distro,
            ),
            tags = [
                "local",
                "no-sandbox",
            ],
            tools = [":load_python3_root_{}_{}".format(arch, distro)],
        )

    # 3. Create the update_ldconfig binary
    native.sh_binary(
        name = "update_ldconfig",
        srcs = ["ldconfig/ldconfig.sh"],
        args = ["update"] + architectures,
        data = ["ldconfig/ldconfig.sh"] + [":do_load_{}".format(arch) for arch in architectures],
        tags = ["local"],
    )

    # 4. Create the architecture-specific tests
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

    # 5. Create the test suite
    native.test_suite(
        name = "check_ldconfig_tests",
        tests = [
            ":check_ldconfig_{}_test".format(arch)
            for arch in architectures
        ],
        tags = ["manual"],
    )
