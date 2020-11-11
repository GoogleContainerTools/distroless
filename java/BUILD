package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("//cacerts:java.bzl", "cacerts_java")

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
        name = "java" + java_major_version + mode + "_" + user + distro_suffix,
        base = ":java_base" + mode + "_" + user + distro_suffix,
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {"JAVA_VERSION": java_full_version},
        symlinks = {"/usr/bin/java": "/usr/lib/jvm/openjdk-" + java_major_version + "/bin/java"},
        #tars = ["@zulu_openjdk_" + ("jre" if (not mode) else "jdk") + java_major_version + "_amd64//:tar"],
        tars = ["@adoptopenjdk_" + ("jre" if (not mode) else "jdk") + java_major_version + "_amd64//:tar"],
    )
    for (java_major_version, java_full_version) in [
        ("8", "8u272"),
        ("11", "11.0.9"),
    ]
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
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
        name = "java8_debian9_" + user + "_test",
        configs = ["testdata/java8.yaml"],
        image = ":java8_" + user + "_debian9",
        tags = [
            "amd64",
            "manual",
        ],
    )
    for user in USERS
]

[
    container_test(
        name = "java8_debug_" + user + "_debian9_test",
        configs = ["testdata/java8_debug.yaml"],
        image = ":java8_debug_" + user + "_debian9",
        tags = [
            "amd64",
            "manual",
        ],
    )
    for user in USERS
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
    "java8_root_debian9",
    "java8_nonroot_debian9",
    "java11_root_debian9",
    "java11_nonroot_debian9",
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
