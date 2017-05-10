package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")

# Create /tmp, too many things assume it exists.
docker_build(
    name = "with_tmp",
    directory = "/tmp",
    files = [":empty"],
)

docker_build(
    name = "base",
    base = ":with_tmp",
    debs = ["@glibc//file", "@libssl//file", "@openssl//file"],
)
