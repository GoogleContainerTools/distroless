package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

java_binary(
    name = "HelloJava",
    srcs = ["HelloJava.java"],
    main_class = "examples.HelloJava",
)

docker_build(
    name = "hello",
    base = "//java:java8",
    cmd = ["/HelloJava_deploy.jar"],
    files = [":HelloJava_deploy.jar"],
)

load("@runtimes_common//structure_tests:tests.bzl", "structure_test")

structure_test(
    name = "hello_test",
    config = "testdata/hello.yaml",
    image = ":hello",
)
