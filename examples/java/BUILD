package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//java:image.bzl", "java_image")

java_image(
    name = "hello",
    srcs = ["HelloJava.java"],
    base = "//java:java11",
    main_class = "examples.HelloJava",
)

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")

container_test(
    name = "hello_test",
    size = "small",
    configs = ["testdata/hello.yaml"],
    image = ":hello",
)
