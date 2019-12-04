package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_bundle")

container_bundle(
    name = "all",
    images = {
        "gcr.io/{PROJECT_ID}/base:debug": "//base:debug",
        "gcr.io/{PROJECT_ID}/base:debug-debian10": "//base:debug_debian10",
        "gcr.io/{PROJECT_ID}/base:debug-nonroot": "//base:debug-nonroot",
        "gcr.io/{PROJECT_ID}/base:debug-nonroot-debian10": "//base:debug-nonroot_debian10",
        "gcr.io/{PROJECT_ID}/base:latest": "//base:base",
        "gcr.io/{PROJECT_ID}/base:nonroot": "//base:base-nonroot",
        "gcr.io/{PROJECT_ID}/base:nonroot-debian10": "//base:base-nonroot_debian10",
        "gcr.io/{PROJECT_ID}/static:debian10": "//base:static_debian10",
        "gcr.io/{PROJECT_ID}/static:latest": "//base:static",
        "gcr.io/{PROJECT_ID}/static:nonroot": "//base:static-nonroot",
        "gcr.io/{PROJECT_ID}/static:nonroot-debian10": "//base:static-nonroot_debian10",
        "gcr.io/{PROJECT_ID}/cc:debug": "//cc:debug",
        "gcr.io/{PROJECT_ID}/java:latest": "//java:java8",
        "gcr.io/{PROJECT_ID}/java:8": "//java:java8",
        "gcr.io/{PROJECT_ID}/java:debug": "//java:java8_debug",
        "gcr.io/{PROJECT_ID}/java:8-debug": "//java:java8_debug",
        "gcr.io/{PROJECT_ID}/java:11": "//java:java11",
        "gcr.io/{PROJECT_ID}/java:11-debug": "//java:java11_debug",
        "gcr.io/{PROJECT_ID}/java/jetty:latest": "//java/jetty:jetty_java8",
        "gcr.io/{PROJECT_ID}/java/jetty:java8": "//java/jetty:jetty_java8",
        "gcr.io/{PROJECT_ID}/java/jetty:debug": "//java/jetty:jetty_java8_debug",
        "gcr.io/{PROJECT_ID}/java/jetty:java8-debug": "//java/jetty:jetty_java8_debug",
        "gcr.io/{PROJECT_ID}/java/jetty:java11": "//java/jetty:jetty_java11",
        "gcr.io/{PROJECT_ID}/java/jetty:java11-debug": "//java/jetty:jetty_java11_debug",
        "gcr.io/{PROJECT_ID}/python3:latest": "//experimental/python3:python3",
        "gcr.io/{PROJECT_ID}/python3:debug": "//experimental/python3:debug",
        "gcr.io/{PROJECT_ID}/python2.7:latest": "//experimental/python2.7:python27",
        "gcr.io/{PROJECT_ID}/python2.7:debug": "//experimental/python2.7:debug",
        "gcr.io/{PROJECT_ID}/nodejs:latest": "//experimental/nodejs",
        "gcr.io/{PROJECT_ID}/nodejs:debug": "//experimental/nodejs:debug",
        "gcr.io/{PROJECT_ID}/dotnet:latest": "//experimental/dotnet",
        "gcr.io/{PROJECT_ID}/dotnet:debug": "//experimental/dotnet:debug",
    },
)

load("@io_bazel_rules_docker//contrib:push-all.bzl", "container_push")

container_push(
    name = "publish",
    bundle = ":all",
    format = "Docker",
)
