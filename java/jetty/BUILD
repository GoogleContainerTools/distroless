load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_oci//oci:defs.bzl", "oci_image")
load("//base:distro.bzl", DISTROS = "LANGUAGE_DISTROS")

package(default_visibility = ["//visibility:public"])

[oci_image(
    name = rule_name,
    base = base_image,
    cmd = ["/jetty/start.jar"],
    tars = ["@jetty//:jetty"],
    workdir = "/jetty",
    # We expect users to add their WAR under /jetty/webapps.
) for (rule_name, base_image) in [
    ("jetty_java11_debian11", "//java:java11_root_amd64_debian11"),
    ("jetty_java11_debug_debian11", "//java:java11_debug_root_amd64_debian11"),
]]

[container_structure_test(
    name = "jetty_java11_" + distro + "_test",
    configs = ["testdata/java11.yaml"],
    image = ":jetty_java11_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
) for distro in DISTROS]

[container_structure_test(
    name = "jetty_java11_debug_" + distro + "_test",
    configs = ["testdata/java11_debug.yaml"],
    image = ":jetty_java11_debug_" + distro,
    tags = [
        "amd64",
        "manual",
    ],
) for distro in DISTROS]
