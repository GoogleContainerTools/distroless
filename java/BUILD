package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTROS", "DISTRO_PACKAGES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("@package_bundle_amd64_debian10//file:packages.bzl", versions_amd64_debian10 = "versions")
load("@package_bundle_amd64_debian11//file:packages.bzl", versions_amd64_debian11 = "versions")
load("@package_bundle_arm64_debian10//file:packages.bzl", versions_arm64_debian10 = "versions")
load("@package_bundle_arm64_debian11//file:packages.bzl", versions_arm64_debian11 = "versions")
load("//cacerts:java.bzl", "cacerts_java")
load("//java:jre_ver.bzl", "jre_ver")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")

DISTRO_VERSIONS = {
    "amd64": {
        "debian10": versions_amd64_debian10,
        "debian11": versions_amd64_debian11,
    },
    "arm64": {
        "debian11": versions_arm64_debian11,
    },
}

USERS = [
    "root",
    "nonroot",
]

VERSION_PAIRS = [
    ("11", "amd64", "debian10"),
    ("11", "amd64", "debian11"),
    ("11", "arm64", "debian11"),
    ("17", "amd64", "debian11"),
    ("17", "arm64", "debian11"),
]

EXTRA_DEBS = {
    "debian10": [],
    "debian11": [
        "libbrotli1",
    ],
}

[
    container_image(
        name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_" + user + "_" + arch + "_" + distro,
        debs = [
            DISTRO_PACKAGES[arch][distro]["zlib1g"],
            DISTRO_PACKAGES[arch][distro]["libjpeg62-turbo"],
            DISTRO_PACKAGES[arch][distro]["libpng16-16"],
            DISTRO_PACKAGES[arch][distro]["liblcms2-2"],
            DISTRO_PACKAGES[arch][distro]["libfreetype6"],
            DISTRO_PACKAGES[arch][distro]["fonts-dejavu-core"],
            DISTRO_PACKAGES[arch][distro]["fontconfig-config"],
            DISTRO_PACKAGES[arch][distro]["libexpat1"],
            DISTRO_PACKAGES[arch][distro]["libfontconfig1"],
            DISTRO_PACKAGES[arch][distro]["libuuid1"],
            DISTRO_PACKAGES[arch][distro]["libgraphite2-3"],
            DISTRO_PACKAGES[arch][distro]["libharfbuzz0b"],
            DISTRO_PACKAGES[arch][distro]["libglib2.0-0"],
            DISTRO_PACKAGES[arch][distro]["libpcre3"],
        ] + [DISTRO_PACKAGES[arch][distro][deb] for deb in EXTRA_DEBS[distro]],
        env = {"LANG": "C.UTF-8"},
        tars = [
            "//cacerts:cacerts_java_" + arch + "_" + distro,
            "//locale:locale_" + arch + "_" + distro,
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro in DISTROS
    for arch in ARCHITECTURES
    if not (arch == "arm64" and distro == "debian10")
]

[
    container_image(
        name = "java" + java_version + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ":java_base_" + user + "_" + arch + "_" + distro,
        debs = [DISTRO_PACKAGES[arch][distro]["openjdk-" + java_version + "-jre-headless"]],
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {"JAVA_VERSION": jre_ver(DISTRO_VERSIONS[arch][distro]["openjdk-" + java_version + "-jre-headless"])},
        symlinks = {"/usr/bin/java": "/usr/lib/jvm/java-" + java_version + "-openjdk-" + arch + "/bin/java"},
    )
    for (java_version, arch, distro) in VERSION_PAIRS
    for user in USERS
]

[
    container_image(
        name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ":java_base_debug_" + user + "_" + arch + "_" + distro,
        debs = [
            DISTRO_PACKAGES[arch][distro]["openjdk-" + java_version + "-jre-headless"],
            DISTRO_PACKAGES[arch][distro]["openjdk-" + java_version + "-jdk-headless"],
        ],
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {"JAVA_VERSION": jre_ver(DISTRO_VERSIONS[arch][distro]["openjdk-" + java_version + "-jre-headless"])},
        symlinks = {"/usr/bin/java": "/usr/lib/jvm/java-" + java_version + "-openjdk-" + arch + "/bin/java"},
    )
    for (java_version, arch, distro) in VERSION_PAIRS
    for user in USERS
]

[
    container_test(
        name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/java_base" + mode + ".yaml"],
        image = ":java_base" + mode + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for arch in ARCHITECTURES
    for user in USERS
    for distro in DISTROS
]

[
    container_test(
        name = "java" + java_version + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/java" + java_version + "_" + distro + ".yaml"],
        image = ":java" + java_version + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for user in USERS
    for (java_version, arch, distro) in VERSION_PAIRS
]

[
    container_test(
        name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/java" + java_version + "_debug" + "_" + distro + ".yaml"],
        image = ":java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            "manual",
        ],
    )
    for user in USERS
    for (java_version, arch, distro) in VERSION_PAIRS
]

RULE_NAMES = [
    ("java11_root_debian10", "java11_root_amd64_debian10"),
    ("java11_nonroot_debian10", "java11_nonroot_amd64_debian10"),
    ("java11_root_debian11", "java11_root_amd64_debian11"),
    ("java11_nonroot_debian11", "java11_nonroot_amd64_debian11"),
    ("java17_root_debian11", "java17_root_amd64_debian11"),
    ("java17_nonroot_debian11", "java17_nonroot_amd64_debian11"),
]

[
    java_image(
        name = "check_certs_" + rule_name,
        srcs = ["testdata/CheckCerts.java"],
        base = "//java:" + base_name,
        main_class = "testdata.CheckCerts",
    )
    for (rule_name, base_name) in RULE_NAMES
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
    for (rule_name, _) in RULE_NAMES
]

[
    java_image(
        name = "check_encoding_" + rule_name,
        srcs = ["testdata/CheckEncoding.java"],
        base = "//java:" + base_name,
        main_class = "testdata.CheckEncoding",
    )
    for (rule_name, base_name) in RULE_NAMES
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
    for (rule_name, _) in RULE_NAMES
]

[
    java_image(
        name = "check_libharfbuzz_" + rule_name,
        srcs = ["testdata/CheckLibharfbuzz.java"],
        base = "//java:" + base_name,
        main_class = "testdata.CheckLibharfbuzz",
    )
    for (rule_name, base_name) in RULE_NAMES
]

[
    container_test(
        name = "check_libharfbuzz_" + rule_name + "_test",
        configs = ["testdata/" + rule_name + "_libharfbuzz.yaml"],
        image = ":check_libharfbuzz_" + rule_name,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for (rule_name, _) in RULE_NAMES
]
