load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@java_versions//:versions.bzl", "JAVA_RELEASE_VERSIONS")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//:distro.bzl", "DISTROS", "PREVIEW_DISTROS")
load("//java:jre_ver.bzl", "jre_ver")
load("//private/oci:defs.bzl", "java_image")
load("//private/util:deb.bzl", "deb")
load("//private/util:java_cacerts.bzl", "java_cacerts")

DEBUG_MODE = ["", "_debug"]
USERS = ["root", "nonroot"]

DISTRO_SPECIFIC_LIBRARIES = {
    "build_base": {
        "debian12": [
            "gcc-12-base",
            "libpng16-16",
        ],
        "debian13": [
            "gcc-14-base",
            "libpng16-16t64",
            "libbz2-1.0",
        ],
    },
    "base": {
        "debian12": [
            "libglib2.0-0",
        ],
        "debian13": [
            "libglib2.0-0t64",
        ],
    },
}

def ca_certs(distro, arch):
    """java ca certs for a specific arch and distro
    """

    if native.existing_rule("cacerts_java_" + arch + "_" + distro):
        return

    java_cacerts(
        name = "cacerts_java_" + arch + "_" + distro,
        archive = "//common:cacerts_" + distro + "_" + arch,
    )

def java_build_base_image(distro, arch):
    """a base image that isn't published for building temurin and debian sourced java images
       temurin ships with libharfbuzz and certs but debian distributed ones do not include it
       libharfbuzz depends on libpcre,libglib,libgraphite

    Args:
        distro: name of distribution
        arch: the target architecture
    """

    # check if we already made these
    if native.existing_rule("java_build_base_" + USERS[0] + "_" + arch + "_" + distro):
        return

    [
        oci_image(
            name = "java_build_base" + mode + "_" + user + "_" + arch + "_" + distro,
            base = ("//base:base_nossl" if (not ("debug" in mode)) else "//base:base_nossl_debug") + "_" + user + "_" + arch + "_" + distro,
            env = {"LANG": "C.UTF-8"},
            tars = [
                deb.package(arch, distro, "zlib1g"),
                deb.package(arch, distro, "libjpeg62-turbo"),
                deb.package(arch, distro, "liblcms2-2"),
                deb.package(arch, distro, "libfreetype6"),
                deb.package(arch, distro, "fonts-dejavu-core"),
                deb.package(arch, distro, "fontconfig-config"),
                deb.package(arch, distro, "libexpat1"),
                deb.package(arch, distro, "libfontconfig1"),
                deb.package(arch, distro, "libuuid1"),
                deb.package(arch, distro, "libbrotli1"),
                deb.package(arch, distro, "libcrypt1"),
                deb.package(arch, distro, "libstdc++6"),
                deb.package(arch, distro, "libgcc-s1"),
                "//common:locale_" + distro + "_" + arch,
            ] + [deb.package(arch, distro, library) for library in DISTRO_SPECIFIC_LIBRARIES["build_base"][distro]],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

def java_base_image_index(distro, architectures):
    """java base image index for a distro

    Args:
        distro: name of distribution
        architectures: all architectures included in index
    """
    [
        oci_image_index(
            name = "java_base" + mode + "_" + user + "_" + distro,
            images = [
                "java_base" + mode + "_" + user + "_" + arch + "_" + distro
                for arch in architectures
            ],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

def java_base_image(distro, arch):
    """java base for a distro/arch

    Args:
        distro: name of distribution
        arch: the target arch
    """

    # pre-req
    java_build_base_image(distro, arch)
    ca_certs(distro, arch)

    [
        oci_image(
            name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro,
            base = "java_build_base" + mode + "_" + user + "_" + arch + "_" + distro,
            env = {"LANG": "C.UTF-8"},
            tars = [
                deb.package(arch, distro, "libharfbuzz0b"),
                deb.package(arch, distro, "libgraphite2-3"),
                deb.package(arch, distro, "libpcre2-8-0"),  # required for libharfbuzz0b but remove for temurin installs
                ":cacerts_java_" + arch + "_" + distro,
            ] + [deb.package(arch, distro, library) for library in DISTRO_SPECIFIC_LIBRARIES["base"][distro]],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

    [
        container_structure_test(
            name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro + "_test",
            configs = ["testdata/java_base" + mode + ".yaml"],
            image = ":java_base" + mode + "_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )
        for mode in DEBUG_MODE
        for user in USERS
    ]

def java_image_index(distro, java_version, architectures):
    """java and debug image indexes (applies to all java_image builds)

    Args:
        distro: name of distribution
        java_version: version of java
        architectures: all architectures included in index
    """
    [
        oci_image_index(
            name = "java" + java_version + mode + "_" + user + "_" + distro,
            images = [
                "java" + java_version + mode + "_" + user + "_" + arch + "_" + distro
                for arch in architectures
            ],
        )
        for user in USERS
        for mode in DEBUG_MODE
    ]

def temurin_jre_prep(java_version, arch):
    rule_name = "temurin_jre_" + java_version + "_" + arch
    if native.existing_rule(rule_name):
        return

    pkg_tar(
        name = rule_name,
        symlinks = {
            "usr/bin/java": "/usr/lib/jvm/temurin" + java_version + "_jre_" + arch + "/bin/java",
        },
        deps = [
            "@temurin" + java_version + "_jre_" + arch,
        ],
    )

def temurin_jdk_prep(java_version, arch):
    rule_name = "temurin_jdk_" + java_version + "_" + arch
    if native.existing_rule(rule_name):
        return

    pkg_tar(
        name = rule_name,
        symlinks = {
            "usr/bin/java": "/usr/lib/jvm/temurin" + java_version + "_jdk_" + arch + "/bin/java",
        },
        deps = [
            "@temurin" + java_version + "_jdk_" + arch,
        ],
    )

def java_temurin_image_from_github_releases(distro, java_version, arch):
    """java images from temurin distributions downloaded from github releases.
       This approach is used for debian12 and is deprecated for newer distributions
       in favor of using adoptium debs.

    Args:
        distro: name of distribution
        java_version: version of java
        arch: the target arch
    """

    # pre-req
    java_build_base_image(distro, arch)
    temurin_jdk_prep(java_version, arch)
    temurin_jre_prep(java_version, arch)

    # standard image builds
    [
        oci_image(
            name = "java" + java_version + "_" + user + "_" + arch + "_" + distro,
            base = ":java_build_base_" + user + "_" + arch + "_" + distro,
            # We expect users to use:
            # cmd = ["/path/to/deploy.jar", "--option1", ...]
            entrypoint = [
                "/usr/bin/java",
                "-jar",
            ],
            env = {
                "JAVA_VERSION": JAVA_RELEASE_VERSIONS["temurin" + java_version + "_jre_" + arch],
            },
            tars = [
                ":temurin_jre_" + java_version + "_" + arch,
            ],
        )
        for user in USERS
    ]

    # debug image builds
    [
        oci_image(
            name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
            base = ":java_build_base_debug_" + user + "_" + arch + "_" + distro,
            # We expect users to use:
            # cmd = ["/path/to/deploy.jar", "--option1", ...]
            entrypoint = [
                "/usr/bin/java",
                "-jar",
            ],
            env = {
                "JAVA_VERSION": JAVA_RELEASE_VERSIONS["temurin" + java_version + "_jdk_" + arch],
            },
            tars = [
                ":temurin_jdk_" + java_version + "_" + arch,
            ],
        )
        for user in USERS
    ]

    java_tests(distro, java_version, arch)

def java_temurin_image_from_adoptium_debs(distro, java_version, arch):
    """java images from adoptium temurin deb distribution

    Args:
        distro: name of distribution
        java_version: version of java
        arch: the target arch
    """

    # pre-req
    java_build_base_image(distro, arch)

    # intermediary rule to configure jre symlinks
    pkg_tar(
        name = "temurin_" + java_version + "_jre_" + arch + "_" + distro,
        symlinks = {
            "/usr/bin/java": "/usr/lib/jvm/temurin-" + java_version + "-jre-" + arch + "/bin/java",
            "/etc/ssl/certs/adoptium/cacerts": "/etc/ssl/certs/java/cacerts",
        },
        deps = [
            deb.package(
                arch,
                distro,
                "temurin-" + java_version + "-jre",
            ),
        ],
    )

    # intermediary rules to configure jdk symlinks
    pkg_tar(
        name = "temurin_" + java_version + "_jdk_" + arch + "_" + distro,
        symlinks = {
            "/usr/bin/java": "/usr/lib/jvm/temurin-" + java_version + "-jdk-" + arch + "/bin/java",
            "/etc/ssl/certs/adoptium/cacerts": "/etc/ssl/certs/java/cacerts",
        },
        deps = [
            deb.package(
                arch,
                distro,
                "temurin-" + java_version + "-jdk",
            ),
        ],
    )

    # standard image builds
    [
        oci_image(
            name = "java" + java_version + "_" + user + "_" + arch + "_" + distro,
            base = ":java_build_base_" + user + "_" + arch + "_" + distro,
            # We expect users to use:
            # cmd = ["/path/to/deploy.jar", "--option1", ...]
            entrypoint = [
                "/usr/bin/java",
                "-jar",
            ],
            env = {
                "JAVA_VERSION": jre_ver(deb.version(
                    arch,
                    distro,
                    "temurin-" + java_version + "-jre",
                )),
            },
            tars = [
                # we use system certs, but we might want to pull this out of the distro
                # like we did for the github released temurin
                ":cacerts_java_" + arch + "_" + distro,
                ":temurin_" + java_version + "_jre_" + arch + "_" + distro,
            ],
        )
        for user in USERS
    ]

    # debug image builds
    [
        oci_image(
            name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
            base = ":java_build_base_debug_" + user + "_" + arch + "_" + distro,
            # We expect users to use:
            # cmd = ["/path/to/deploy.jar", "--option1", ...]
            entrypoint = [
                "/usr/bin/java",
                "-jar",
            ],
            env = {
                "JAVA_VERSION": jre_ver(deb.version(
                    arch,
                    distro,
                    "temurin-" + java_version + "-jdk",
                )),
            },
            tars = [
                # we use system certs, but we might want to pull this out of the distro
                # like we did for the github released temurin
                ":cacerts_java_" + arch + "_" + distro,
                ":temurin_" + java_version + "_jdk_" + arch + "_" + distro,
            ],
        )
        for user in USERS
    ]

    java_tests(distro, java_version, arch)

def java_openjdk_image(distro, java_version, arch):
    """standard debian java and debug image

    Args:
        distro: name of distribution
        java_version: version of java
        arch: the target arch
    """

    # intermediary rule to configure symlinks
    pkg_tar(
        name = "openjdk_jre_headless_" + java_version + "_" + arch + "_" + distro,
        symlinks = {
            "/usr/bin/java": "/usr/lib/jvm/java-" + java_version + "-openjdk-" + arch + "/bin/java",
        },
        deps = [
            deb.package(
                arch,
                distro,
                "openjdk-" + java_version + "-jre-headless",
            ),
        ],
    )

    # image rule
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
                "JAVA_VERSION": jre_ver(deb.version(
                    arch,
                    distro,
                    "openjdk-" + java_version + "-jre-headless",
                )),
            },
            tars = [
                ":openjdk_jre_headless_" + java_version + "_" + arch + "_" + distro,
            ],
        )
        for user in USERS
    ]

    # debug image
    [
        oci_image(
            name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
            base = ":java_base_debug_" + user + "_" + arch + "_" + distro,
            # We expect users to use:
            # cmd = ["/path/to/deploy.jar", "--option1", ...]
            entrypoint = [
                "/usr/bin/java",
                "-jar",
            ],
            env = {
                "JAVA_VERSION": jre_ver(deb.version(
                    arch,
                    distro,
                    "openjdk-" + java_version + "-jre-headless",
                )),
            },
            tars = [
                ":openjdk_jre_headless_" + java_version + "_" + arch + "_" + distro,
                deb.package(
                    arch,
                    distro,
                    "openjdk-" + java_version + "-jdk-headless",
                ),
            ],
        )
        for user in USERS
    ]

    java_tests(distro, java_version, arch)

def java_tests(distro, java_version, arch):
    [
        container_structure_test(
            name = "java" + java_version + "_" + user + "_" + arch + "_" + distro + "_test",
            configs = ["testdata/java" + java_version + "_" + distro + ".yaml"],
            image = ":java" + java_version + "_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )
        for user in USERS
    ]

    [
        container_structure_test(
            name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro + "_test",
            configs = ["testdata/java" + java_version + "_debug" + "_" + distro + ".yaml"],
            image = ":java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )
        for user in USERS
    ]

    if arch == "amd64":
        [
            java_image(
                name = "check_certs_java" + java_version + "_" + user + "_" + distro,
                srcs = ["testdata/CheckCerts.java"],
                base = "//java:java" + java_version + "_" + user + "_amd64_" + distro,
                main_class = "testdata.CheckCerts",
            )
            for user in USERS
        ]

        [
            container_structure_test(
                name = "check_certs_java" + java_version + "_" + user + "_" + distro + "_test",
                configs = ["testdata/java_certs.yaml"],
                image = ":check_certs_java" + java_version + "_" + user + "_" + distro,
                tags = [
                    "amd64",
                    "manual",
                ],
            )
            for user in USERS
        ]

        [
            java_image(
                name = "check_encoding_java" + java_version + "_" + user + "_" + distro,
                srcs = ["testdata/CheckEncoding.java"],
                base = "//java:java" + java_version + "_" + user + "_amd64_" + distro,
                main_class = "testdata.CheckEncoding",
            )
            for user in USERS
        ]

        [
            container_structure_test(
                name = "check_encoding_java" + java_version + "_" + user + "_" + distro + "_test",
                configs = ["testdata/java_encoding.yaml"],
                image = ":check_encoding_java" + java_version + "_" + user + "_" + distro,
                tags = [
                    "amd64",
                    "manual",
                ],
            )
            for user in USERS
        ]

        [
            java_image(
                name = "check_libharfbuzz_java" + java_version + "_" + user + "_" + distro,
                srcs = ["testdata/CheckLibharfbuzz.java"],
                base = "//java:java" + java_version + "_" + user + "_amd64_" + distro,
                main_class = "testdata.CheckLibharfbuzz",
            )
            for user in USERS
        ]

        [
            container_structure_test(
                name = "check_libharfbuzz_java" + java_version + "_" + user + "_" + distro + "_test",
                configs = ["testdata/java_libharfbuzz.yaml"],
                image = ":check_libharfbuzz_java" + java_version + "_" + user + "_" + distro,
                tags = [
                    "amd64",
                    "manual",
                ],
            )
            for user in USERS
        ]
