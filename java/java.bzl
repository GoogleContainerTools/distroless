"java image definitions"

load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@java_versions//:versions.bzl", "JAVA_RELEASE_VERSIONS")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("//private/util:tar.bzl", "pkg_tar")
load("//common:variables.bzl", "DEBUG_MODE", "USERS")
load("//java:jre_ver.bzl", "jre_ver")
load("//private/oci:defs.bzl", "java_image")
load("//private/util:deb.bzl", "deb")
load("//private/util:java_cacerts.bzl", "java_cacerts")

def ca_certs(distro, arch):
    """java ca certs for a specific arch and distro
    """

    if native.existing_rule("cacerts_java_" + arch + "_" + distro):
        return

    java_cacerts(
        name = "cacerts_java_" + arch + "_" + distro,
        archive = "//common:cacerts_" + distro + "_" + arch,
    )

# deprecated, remove with debian12 removal
def java_build_base_image(distro, arch, packages):
    """Build base image for temurin and debian sourced java images (deprecated).

    Temurin ships with libharfbuzz and certs but debian distributed ones do not include it.
    libharfbuzz depends on libpcre,libglib,libgraphite.

    Args:
        distro: name of distribution
        arch: the target architecture
        packages: to add to the image (from a debianX_java repo)
    """
    for mode in DEBUG_MODE:
        for user in USERS:
            oci_image(
                name = "java_build_base" + mode + "_" + user + "_" + arch + "_" + distro,
                base = "//base:base_nossl" + mode + "_" + user + "_" + arch + "_" + distro,
                env = {"LANG": "C.UTF-8"},
                tars = [
                    deb.package(arch, distro, pkg, "java")
                    for pkg in packages
                ] + [
                    "//common:locale_" + distro + "_" + arch,
                ],
            )

def java_base_image_index(distro, architectures):
    """java base image index for a distro

    Args:
        distro: name of distribution
        architectures: all architectures included in index
    """
    for mode in DEBUG_MODE:
        for user in USERS:
            oci_image_index(
                name = "java_base" + mode + "_" + user + "_" + distro,
                images = [
                    "java_base" + mode + "_" + user + "_" + arch + "_" + distro
                    for arch in architectures
                ],
            )

def java_base_image(distro, arch, packages):
    """java base for a distro/arch

    Args:
        distro: name of distribution
        arch: the target arch
        packages: to add to the image (from a debianX_java repo)
    """

    # pre-req
    ca_certs(distro, arch)

    for mode in DEBUG_MODE:
        for user in USERS:
            oci_image(
                name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro,
                base = "//base:base_nossl" + mode + "_" + user + "_" + arch + "_" + distro,
                env = {"LANG": "C.UTF-8"},
                tars = [
                    deb.package(arch, distro, pkg, "java")
                    for pkg in packages
                ] + [
                    "//common:locale_" + distro + "_" + arch,
                    ":cacerts_java_" + arch + "_" + distro,
                ],
            )

    for mode in DEBUG_MODE:
        for user in USERS:
            container_structure_test(
                name = "java_base" + mode + "_" + user + "_" + arch + "_" + distro + "_test",
                configs = ["testdata/java_base" + mode + ".yaml"],
                image = ":java_base" + mode + "_" + user + "_" + arch + "_" + distro,
                tags = [
                    arch,
                    "manual",
                ],
            )

def java_image_index(distro, java_version, architectures):
    """java and debug image indexes (applies to all java_image builds)

    Args:
        distro: name of distribution
        java_version: version of java
        architectures: all architectures included in index
    """
    for user in USERS:
        for mode in DEBUG_MODE:
            oci_image_index(
                name = "java" + java_version + mode + "_" + user + "_" + distro,
                images = [
                    "java" + java_version + mode + "_" + user + "_" + arch + "_" + distro
                    for arch in architectures
                ],
            )

# deprecated, remove with debian12 removal
def temurin_jre_prep(java_version, arch):
    rule_name = "temurin_jre_" + java_version + "_" + arch
    if native.existing_rule(rule_name):
        return

    pkg_tar(
        name = rule_name,
        extension = "tar.gz",
        symlinks = {
            "usr/bin/java": "/usr/lib/jvm/temurin" + java_version + "_jre_" + arch + "/bin/java",
        },
        deps = [
            "@temurin" + java_version + "_jre_" + arch,
        ],
    )

# deprecated, remove with debian12 removal
def temurin_jdk_prep(java_version, arch):
    rule_name = "temurin_jdk_" + java_version + "_" + arch
    if native.existing_rule(rule_name):
        return

    pkg_tar(
        name = rule_name,
        extension = "tar.gz",
        symlinks = {
            "usr/bin/java": "/usr/lib/jvm/temurin" + java_version + "_jdk_" + arch + "/bin/java",
        },
        deps = [
            "@temurin" + java_version + "_jdk_" + arch,
        ],
    )

# deprecated, remove with debian12 removal
def java_temurin_image_from_github_releases(distro, java_version, arch):
    """Java images from temurin distributions downloaded from github releases (deprecated).

    This approach is used for debian12 and is deprecated for newer distributions
    in favor of using adoptium debs.

    Args:
        distro: name of distribution
        java_version: version of java
        arch: the target arch
    """

    temurin_jdk_prep(java_version, arch)
    temurin_jre_prep(java_version, arch)

    # standard image builds
    for user in USERS:
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

    # debug image builds
    for user in USERS:
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

    java_tests(distro, java_version, arch)

def java_temurin_image_from_adoptium_debs(distro, java_version, arch):
    """java images from adoptium temurin deb distribution

    Args:
        distro: name of distribution
        java_version: version of java
        arch: the target arch
    """

    # intermediary rule to configure jre symlinks
    pkg_tar(
        name = "temurin_" + java_version + "_jre_" + arch + "_" + distro,
        extension = "tar.gz",
        symlinks = {
            "/usr/bin/java": "/usr/lib/jvm/temurin-" + java_version + "-jre-" + arch + "/bin/java",
            "/etc/ssl/certs/adoptium/cacerts": "/etc/ssl/certs/java/cacerts",
        },
        deps = [
            deb.package(
                arch,
                distro,
                "temurin-" + java_version + "-jre",
                "adoptium",
            ),
        ],
    )

    # intermediary rules to configure jdk symlinks
    pkg_tar(
        name = "temurin_" + java_version + "_jdk_" + arch + "_" + distro,
        extension = "tar.gz",
        symlinks = {
            "/usr/bin/java": "/usr/lib/jvm/temurin-" + java_version + "-jdk-" + arch + "/bin/java",
            "/etc/ssl/certs/adoptium/cacerts": "/etc/ssl/certs/java/cacerts",
        },
        deps = [
            deb.package(
                arch,
                distro,
                "temurin-" + java_version + "-jdk",
                "adoptium",
            ),
        ],
    )

    # standard image builds
    for user in USERS:
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
                    "temurin-" + java_version + "-jre",
                    "adoptium",
                )),
            },
            tars = [
                # we use system certs, but we might want to pull this out of the distro
                # like we did for the github released temurin
                ":temurin_" + java_version + "_jre_" + arch + "_" + distro,
            ],
        )

    # debug image builds
    for user in USERS:
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
                    "temurin-" + java_version + "-jdk",
                    "adoptium",
                )),
            },
            tars = [
                # we use system certs, but we might want to pull this out of the distro
                # like we did for the github released temurin
                ":cacerts_java_" + arch + "_" + distro,
                ":temurin_" + java_version + "_jdk_" + arch + "_" + distro,
            ],
        )

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
        extension = "tar.gz",
        symlinks = {
            "/usr/bin/java": "/usr/lib/jvm/java-" + java_version + "-openjdk-" + arch + "/bin/java",
        },
        deps = [
            deb.package(
                arch,
                distro,
                "openjdk-" + java_version + "-jre-headless",
                "java",
            ),
        ],
    )

    # image rule
    for user in USERS:
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
                    "java",
                )),
            },
            tars = [
                ":openjdk_jre_headless_" + java_version + "_" + arch + "_" + distro,
            ],
        )

    # debug image
    for user in USERS:
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
                    "java",
                )),
            },
            tars = [
                ":openjdk_jre_headless_" + java_version + "_" + arch + "_" + distro,
                deb.package(
                    arch,
                    distro,
                    "openjdk-" + java_version + "-jdk-headless",
                    "java",
                ),
            ],
        )

    java_tests(distro, java_version, arch)

def java_tests(distro, java_version, arch):
    """Tests for java images.

    Args:
        distro: name of distribution
        java_version: version of java
        arch: the target arch
    """
    for user in USERS:
        container_structure_test(
            name = "java" + java_version + "_" + user + "_" + arch + "_" + distro + "_test",
            configs = ["testdata/java" + java_version + "_" + distro + ".yaml"],
            image = ":java" + java_version + "_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )

    for user in USERS:
        container_structure_test(
            name = "java" + java_version + "_debug_" + user + "_" + arch + "_" + distro + "_test",
            configs = ["testdata/java" + java_version + "_debug" + "_" + distro + ".yaml"],
            image = ":java" + java_version + "_debug_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )

    if arch == "amd64":
        for user in USERS:
            java_image(
                name = "check_certs_java" + java_version + "_" + user + "_" + distro,
                srcs = ["testdata/CheckCerts.java"],
                base = "//java:java" + java_version + "_" + user + "_amd64_" + distro,
                main_class = "testdata.CheckCerts",
            )

        for user in USERS:
            container_structure_test(
                name = "check_certs_java" + java_version + "_" + user + "_" + distro + "_test",
                configs = ["testdata/java_certs.yaml"],
                image = ":check_certs_java" + java_version + "_" + user + "_" + distro,
                tags = [
                    "amd64",
                    "manual",
                ],
            )

        for user in USERS:
            java_image(
                name = "check_encoding_java" + java_version + "_" + user + "_" + distro,
                srcs = ["testdata/CheckEncoding.java"],
                base = "//java:java" + java_version + "_" + user + "_amd64_" + distro,
                main_class = "testdata.CheckEncoding",
            )

        for user in USERS:
            container_structure_test(
                name = "check_encoding_java" + java_version + "_" + user + "_" + distro + "_test",
                configs = ["testdata/java_encoding.yaml"],
                image = ":check_encoding_java" + java_version + "_" + user + "_" + distro,
                tags = [
                    "amd64",
                    "manual",
                ],
            )

        for user in USERS:
            java_image(
                name = "check_libharfbuzz_java" + java_version + "_" + user + "_" + distro,
                srcs = ["testdata/CheckLibharfbuzz.java"],
                base = "//java:java" + java_version + "_" + user + "_amd64_" + distro,
                main_class = "testdata.CheckLibharfbuzz",
            )

        for user in USERS:
            container_structure_test(
                name = "check_libharfbuzz_java" + java_version + "_" + user + "_" + distro + "_test",
                configs = ["testdata/java_libharfbuzz.yaml"],
                image = ":check_libharfbuzz_java" + java_version + "_" + user + "_" + distro,
                tags = [
                    "amd64",
                    "manual",
                ],
            )
