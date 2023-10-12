load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_image_index", "structure_test")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//private/oci:defs.bzl", "java_image")
load("//base:base.bzl", "deb_pkg")
load("//base:distro.bzl", DISTROS = "LANGUAGE_DISTROS")
load("//cacerts:java.bzl", "cacerts_java")
load("//java:jre_ver.bzl", "jre_ver")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//:debian_versions.bzl", DEBIAN_VERSIONS = "DEBIAN_PACKAGE_VERSIONS")

package(default_visibility = ["//visibility:public"])

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
    pkg_tar(
        name = "openjdk_jre_headless_" + java_version + "_" + arch + "_" + distro,
        symlinks = {
            "/usr/bin/java": "/usr/lib/jvm/java-" + java_version + "-openjdk-" + arch + "/bin/java",
        },
        deps = [
            deb_pkg(
                arch,
                distro,
                "openjdk-" + java_version + "-jre-headless",
            ),
        ],
    )
    for java_version in JAVA_VERSIONS
    for arch in JAVA_ARCHITECTURES
    for distro in DISTROS
]

# Base
[
    oci_image_index(
        name = "java_base" + mode + "_" + user + "_" + distro,
        images = [
            "java_base" + mode + "_" + user + "_" + arch + "_" + distro
            for arch in JAVA_ARCHITECTURES
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro in DISTROS
]

[
    oci_image(
        name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_" + user + "_" + arch + "_" + distro,
        env = {"LANG": "C.UTF-8"},
        tars = [
            deb_pkg(arch, distro, "zlib1g"),
            deb_pkg(arch, distro, "libjpeg62-turbo"),
            deb_pkg(arch, distro, "libpng16-16"),
            deb_pkg(arch, distro, "liblcms2-2"),
            deb_pkg(arch, distro, "libfreetype6"),
            deb_pkg(arch, distro, "fonts-dejavu-core"),
            deb_pkg(arch, distro, "fontconfig-config"),
            deb_pkg(arch, distro, "libexpat1"),
            deb_pkg(arch, distro, "libfontconfig1"),
            deb_pkg(arch, distro, "libuuid1"),
            deb_pkg(arch, distro, "libgraphite2-3"),
            deb_pkg(arch, distro, "libharfbuzz0b"),
            deb_pkg(arch, distro, "libglib2.0-0"),
            deb_pkg(arch, distro, "libpcre3"),
            deb_pkg(arch, distro, "libbrotli1"),
            deb_pkg(arch, distro, "libcrypt1"),
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

# Java JRE Headless
[
    oci_image_index(
        name = "java" + java_version + "_" + user + "_" + distro,
        images = [
            "java" + java_version + "_" + user + "_" + arch + "_" + distro
            for arch in JAVA_ARCHITECTURES
        ],
    )
    for java_version in JAVA_VERSIONS
    for distro in DISTROS
    for user in USERS
]

[
    oci_image(
        name = "java" + java_version + "_" + user + "_" + arch + "_" + distro,
        base = ":java_base_" + user + "_" + arch + "_" + distro,
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {
            "JAVA_VERSION": jre_ver(DEBIAN_VERSIONS[arch][distro]["openjdk-" + java_version + "-jre-headless"]),
        },
        tars = [
            ":openjdk_jre_headless_" + java_version + "_" + arch + "_" + distro,
        ],
    )
    for java_version in JAVA_VERSIONS
    for arch in JAVA_ARCHITECTURES
    for distro in DISTROS
    for user in USERS
]

# Java JRE Headless - Debug
[
    oci_image_index(
        name = "java" + java_version + "_debug_" + user + "_" + distro,
        images = [
            "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro
            for arch in JAVA_ARCHITECTURES
        ],
    )
    for java_version in JAVA_VERSIONS
    for distro in DISTROS
    for user in USERS
]

[
    oci_image(
        name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ":java_base_debug_" + user + "_" + arch + "_" + distro,
        # We expect users to use:
        # cmd = ["/path/to/deploy.jar", "--option1", ...]
        entrypoint = [
            "/usr/bin/java",
            "-jar",
        ],
        env = {
            "JAVA_VERSION": jre_ver(DEBIAN_VERSIONS[arch][distro]["openjdk-" + java_version + "-jre-headless"]),
        },
        tars = [
            ":openjdk_jre_headless_" + java_version + "_" + arch + "_" + distro,
            deb_pkg(
                arch,
                distro,
                "openjdk-" + java_version + "-jdk-headless",
            ),
        ],
    )
    for user in USERS
    for java_version in JAVA_VERSIONS
    for arch in JAVA_ARCHITECTURES
    for distro in DISTROS
]

[
    structure_test(
        name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        config = ["testdata/java_base" + mode + ".yaml"],
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
    structure_test(
        name = "java" + java_version + "_" + user + "_" + arch + "_" + distro + "_test",
        config = ["testdata/java" + java_version + "_" + distro + ".yaml"],
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
    structure_test(
        name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro + "_test",
        config = ["testdata/java" + java_version + "_debug" + "_" + distro + ".yaml"],
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
    structure_test(
        name = "check_certs_" + rule_name + "_test",
        config = ["testdata/java_certs.yaml"],
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
    structure_test(
        name = "check_encoding_" + rule_name + "_test",
        config = ["testdata/java_encoding.yaml"],
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
    structure_test(
        name = "check_libharfbuzz_" + rule_name + "_test",
        config = ["testdata/java_libharfbuzz.yaml"],
        image = ":check_libharfbuzz_" + rule_name,
        tags = [
            "amd64",
            "manual",
        ],
    )
    for (rule_name, _) in RULE_NAMES
]
