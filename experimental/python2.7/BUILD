package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//docker:docker.bzl", "docker_build")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@package_bundle//file:packages.bzl", "packages")

[docker_build(
    name = "python27" if (not mode) else mode[1:],
    # Based on //cc so that C extensions work properly.
    base = "//cc" + mode,
    debs = [
        packages["dash"],
        packages["libbz2-1.0"],
        packages["libexpat1"],
        packages["libdb5.3"],
        packages["libffi6"],
        packages["libncursesw5"],
        packages["libreadline7"],
        packages["libsqlite3-0"],
        packages["libssl1.1"],
        packages["libtinfo5"],
        packages["mime-support"],
        packages["readline-common"],
        packages["zlib1g"],
        packages["python2.7-minimal"],
        packages["libpython2.7-minimal"],
        packages["libpython2.7-stdlib"],
    ],
    entrypoint = [
        "/usr/bin/python2.7",
    ],
    symlinks = {
        "/usr/bin/python": "/usr/bin/python2.7",
    },
) for mode in [
    "",
    ":debug",
]]

container_test(
    name = "python27_test",
    configs = ["testdata/python27.yaml"],
    image = ":python27",
)
