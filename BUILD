package(default_visibility = ["//visibility:public"])

# Go boilerplate
load("@io_bazel_rules_go//go:def.bzl", "go_prefix")

go_prefix("github.com/GoogleContainerTools/distroless")

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_bundle")

docker_bundle(
    name = "all",
    images = {
        "gcr.io/{PROJECT_ID}/base:latest": "//base",
        "gcr.io/{PROJECT_ID}/base:debug": "//base:debug",
        "gcr.io/{PROJECT_ID}/cc:latest": "//cc",
        "gcr.io/{PROJECT_ID}/cc:debug": "//cc:debug",
        "gcr.io/{PROJECT_ID}/java:latest": "//java:java8",
        "gcr.io/{PROJECT_ID}/java:debug": "//java:debug",
        "gcr.io/{PROJECT_ID}/java/jetty:latest": "//java/jetty",
        "gcr.io/{PROJECT_ID}/java/jetty:debug": "//java/jetty:debug",
        "gcr.io/{PROJECT_ID}/python3:latest": "//experimental/python3:python3",
        "gcr.io/{PROJECT_ID}/python3:debug": "//experimental/python3:debug",
        "gcr.io/{PROJECT_ID}/python2.7:latest": "//experimental/python2.7:python27",
        "gcr.io/{PROJECT_ID}/python2.7:debug": "//experimental/python2.7:debug",
        "gcr.io/{PROJECT_ID}/nodejs:latest": "//experimental/nodejs",
        "gcr.io/{PROJECT_ID}/nodejs:debug": "//experimental/nodejs:debug",
        "gcr.io/{PROJECT_ID}/dotnet:latest": "//experimental/dotnet",
        "gcr.io/{PROJECT_ID}/dotnet:debug": "//experimental/dotnet:debug",
    },
    stamp = True,
)

load("@io_bazel_rules_docker//contrib:push-all.bzl", "docker_push")

docker_push(
    name = "publish",
    bundle = ":all",
)
