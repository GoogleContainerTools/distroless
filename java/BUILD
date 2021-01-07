package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES", "DISTRO_VERSIONS")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("//cacerts:java.bzl", "cacerts_java")
load("//java:jre_ver.bzl", "jre_ver")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

USERS = [
    "root",
    "nonroot",
]

[
    container_image(
        name = "java_base" + mode + "_" + user + "_" + arch + distro_suffix,
        architecture = arch,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_" + user + "_" + arch + distro_suffix,
        debs = [
            DISTRO_PACKAGES[arch][distro_suffix]["zlib1g"],
            DISTRO_PACKAGES[arch][distro_suffix]["libjpeg62-turbo"],
            DISTRO_PACKAGES[arch][distro_suffix]["libpng16-16"],
            DISTRO_PACKAGES[arch][distro_suffix]["liblcms2-2"],
            DISTRO_PACKAGES[arch][distro_suffix]["libfreetype6"],
            DISTRO_PACKAGES[arch][distro_suffix]["fonts-dejavu-core"],
            DISTRO_PACKAGES[arch][distro_suffix]["fontconfig-config"],
            DISTRO_PACKAGES[arch][distro_suffix]["libexpat1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libfontconfig1"],
            DISTRO_PACKAGES[arch][distro_suffix]["libuuid1"],
        ],
        env = {"LANG": "C.UTF-8"},
        tars = [
            "//cacerts:cacerts_java_" + arch + distro_suffix,
            "//locale:locale_" + arch + distro_suffix,
        ],
    )
    for arch in ARCHITECTURES
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_image(
        name = rule_name + "_" + user + "_" + arch + distro_suffix,
        architecture = arch,
        base = ":java_base" + ("_debug" if ("debug" in rule_name) else "") + "_" + user + "_" + arch + distro_suffix,
        debs = [DISTRO_PACKAGES[arch][distro_suffix][deb] for deb in java_debs],
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {"JAVA_VERSION": jre_ver(DISTRO_VERSIONS[arch][distro_suffix][java_debs[0]])},
        symlinks = {
            "/usr/bin/java": java_path + java_executable_path,
            "/usr/lib/jvm/openjdk": java_path,
        },
    )
    for arch in ARCHITECTURES
    for (distro_suffix, rule_name, java_debs, java_path, java_executable_path) in [
        (
            "_debian9",
            "java8",
            ["openjdk-8-jre-headless"],
            "/usr/lib/jvm/java-8-openjdk-" + arch,
            "/jre/bin/java",
        ),
        (
            "_debian9",
            "java8_debug",
            [
                "openjdk-8-jre-headless",
                "openjdk-8-jdk-headless",
            ],
            "/usr/lib/jvm/java-8-openjdk-" + arch,
            "/jre/bin/java",
        ),
        (
            "_debian9",
            "java11",
            ["openjdk-11-jre-headless"],
            "/usr/lib/jvm/java-11-openjdk-" + arch,
            "/bin/java",
        ),
        (
            "_debian9",
            "java11_debug",
            [
                "openjdk-11-jre-headless",
                "openjdk-11-jdk-headless",
            ],
            "/usr/lib/jvm/java-11-openjdk-" + arch,
            "/bin/java",
        ),
        (
            "_debian10",
            "java11",
            ["openjdk-11-jre-headless"],
            "/usr/lib/jvm/java-11-openjdk-" + arch,
            "/bin/java",
        ),
        (
            "_debian10",
            "java11_debug",
            [
                "openjdk-11-jre-headless",
                "openjdk-11-jdk-headless",
            ],
            "/usr/lib/jvm/java-11-openjdk-" + arch,
            "/bin/java",
        ),
    ]
    for user in USERS
]

[
    container_test(
        name = "java_base" + mode + "_" + user + "_" + arch + distro_suffix + "_test",
        configs = ["testdata/java_base" + mode + ".yaml"],
        image = ":java_base" + mode + "_" + user + "_" + arch + distro_suffix,
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_test(
        name = "java8_debian9_" + user + "_" + arch + "_test",
        configs = ["testdata/java8.yaml"],
        image = ":java8_" + user + "_" + arch + "_debian9",
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for user in USERS
]

[
    container_test(
        name = "java8_debug_" + user + "_" + arch + "_debian9_test",
        configs = ["testdata/java8_debug.yaml"],
        image = ":java8_debug_" + user + "_" + arch + "_debian9",
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for user in USERS
]

[
    container_test(
        name = "java11_" + user + "_" + arch + distro_suffix + "_test",
        configs = ["testdata/java11" + distro_suffix + ".yaml"],
        image = ":java11_" + user + "_" + arch + distro_suffix,
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
]

[
    container_test(
        name = "java11_debug_" + user + "_" + arch + distro_suffix + "_test",
        configs = ["testdata/java11_debug" + distro_suffix + ".yaml"],
        image = ":java11_debug_" + user + "_" + arch + distro_suffix,
        tags = [
            arch,
            "manual",
        ],
    )
    for arch in ARCHITECTURES
    for user in USERS
    for distro_suffix in DISTRO_SUFFIXES
]

RULE_NAMES = {
    "java8_" + user + "_" + arch + "_debian9": arch
    for arch in ARCHITECTURES
    for user in USERS
}

RULE_NAMES.update({
    "java11_" + user + "_" + arch + distro: arch
    for arch in ARCHITECTURES
    for user in USERS
    for distro in DISTRO_SUFFIXES
})

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
        configs = ["testdata/java_certs.yaml"],
        image = ":check_certs_" + rule_name,
        tags = [
            RULE_NAMES[rule_name],
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
        configs = ["testdata/java_encoding.yaml"],
        image = ":check_encoding_" + rule_name,
        tags = [
            RULE_NAMES[rule_name],
            "manual",
        ],
    )
    for rule_name in RULE_NAMES
]
