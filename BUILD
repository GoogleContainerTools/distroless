package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_bundle")
load("//:checksums.bzl", "ARCHITECTURES", "BASE_ARCHITECTURES")

LABEL_USERS = [
    ("latest", "root"),
    ("nonroot", "nonroot"),
]

DISTROS = [
    "debian10",
    "debian11",
]

STATIC = dict({
    "{REGISTRY}/{PROJECT_ID}/static:{COMMIT_SHA}": "//base:static_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/static-debian11:{COMMIT_SHA}": "//base:static_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/static-debian10:{COMMIT_SHA}": "//base:static_root_amd64_debian10",
})

STATIC.update({
    "{REGISTRY}/{PROJECT_ID}/static:" + tag_base + "-" + arch: "//base:" + label + "_" + user + "_" + arch + "_debian11"
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "static", "root"),
        ("nonroot", "static", "nonroot"),
        ("debug", "static_debug", "root"),
        ("debug-nonroot", "static_debug", "nonroot"),
    ]
})

STATIC.update({
    "{REGISTRY}/{PROJECT_ID}/static-" + distro + ":" + tag_base + "-" + arch: "//base:" + label + "_" + user + "_" + arch + "_" + distro
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "static", "root"),
        ("nonroot", "static", "nonroot"),
        ("debug", "static_debug", "root"),
        ("debug-nonroot", "static_debug", "nonroot"),
    ]
    for distro in DISTROS
})

BASE = {
    "{REGISTRY}/{PROJECT_ID}/base:{COMMIT_SHA}": "//base:base_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/base-debian11:{COMMIT_SHA}": "//base:base_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/base-debian10:{COMMIT_SHA}": "//base:base_root_amd64_debian10",
}

BASE.update({
    "{REGISTRY}/{PROJECT_ID}/base:" + tag_base + "-" + arch: "//base:" + label + "_" + user + "_" + arch + "_debian11"
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "base", "root"),
        ("nonroot", "base", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
})

BASE.update({
    "{REGISTRY}/{PROJECT_ID}/base-" + distro + ":" + tag_base + "-" + arch: "//base:" + label + "_" + user + "_" + arch + "_" + distro
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "base", "root"),
        ("nonroot", "base", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
    for distro in DISTROS
})

CC = {
    "{REGISTRY}/{PROJECT_ID}/cc:{COMMIT_SHA}": "//cc:cc_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/cc-debian11:{COMMIT_SHA}": "//cc:cc_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/cc-debian10:{COMMIT_SHA}": "//cc:cc_root_amd64_debian10",
}

CC.update({
    "{REGISTRY}/{PROJECT_ID}/cc:" + tag_base + "-" + arch: "//cc:" + label + "_" + user + "_" + arch + "_debian11"
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "cc", "root"),
        ("nonroot", "cc", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
})

CC.update({
    "{REGISTRY}/{PROJECT_ID}/cc-" + distro + ":" + tag_base + "-" + arch: "//cc:" + label + "_" + user + "_" + arch + "_" + distro
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "cc", "root"),
        ("nonroot", "cc", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
    for distro in DISTROS
})

PYTHON3 = {
    "{REGISTRY}/{PROJECT_ID}/python3:" + tag_base + "-" + arch: "//experimental/python3:" + label + "_" + user + "_" + arch + "_debian11"
    for arch in BASE_ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "python3", "root"),
        ("nonroot", "python3", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
}

PYTHON3.update({
    "{REGISTRY}/{PROJECT_ID}/python3-" + distro + ":" + tag_base + "-" + arch: "//experimental/python3:" + label + "_" + user + "_" + arch + "_" + distro
    for arch in BASE_ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "python3", "root"),
        ("nonroot", "python3", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
    for distro in DISTROS
})

NODEJS = {
    "{REGISTRY}/{PROJECT_ID}/nodejs:latest-amd64": "//nodejs:nodejs16_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:latest-arm64": "//nodejs:nodejs16_arm64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:debug-amd64": "//nodejs:nodejs16_debug_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:debug-arm64": "//nodejs:nodejs16_debug_arm64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian10:latest": "//nodejs:nodejs16_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian10:debug": "//nodejs:nodejs16_debug_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/nodejs:12": "//nodejs:nodejs12_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:14": "//nodejs:nodejs14_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:16": "//nodejs:nodejs16_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:12-debug": "//nodejs:nodejs12_debug_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:14-debug": "//nodejs:nodejs14_debug_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:16-debug": "//nodejs:nodejs16_debug_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian10:12": "//nodejs:nodejs12_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian10:14": "//nodejs:nodejs14_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian10:16": "//nodejs:nodejs16_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian10:12-debug": "//nodejs:nodejs12_debug_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian10:14-debug": "//nodejs:nodejs14_debug_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian10:16-debug": "//nodejs:nodejs16_debug_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:latest": "//nodejs:nodejs16_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:debug": "//nodejs:nodejs16_debug_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:12": "//nodejs:nodejs12_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:14": "//nodejs:nodejs14_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:16": "//nodejs:nodejs16_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:12-debug": "//nodejs:nodejs12_debug_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:14-debug": "//nodejs:nodejs14_debug_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:16-debug": "//nodejs:nodejs16_debug_amd64_debian11",
}

JAVA = {
    "{REGISTRY}/{PROJECT_ID}/java:base": "//java:java_base_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:base-nonroot": "//java:java_base_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:base-debug": "//java:java_base_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:base-debug-nonroot": "//java:java_base_debug_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:latest": "//java:java11_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:nonroot": "//java:java11_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:debug": "//java:java11_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:debug-nonroot": "//java:java11_debug_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:11": "//java:java11_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:11-nonroot": "//java:java11_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:11-debug": "//java:java11_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java:11-debug-nonroot": "//java:java11_debug_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:base": "//java:java_base_root_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:base-nonroot": "//java:java_base_nonroot_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:base-debug": "//java:java_base_debug_root_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:base-debug-nonroot": "//java:java_base_debug_nonroot_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:latest": "//java:java11_root_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:nonroot": "//java:java11_nonroot_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:11": "//java:java11_root_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:11-nonroot": "//java:java11_nonroot_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:debug": "//java:java11_debug_root_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:debug-nonroot": "//java:java11_debug_nonroot_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:11-debug": "//java:java11_debug_root_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10:11-debug-nonroot": "//java:java11_debug_nonroot_amd64_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:base": "//java:java_base_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:base-nonroot": "//java:java_base_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:base-debug": "//java:java_base_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:base-debug-nonroot": "//java:java_base_debug_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:latest": "//java:java11_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:nonroot": "//java:java11_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:11": "//java:java11_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:11-nonroot": "//java:java11_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:debug": "//java:java11_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:debug-nonroot": "//java:java11_debug_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:11-debug": "//java:java11_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11:11-debug-nonroot": "//java:java11_debug_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java/jetty:latest": "//java/jetty:jetty_java11_debian11",
    "{REGISTRY}/{PROJECT_ID}/java/jetty:debug": "//java/jetty:jetty_java11_debug_debian11",
    "{REGISTRY}/{PROJECT_ID}/java/jetty:java11": "//java/jetty:jetty_java11_debian11",
    "{REGISTRY}/{PROJECT_ID}/java/jetty:java11-debug": "//java/jetty:jetty_java11_debug_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian10/jetty:latest": "//java/jetty:jetty_java11_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10/jetty:java11": "//java/jetty:jetty_java11_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10/jetty:debug": "//java/jetty:jetty_java11_debug_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian10/jetty:java11-debug": "//java/jetty:jetty_java11_debug_debian10",
    "{REGISTRY}/{PROJECT_ID}/java-debian11/jetty:latest": "//java/jetty:jetty_java11_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11/jetty:java11": "//java/jetty:jetty_java11_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11/jetty:debug": "//java/jetty:jetty_java11_debug_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11/jetty:java11-debug": "//java/jetty:jetty_java11_debug_debian11",
}

ALL = {}

ALL.update(STATIC)

ALL.update(BASE)

ALL.update(CC)

ALL.update(PYTHON3)

ALL.update(NODEJS)

ALL.update(JAVA)

container_bundle(
    name = "all",
    images = ALL,
)

load("@io_bazel_rules_docker//contrib:push-all.bzl", "container_push")

container_push(
    name = "publish",
    bundle = ":all",
    format = "Docker",
    # Push images sequentially, to avoid a bug in rules_docker related to
    # pushing many images in parallel.
    # https://github.com/bazelbuild/rules_docker/issues/525
    sequential = True,
)

# do not publish these until java 17 is out of preview, leave them here for preview testing
JAVA17 = {
    "distroless/java:17": "//java:java17_root_amd64_debian11",
    "distroless/java:17-nonroot": "//java:java17_nonroot_amd64_debian11",
    "distroless/java:17-debug": "//java:java17_debug_root_amd64_debian11",
    "distroless/java:17-debug-nonroot": "//java:java17_debug_nonroot_amd64_debian11",
    "distroless/java:17-arm64": "//java:java17_root_arm64_debian11",
    "distroless/java:17-nonroot-arm64": "//java:java17_nonroot_arm64_debian11",
    "distroless/java:17-debug-arm64": "//java:java17_debug_root_arm64_debian11",
    "distroless/java:17-debug-nonroot-arm64": "//java:java17_debug_nonroot_arm64_debian11",
}

container_bundle(
    name = "java17_preview",
    images = JAVA17,
)
