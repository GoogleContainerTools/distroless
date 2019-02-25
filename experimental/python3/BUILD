package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@package_bundle//file:packages.bzl", "packages")

[container_image(
    name = "python3" if (not mode) else mode[1:],
    # Based on //cc so that C extensions work properly.
    base = "//cc" + mode,
    debs = [
        packages["dash"],
        packages["zlib1g"],
        packages["libbz2-1.0"],
        packages["libc-bin"],
        packages["libncursesw5"],
        packages["liblzma5"],
        packages["libreadline7"],
        packages["libtinfo5"],
        packages["libsqlite3-0"],
        # Different python packages have different transitive dependencies
        # on the different libssl shared library versions.
        packages["libssl1.0.2"],
        packages["libssl1.1"],
        packages["libexpat1"],
        packages["python3.5-minimal"],
        packages["libpython3.5-minimal"],
        packages["libpython3.5-stdlib"],
    ],
    entrypoint = [
        "/usr/bin/python3.5",
    ],
    symlinks = {
        "/usr/bin/python": "/usr/bin/python3.5",
        "/usr/bin/python3": "/usr/bin/python3.5",
    },
    tars = [
        "//experimental/python2.7:ld_so_cache.tar",
    ],
) for mode in [
    "",
    ":debug",
]]

container_test(
    name = "python3_test",
    size = "medium",
    configs = ["testdata/python3.yaml"],
    image = ":python3",
)
