package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_bundle")

container_bundle(
    name = "all",
    images = {
        "tradeixdev.azurecr.io/distroless/static:nonroot": "//base:static-nonroot",
        "tradeixdev.azurecr.io/distroless/base:nonroot": "//base:base-nonroot",
        "tradeixdev.azurecr.io/distroless/base:debug": "//base:debug",
        "tradeixdev.azurecr.io/distroless/base:debug-nonroot": "//base:debug-nonroot",
        "tradeixdev.azurecr.io/distroless/cc:debug": "//cc:debug",
        "tradeixdev.azurecr.io/distroless/java:latest": "//java:java8",
        "tradeixdev.azurecr.io/distroless/java:8": "//java:java8",
        "tradeixdev.azurecr.io/distroless/java:debug": "//java:java8_debug",
        "tradeixdev.azurecr.io/distroless/java:8-debug": "//java:java8_debug",
        "tradeixdev.azurecr.io/distroless/java:11": "//java:java11",
        "tradeixdev.azurecr.io/distroless/java:11-debug": "//java:java11_debug",
        "tradeixdev.azurecr.io/distroless/java/jetty:latest": "//java/jetty:jetty_java8",
        "tradeixdev.azurecr.io/distroless/java/jetty:java8": "//java/jetty:jetty_java8",
        "tradeixdev.azurecr.io/distroless/java/jetty:debug": "//java/jetty:jetty_java8_debug",
        "tradeixdev.azurecr.io/distroless/java/jetty:java8-debug": "//java/jetty:jetty_java8_debug",
        "tradeixdev.azurecr.io/distroless/java/jetty:java11": "//java/jetty:jetty_java11",
        "tradeixdev.azurecr.io/distroless/java/jetty:java11-debug": "//java/jetty:jetty_java11_debug",
        "tradeixdev.azurecr.io/distroless/python3:latest": "//experimental/python3:python3",
        "tradeixdev.azurecr.io/distroless/python3:debug": "//experimental/python3:debug",
        "tradeixdev.azurecr.io/distroless/python2.7:latest": "//experimental/python2.7:python27",
        "tradeixdev.azurecr.io/distroless/python2.7:debug": "//experimental/python2.7:debug",
        "tradeixdev.azurecr.io/distroless/nodejs:latest": "//experimental/nodejs",
        "tradeixdev.azurecr.io/distroless/nodejs:debug": "//experimental/nodejs:debug",
        "tradeixdev.azurecr.io/distroless/dotnet:latest": "//experimental/dotnet",
        "tradeixdev.azurecr.io/distroless/dotnet:debug": "//experimental/dotnet:debug",
    },
)

load("@io_bazel_rules_docker//contrib:push-all.bzl", "container_push")

container_push(
    name = "publish",
    bundle = ":all",
    format = "Docker",
)
