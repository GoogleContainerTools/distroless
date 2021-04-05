package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("@package_bundle_amd64_debian10//file:packages.bzl", versions_amd64_debian10 = "versions")
load("//cacerts:java.bzl", "cacerts_java")
load("//java:jre_ver.bzl", "jre_ver")

DISTRO_VERSIONS = {
    "_debian10": versions_amd64_debian10,
}

USERS = [
    "root",
    "nonroot",
]

[
    container_image(
        name = "java_base" + mode + "_" + user + distro_suffix,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_" + user + "_amd64" + distro_suffix,
        debs = [
            DISTRO_PACKAGES["amd64"][distro_suffix]["zlib1g"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libjpeg62-turbo"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libpng16-16"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["liblcms2-2"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libfreetype6"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["fonts-dejavu-core"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["fontconfig-config"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libexpat1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libfontconfig1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libuuid1"],
        ],
        env = {"LANG": "C.UTF-8"},
        tars = [
            "//cacerts:cacerts_java_amd64" + distro_suffix,
            "//locale:locale_amd64" + distro_suffix,
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_image(
        name = rule_name + "_" + user + distro_suffix,
        base = ":java_base" + ("_debug" if ("debug" in rule_name) else "") + "_" + user + distro_suffix,
        debs = [DISTRO_PACKAGES["amd64"][distro_suffix][deb] for deb in java_debs],
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {"JAVA_VERSION": jre_ver(DISTRO_VERSIONS[distro_suffix][java_debs[0]])},
        symlinks = {"/usr/bin/java": java_executable_path},
    )
    for (distro_suffix, rule_name, java_debs, java_executable_path) in [
        (
            "_debian10",
            "java11",
            ["openjdk-11-jre-headless"],
            "/usr/lib/jvm/java-11-openjdk-amd64/bin/java",
        ),
        (
            "_debian10",
            "java11_debug",
            [
                "openjdk-11-jre-headless",
                "openjdk-11-jdk-headless",
            ],
            "/usr/lib/jvm/java-11-openjdk-amd64/bin/java",
        ),
    ]
    for user in USERS
]

[
    container_test(
        name = "java_base" + mode + "_" + user + distro_suffix + "_test",
        configs = ["testdata/java_base" + mode + ".yaml"],
        image = ":java_base" + mode + "_" + user + distro_suffix,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_test(
        name = "java11_" + user + distro_suffix + "_test",
        configs = ["testdata/java11" + distro_suffix + ".yaml"],
        image = ":java11_" + user + distro_suffix,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_test(
        name = "java11_debug_" + user + distro_suffix + "_test",
        configs = ["testdata/java11_debug" + distro_suffix + ".yaml"],
        image = ":java11_debug_" + user + distro_suffix,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
]

RULE_NAMES = [
    "java11_root_debian10",
    "java11_nonroot_debian10",
]

[
    java_image(
        name = "check_certs_" + rule_name,
        srcs = ["testdata/CheckCerts.java"],
        base = "//java:" + rule_name,
        main_class = "testdata.CheckCerts",
    )
    for rule_name in RULE_NAMES
]

[
    container_test(
        name = "check_certs_" + rule_name + "_test",
        configs = ["testdata/" + rule_name + "_certs.yaml"],
        image = ":check_certs_" + rule_name,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for rule_name in RULE_NAMES
]

[
    java_image(
        name = "check_encoding_" + rule_name,
        srcs = ["testdata/CheckEncoding.java"],
        base = "//java:" + rule_name,
        main_class = "testdata.CheckEncoding",
    )
    for rule_name in RULE_NAMES
]

[
    container_test(
        name = "check_encoding_" + rule_name + "_test",
        configs = ["testdata/" + rule_name + "_encoding.yaml"],
        image = ":check_encoding_" + rule_name,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for rule_name in RULE_NAMES
]
