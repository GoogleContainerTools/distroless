package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_bundle")
load("//:checksums.bzl", "ARCHITECTURES", "BASE_ARCHITECTURES")

LABEL_USERS = [
    ("latest", "root"),
    ("nonroot", "nonroot"),
]

DISTROS = [
    "debian9",
    "debian10",
]

STATIC = dict({
    "gcr.io/{PROJECT_ID}/static:{COMMIT_SHA}": "//base:static_root_amd64_debian9",
    "gcr.io/{PROJECT_ID}/static-debian9:{COMMIT_SHA}": "//base:static_root_amd64_debian9",
    "gcr.io/{PROJECT_ID}/static-debian10:{COMMIT_SHA}": "//base:static_root_amd64_debian10",
})

STATIC.update({
    "gcr.io/{PROJECT_ID}/static:" + label + "-" + arch: "//base:static_" + user + "_" + arch + "_debian9"
    for arch in ARCHITECTURES
    for (label, user) in LABEL_USERS
})

STATIC.update({
    "gcr.io/{PROJECT_ID}/static-" + distro + ":" + label + "-" + arch: "//base:static_" + user + "_" + arch + "_" + distro
    for arch in ARCHITECTURES
    for (label, user) in LABEL_USERS
    for distro in DISTROS
})

BASE = {
    "gcr.io/{PROJECT_ID}/base:{COMMIT_SHA}": "//base:base_root_amd64_debian9",
    "gcr.io/{PROJECT_ID}/base-debian9:{COMMIT_SHA}": "//base:base_root_amd64_debian9",
    "gcr.io/{PROJECT_ID}/base-debian10:{COMMIT_SHA}": "//base:base_root_amd64_debian10",
}

BASE.update({
    "gcr.io/{PROJECT_ID}/base:" + tag_base + "-" + arch: "//base:" + label + "_" + user + "_" + arch + "_debian9"
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "base", "root"),
        ("nonroot", "base", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
})

BASE.update({
    "gcr.io/{PROJECT_ID}/base-" + distro + ":" + tag_base + "-" + arch: "//base:" + label + "_" + user + "_" + arch + "_" + distro
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
    "gcr.io/{PROJECT_ID}/cc:{COMMIT_SHA}": "//cc:cc_root_amd64_debian9",
    "gcr.io/{PROJECT_ID}/cc-debian9:{COMMIT_SHA}": "//cc:cc_root_amd64_debian9",
    "gcr.io/{PROJECT_ID}/cc-debian10:{COMMIT_SHA}": "//cc:cc_root_amd64_debian10",
}

CC.update({
    "gcr.io/{PROJECT_ID}/cc:" + tag_base + "-" + arch: "//cc:" + label + "_" + user + "_" + arch + "_debian9"
    for arch in ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "cc", "root"),
        ("nonroot", "cc", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
})

CC.update({
    "gcr.io/{PROJECT_ID}/cc-" + distro + ":" + tag_base + "-" + arch: "//cc:" + label + "_" + user + "_" + arch + "_" + distro
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
    "gcr.io/{PROJECT_ID}/python3:" + tag_base + "-" + arch: "//experimental/python3:" + label + "_" + user + "_" + arch + "_debian9"
    for arch in BASE_ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "python3", "root"),
        ("nonroot", "python3", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
}

PYTHON3.update({
    "gcr.io/{PROJECT_ID}/python3-" + distro + ":" + tag_base + "-" + arch: "//experimental/python3:" + label + "_" + user + "_" + arch + "_" + distro
    for arch in BASE_ARCHITECTURES
    for (tag_base, label, user) in [
        ("latest", "python3", "root"),
        ("nonroot", "python3", "nonroot"),
        ("debug", "debug", "root"),
        ("debug-nonroot", "debug", "nonroot"),
    ]
    for distro in DISTROS
})

PYTHON27 = {
    "gcr.io/{PROJECT_ID}/python2.7:" + tag_base + "-" + arch: "//experimental/python2.7:" + label + "_" + arch + "_debian9"
    for arch in BASE_ARCHITECTURES
    for (tag_base, label) in [
        ("latest", "python27"),
        ("debug", "debug"),
    ]
}

PYTHON27.update({
    "gcr.io/{PROJECT_ID}/python2.7-" + distro + ":" + tag_base + "-" + arch: "//experimental/python2.7:" + label + "_" + arch + "_" + distro
    for arch in BASE_ARCHITECTURES
    for (tag_base, label) in [
        ("latest", "python27"),
        ("debug", "debug"),
    ]
    for distro in DISTROS
})

NODEJS = {
    "gcr.io/{PROJECT_ID}/nodejs:latest-amd64": "//nodejs:nodejs14_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs:latest-arm64": "//nodejs:nodejs14_arm64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs:debug-amd64": "//nodejs:nodejs14_debug_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs:debug-arm64": "//nodejs:nodejs14_debug_arm64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian9:latest": "//nodejs:nodejs14_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian9:debug": "//nodejs:nodejs14_debug_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian10:latest": "//nodejs:nodejs14_amd64_debian10",
    "gcr.io/{PROJECT_ID}/nodejs-debian10:debug": "//nodejs:nodejs14_debug_amd64_debian10",
    "gcr.io/{PROJECT_ID}/nodejs:10": "//nodejs:nodejs10_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs:12": "//nodejs:nodejs12_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs:14": "//nodejs:nodejs14_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs:10-debug": "//nodejs:nodejs10_debug_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs:12-debug": "//nodejs:nodejs12_debug_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs:14-debug": "//nodejs:nodejs14_debug_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian9:10": "//nodejs:nodejs10_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian9:12": "//nodejs:nodejs12_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian9:14": "//nodejs:nodejs14_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian9:10-debug": "//nodejs:nodejs10_debug_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian9:12-debug": "//nodejs:nodejs12_debug_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian9:14-debug": "//nodejs:nodejs14_debug_amd64_debian9",
    "gcr.io/{PROJECT_ID}/nodejs-debian10:10": "//nodejs:nodejs10_amd64_debian10",
    "gcr.io/{PROJECT_ID}/nodejs-debian10:12": "//nodejs:nodejs12_amd64_debian10",
    "gcr.io/{PROJECT_ID}/nodejs-debian10:14": "//nodejs:nodejs14_amd64_debian10",
    "gcr.io/{PROJECT_ID}/nodejs-debian10:10-debug": "//nodejs:nodejs10_debug_amd64_debian10",
    "gcr.io/{PROJECT_ID}/nodejs-debian10:12-debug": "//nodejs:nodejs12_debug_amd64_debian10",
    "gcr.io/{PROJECT_ID}/nodejs-debian10:14-debug": "//nodejs:nodejs14_debug_amd64_debian10",
}

DOTNET = {
    "gcr.io/{PROJECT_ID}/dotnet:latest": "//experimental/dotnet:dotnet_debian9",
    "gcr.io/{PROJECT_ID}/dotnet-debian9:latest": "//experimental/dotnet:dotnet_debian9",
    "gcr.io/{PROJECT_ID}/dotnet-debian10:latest": "//experimental/dotnet:dotnet_debian10",
    "gcr.io/{PROJECT_ID}/dotnet:debug": "//experimental/dotnet:dotnet_debug_debian9",
    "gcr.io/{PROJECT_ID}/dotnet-debian9:debug": "//experimental/dotnet:dotnet_debug_debian9",
    "gcr.io/{PROJECT_ID}/dotnet-debian10:debug": "//experimental/dotnet:dotnet_debug_debian10",
    "gcr.io/{PROJECT_ID}/dotnet/core/aspnet:latest": "//experimental/dotnet:dotnet_core_aspnet_debian9",
    "gcr.io/{PROJECT_ID}/dotnet/core/aspnet:3.1": "//experimental/dotnet:dotnet_core_aspnet_debian9",
    "gcr.io/{PROJECT_ID}/dotnet/core/aspnet:debug": "//experimental/dotnet:dotnet_core_aspnet_debug_debian9",
    "gcr.io/{PROJECT_ID}/dotnet/core/runtime:latest": "//experimental/dotnet:dotnet_core_runtime_debian9",
    "gcr.io/{PROJECT_ID}/dotnet/core/runtime:3.1": "//experimental/dotnet:dotnet_core_runtime_debian9",
    "gcr.io/{PROJECT_ID}/dotnet/core/runtime:debug": "//experimental/dotnet:dotnet_core_runtime_debug_debian9",
    "gcr.io/{PROJECT_ID}/dotnet/core/sdk:latest": "//experimental/dotnet:dotnet_core_sdk_debian9",
    "gcr.io/{PROJECT_ID}/dotnet/core/sdk:3.1": "//experimental/dotnet:dotnet_core_sdk_debian9",
    "gcr.io/{PROJECT_ID}/dotnet/core/sdk:debug": "//experimental/dotnet:dotnet_core_sdk_debug_debian9",
}

JAVA = {
    "gcr.io/{PROJECT_ID}/java:base": "//java:java_base_root_debian9",
    "gcr.io/{PROJECT_ID}/java:base-nonroot": "//java:java_base_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:base": "//java:java_base_root_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:base-nonroot": "//java:java_base_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java:base-debug": "//java:java_base_debug_root_debian9",
    "gcr.io/{PROJECT_ID}/java:base-debug-nonroot": "//java:java_base_debug_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:base-debug": "//java:java_base_debug_root_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:base-debug-nonroot": "//java:java_base_debug_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java:latest": "//java:java8_root_debian9",
    "gcr.io/{PROJECT_ID}/java:nonroot": "//java:java8_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java:8": "//java:java8_root_debian9",
    "gcr.io/{PROJECT_ID}/java:8-nonroot": "//java:java8_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:latest": "//java:java8_root_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:nonroot": "//java:java8_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:8": "//java:java8_root_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:8-nonroot": "//java:java8_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java:debug": "//java:java8_debug_root_debian9",
    "gcr.io/{PROJECT_ID}/java:debug-nonroot": "//java:java8_debug_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java:8-debug": "//java:java8_debug_root_debian9",
    "gcr.io/{PROJECT_ID}/java:8-debug-nonroot": "//java:java8_debug_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:debug": "//java:java8_debug_root_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:debug-nonroot": "//java:java8_debug_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:8-debug": "//java:java8_debug_root_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:8-debug-nonroot": "//java:java8_debug_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java:11": "//java:java11_root_debian9",
    "gcr.io/{PROJECT_ID}/java:11-nonroot": "//java:java11_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:11": "//java:java11_root_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:11-nonroot": "//java:java11_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java:11-debug": "//java:java11_debug_root_debian9",
    "gcr.io/{PROJECT_ID}/java:11-debug-nonroot": "//java:java11_debug_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:11-debug": "//java:java11_debug_root_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9:11-debug-nonroot": "//java:java11_debug_nonroot_debian9",
    "gcr.io/{PROJECT_ID}/java-debian10:base": "//java:java_base_root_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:base-nonroot": "//java:java_base_nonroot_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:base-debug": "//java:java_base_debug_root_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:base-debug-nonroot": "//java:java_base_debug_nonroot_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:latest": "//java:java11_root_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:nonroot": "//java:java11_nonroot_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:11": "//java:java11_root_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:11-nonroot": "//java:java11_nonroot_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:debug": "//java:java11_debug_root_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:debug-nonroot": "//java:java11_debug_nonroot_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:11-debug": "//java:java11_debug_root_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10:11-debug-nonroot": "//java:java11_debug_nonroot_debian10",
    "gcr.io/{PROJECT_ID}/java/jetty:latest": "//java/jetty:jetty_java8_debian9",
    "gcr.io/{PROJECT_ID}/java/jetty:java8": "//java/jetty:jetty_java8_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9/jetty:latest": "//java/jetty:jetty_java8_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9/jetty:java8": "//java/jetty:jetty_java8_debian9",
    "gcr.io/{PROJECT_ID}/java/jetty:debug": "//java/jetty:jetty_java8_debug_debian9",
    "gcr.io/{PROJECT_ID}/java/jetty:java8-debug": "//java/jetty:jetty_java8_debug_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9/jetty:debug": "//java/jetty:jetty_java8_debug_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9/jetty:java8-debug": "//java/jetty:jetty_java8_debug_debian9",
    "gcr.io/{PROJECT_ID}/java/jetty:java11": "//java/jetty:jetty_java11_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9/jetty:java11": "//java/jetty:jetty_java11_debian9",
    "gcr.io/{PROJECT_ID}/java/jetty:java11-debug": "//java/jetty:jetty_java11_debug_debian9",
    "gcr.io/{PROJECT_ID}/java-debian9/jetty:java11-debug": "//java/jetty:jetty_java11_debug_debian9",
    "gcr.io/{PROJECT_ID}/java-debian10/jetty:latest": "//java/jetty:jetty_java11_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10/jetty:java11": "//java/jetty:jetty_java11_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10/jetty:debug": "//java/jetty:jetty_java11_debug_debian10",
    "gcr.io/{PROJECT_ID}/java-debian10/jetty:java11-debug": "//java/jetty:jetty_java11_debug_debian10",
}

ALL = {}

ALL.update(STATIC)

ALL.update(BASE)

ALL.update(CC)

ALL.update(PYTHON3)

ALL.update(PYTHON27)

ALL.update(NODEJS)

ALL.update(DOTNET)

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
