package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_bundle")
load("//:checksums.bzl", "ARCHITECTURES", "BASE_ARCHITECTURES")
load("//base:distro.bzl", "DISTROS", "LANGUAGE_DISTROS")

JAVA_ARCHITECTURES = BASE_ARCHITECTURES + [
    "s390x",
    "ppc64le",
]

LABEL_USERS = [
    ("latest", "root"),
    ("nonroot", "nonroot"),
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
    for distro in LANGUAGE_DISTROS
})

# "dotnet-" + version + "_runtime-deps_" + variant + mode + "_" + user + "_" + arch + "_" + distro

DOTNET_RUNTIME_DEPS = {
    "{REGISTRY}/{PROJECT_ID}/distroless-dotnet-" + version + "_" + variant + ":" + mode + user + "-" + arch: "//experimental/dotnet:dotnet-" + version + "_runtime-deps_" + variant + mode2 + "_" + user + "_" + arch + "_debian11"
    for arch in BASE_ARCHITECTURES
    for version in ["6.0", "7.0"]
    for variant in ["slim", "full"]
    for (mode, mode2) in [("", ""), ("debug_", "_debug")]
    for user in ["nonroot", "root"]
}

NODEJS = {
    "{REGISTRY}/{PROJECT_ID}/nodejs:14": "//nodejs:nodejs14_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs:14-debug": "//nodejs:nodejs14_debug_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:14": "//nodejs:nodejs14_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/nodejs-debian11:14-debug": "//nodejs:nodejs14_debug_amd64_debian11",
}

NODEJS.update({
    "{REGISTRY}/{PROJECT_ID}/nodejs:" + tag_base + "-" + arch: "//nodejs:nodejs16" + suffix + "_" + arch + "_debian11"
    for arch in BASE_ARCHITECTURES
    for (tag_base, suffix) in [
        ("16", ""),
        ("16-debug", "_debug"),
    ]
})

NODEJS.update({
    "{REGISTRY}/{PROJECT_ID}/nodejs-" + distro + ":" + tag_base + "-" + arch: "//nodejs:nodejs16" + suffix + "_" + arch + "_" + distro
    for arch in BASE_ARCHITECTURES
    for (tag_base, suffix) in [
        ("16", ""),
        ("16-debug", "_debug"),
    ]
    for distro in LANGUAGE_DISTROS
})

NODEJS.update({
    "{REGISTRY}/{PROJECT_ID}/nodejs:" + tag_base + "-" + arch: "//nodejs:nodejs18" + suffix + "_" + arch + "_debian11"
    for arch in BASE_ARCHITECTURES
    for (tag_base, suffix) in [
        ("latest", ""),
        ("debug", "_debug"),
        ("18", ""),
        ("18-debug", "_debug"),
    ]
})

NODEJS.update({
    "{REGISTRY}/{PROJECT_ID}/nodejs-" + distro + ":" + tag_base + "-" + arch: "//nodejs:nodejs18" + suffix + "_" + arch + "_" + distro
    for arch in BASE_ARCHITECTURES
    for (tag_base, suffix) in [
        ("latest", ""),
        ("debug", "_debug"),
        ("18", ""),
        ("18-debug", "_debug"),
    ]
    for distro in LANGUAGE_DISTROS
})

JAVA_BASE = {
    "{REGISTRY}/{PROJECT_ID}/java-base:latest": "//java:java_base_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-base:nonroot": "//java:java_base_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-base:debug": "//java:java_base_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-base:debug-nonroot": "//java:java_base_debug_nonroot_amd64_debian11",
}

JAVA_BASE.update({
    "{REGISTRY}/{PROJECT_ID}/java-base-debian11:" + tag_base + "-" + arch: "//java:java_base_" + label + "_" + arch + "_debian11"
    for arch in JAVA_ARCHITECTURES
    for (tag_base, label) in [
        ("latest", "root"),
        ("nonroot", "nonroot"),
        ("debug", "debug_root"),
        ("debug-nonroot", "debug_nonroot"),
    ]
})

JAVA11 = {
    "{REGISTRY}/{PROJECT_ID}/java11:latest": "//java:java11_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java11:nonroot": "//java:java11_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java11:debug": "//java:java11_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java11:debug-nonroot": "//java:java11_debug_nonroot_amd64_debian11",
}

JAVA11.update({
    "{REGISTRY}/{PROJECT_ID}/java11-debian11:" + tag_base + "-" + arch: "//java:java11_" + label + "_" + arch + "_debian11"
    for (tag_base, label) in [
        ("latest", "root"),
        ("nonroot", "nonroot"),
        ("debug", "debug_root"),
        ("debug-nonroot", "debug_nonroot"),
    ]
    for arch in JAVA_ARCHITECTURES
})

JAVA17 = {
    "{REGISTRY}/{PROJECT_ID}/java17:latest": "//java:java17_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java17:nonroot": "//java:java17_nonroot_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java17:debug": "//java:java17_debug_root_amd64_debian11",
    "{REGISTRY}/{PROJECT_ID}/java17:debug-nonroot": "//java:java17_debug_nonroot_amd64_debian11",
}

JAVA17.update({
    "{REGISTRY}/{PROJECT_ID}/java17-debian11:" + tag_base + "-" + arch: "//java:java17_" + label + "_" + arch + "_debian11"
    for (tag_base, label) in [
        ("latest", "root"),
        ("nonroot", "nonroot"),
        ("debug", "debug_root"),
        ("debug-nonroot", "debug_nonroot"),
    ]
    for arch in JAVA_ARCHITECTURES
})

JETTY = {
    "{REGISTRY}/{PROJECT_ID}/java/jetty:latest": "//java/jetty:jetty_java11_debian11",
    "{REGISTRY}/{PROJECT_ID}/java/jetty:debug": "//java/jetty:jetty_java11_debug_debian11",
    "{REGISTRY}/{PROJECT_ID}/java/jetty:java11": "//java/jetty:jetty_java11_debian11",
    "{REGISTRY}/{PROJECT_ID}/java/jetty:java11-debug": "//java/jetty:jetty_java11_debug_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11/jetty:latest": "//java/jetty:jetty_java11_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11/jetty:java11": "//java/jetty:jetty_java11_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11/jetty:debug": "//java/jetty:jetty_java11_debug_debian11",
    "{REGISTRY}/{PROJECT_ID}/java-debian11/jetty:java11-debug": "//java/jetty:jetty_java11_debug_debian11",
}

ALL = {}

# ALL.update(STATIC)
#
# ALL.update(BASE)
#
# ALL.update(CC)
#
# ALL.update(PYTHON3)
# 
# ALL.update(NODEJS)
# 
# ALL.update(JAVA_BASE)
# 
# ALL.update(JAVA11)
# 
# ALL.update(JAVA17)
# 
# ALL.update(JETTY)

ALL.update(DOTNET_RUNTIME_DEPS)

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
