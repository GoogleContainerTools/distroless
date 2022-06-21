package(default_visibility = ["//visibility:public"])

load("//base:base.bzl", "deb_file")
load("//base:distro.bzl", DISTROS = "LANGUAGE_DISTROS")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("//cacerts:java.bzl", "cacerts_java")
load("//java:jre_ver.bzl", "jre_ver")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//:debian_versions.bzl", DEBIAN_VERSIONS = "DEBIAN_PACKAGE_VERSIONS")

USERS = [
    "root",
    "nonroot",
]

JAVA_ARCHITECTURES = ARCHITECTURES + [
    "s390x",
    "ppc64le",
]

JAVA_VERSIONS = [
    "11",
    "17",
]

[
    cacerts_java(
        name = "cacerts_java_" + arch + "_" + distro,
        cacerts_tar = "//base:cacerts_" + arch + "_" + distro,
    )
    for distro in DISTROS
    for arch in JAVA_ARCHITECTURES
]

[
    container_image(
        name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_" + user + "_" + arch + "_" + distro,
        debs = [
            deb_file(arch, distro, "zlib1g"),
            deb_file(arch, distro, "libjpeg62-turbo"),
            deb_file(arch, distro, "libpng16-16"),
            deb_file(arch, distro, "liblcms2-2"),
            deb_file(arch, distro, "libfreetype6"),
            deb_file(arch, distro, "fonts-dejavu-core"),
            deb_file(arch, distro, "fontconfig-config"),
            deb_file(arch, distro, "libexpat1"),
            deb_file(arch, distro, "libfontconfig1"),
            deb_file(arch, distro, "libuuid1"),
            deb_file(arch, distro, "libgraphite2-3"),
            deb_file(arch, distro, "libharfbuzz0b"),
            deb_file(arch, distro, "libglib2.0-0"),
            deb_file(arch, distro, "libpcre3"),
            deb_file(arch, distro, "libbrotli1"),
            deb_file(arch, distro, "libcrypt1"),
        ],
        env = {"LANG": "C.UTF-8"},
        tars = [
            ":cacerts_java_" + arch + "_" + distro,
            "//locale:locale_" + arch + "_" + distro,
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro in DISTROS
    for arch in JAVA_ARCHITECTURES
]

[
    container_image(
        name = "java" + java_version + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ":java_base_" + user + "_" + arch + "_" + distro,
        debs = [deb_file(
            arch,
            distro,
            "openjdk-" + java_version + "-jre-headless",
        )],
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {"JAVA_VERSION": jre_ver(DEBIAN_VERSIONS[arch][distro]["openjdk-" + java_version + "-jre-headless"])},
        symlinks = {"/usr/bin/java": "/usr/lib/jvm/java-" + java_version + "-openjdk-" + arch + "/bin/java"},
    )
    for java_version in JAVA_VERSIONS
    for arch in JAVA_ARCHITECTURES
    for distro in DISTROS
    for user in USERS
]

[
    container_image(
        name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ":java_base_debug_" + user + "_" + arch + "_" + distro,
        debs = [
            deb_file(
                arch,
                distro,
                "openjdk-" + java_version + "-jre-headless",
            ),
            deb_file(
                arch,
                distro,
                "openjdk-" + java_version + "-jdk-headless",
            ),
        ],
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {"JAVA_VERSION": jre_ver(DEBIAN_VERSIONS[arch][distro]["openjdk-" + java_version + "-jre-headless"])},
        symlinks = {"/usr/bin/java": "/usr/lib/jvm/java-" + java_version + "-openjdk-" + arch + "/bin/java"},
    )
    for user in USERS
    for java_version in JAVA_VERSIONS
    for arch in JAVA_ARCHITECTURES
    for distro in DISTROS
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
    for arch in JAVA_ARCHITECTURES
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
    for java_version in JAVA_VERSIONS
    for arch in JAVA_ARCHITECTURES
    for distro in DISTROS
    for user in USERS
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
    for java_version in JAVA_VERSIONS
    for arch in JAVA_ARCHITECTURES
    for distro in DISTROS
    for user in USERS
]

RULE_NAMES = [
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
