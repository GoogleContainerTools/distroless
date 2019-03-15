package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//java:image.bzl", "java_image")
load("@package_bundle//file:packages.bzl", "packages", "versions")
load("//cacerts:java.bzl", "cacerts_java")
load("//java:jre_ver.bzl", "jre_ver")

cacerts_java(
    name = "cacerts_java",
)

[container_image(
    name = rule_name,
    base = "//cc" if (not ("debug" in rule_name)) else "//cc:debug",
    debs = [
        packages["zlib1g"],
        packages["libjpeg62-turbo"],
        packages["libpng16-16"],
        packages["libfreetype6"],
        packages["fonts-dejavu-core"],
        packages["fontconfig-config"],
        packages["libexpat1"],
        packages["libfontconfig1"],
        packages[jre_deb],
    ],
    entrypoint = ["/usr/bin/java"] + java_vm_args + ["-jar"],
    # We expect users to use:
    # cmd = ["/path/to/deploy.jar", "--option1", ...]
    env = {
        "JAVA_VERSION": jre_ver(versions[jre_deb]),
    },
    symlinks = {
        "/usr/bin/java": java_executable_path,
    },
    tars = [":cacerts_java"],
) for (rule_name, jre_deb, java_executable_path, java_vm_args) in [
    (
        "java8",
        "openjdk-8-jre-headless",
        "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java",
        [
            # special container flags are unnecessary with 1.8.0_191 and beyond
            "-XX:+UnlockExperimentalVMOptions",
            "-XX:+UseCGroupMemoryLimitForHeap",
        ],
    ),
    (
        "java8_debug",
        "openjdk-8-jre-headless",
        "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java",
        [
            # special container flags are unnecessary with 1.8.0_191 and beyond
            "-XX:+UnlockExperimentalVMOptions",
            "-XX:+UseCGroupMemoryLimitForHeap",
        ],
    ),
    ("java11", "openjdk-11-jre-headless", "/usr/lib/jvm/java-11-openjdk-amd64/bin/java", []),
    ("java11_debug", "openjdk-11-jre-headless", "/usr/lib/jvm/java-11-openjdk-amd64/bin/java", []),
]]

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_test(
    name = "java8_test",
    configs = ["testdata/java8.yaml"],
    image = ":java8",
)

container_test(
    name = "java8_debug_test",
    configs = ["testdata/java8_debug.yaml"],
    image = ":java8_debug",
)

container_test(
    name = "java11_test",
    configs = ["testdata/java11.yaml"],
    image = ":java11",
)

container_test(
    name = "java11_debug_test",
    configs = ["testdata/java11_debug.yaml"],
    image = ":java11_debug",
)

java_image(
    name = "check_certs_java8",
    srcs = ["testdata/CheckCerts.java"],
    base = "//java:java8",
    main_class = "testdata.CheckCerts",
)

java_image(
    name = "check_certs_java11",
    srcs = ["testdata/CheckCerts.java"],
    base = "//java:java11",
    main_class = "testdata.CheckCerts",
)

container_test(
    name = "check_certs_java8_test",
    configs = ["testdata/java8_certs.yaml"],
    image = ":check_certs_java8",
)

container_test(
    name = "check_certs_java11_test",
    configs = ["testdata/java11_certs.yaml"],
    image = ":check_certs_java11",
)
