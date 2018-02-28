package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//java:image.bzl", "java_image")

java_image(
    name = "hello",
    srcs = ["HelloJava.java"],
    base = "//java:java8",
    main_class = "examples.HelloJava",
)

load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

structure_test(
    name = "hello_test",
    size = "small",
    config = "testdata/hello.yaml",
    image = ":hello",
)
