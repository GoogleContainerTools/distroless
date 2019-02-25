package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@package_bundle//file:packages.bzl", "packages")

[container_image(
    name = "python27" if (not mode) else mode[1:],
    # Based on //cc so that C extensions work properly.
    base = "//cc" + mode,
    debs = [
        packages["dash"],
        packages["libbz2-1.0"],
        packages["libc-bin"],
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
    tars = [
        ":ld_so_cache.tar",
    ],
) for mode in [
    "",
    ":debug",
]]

container_test(
    name = "python27_test",
    configs = ["testdata/python27.yaml"],
    image = ":python27",
)

genrule(
    name = "ld_so_cache_tar",
    srcs = [":ld.so.cache"],
    outs = ["ld_so_cache.tar"],
    cmd = "$(location :make_ld_so_cache_tar.py) $(SRCS) $(OUTS)",
    tools = [":make_ld_so_cache_tar.py"],
)

sh_binary(
    name = "generate_ldconfig_cache",
    srcs = ["generate_ldconfig_cache.py"],
    data = [":python27"],
)

genrule(
    name = "ld_so_cache_new",
    outs = ["ld.so.cache.new"],
    cmd = "$(location :generate_ldconfig_cache) $(OUTS)",
    tools = [":generate_ldconfig_cache"],
)

sh_test(
    name = "check_ld_so_cache",
    srcs = ["check_ld_so_cache.py"],
    args = [
        "$(location :ld.so.cache)",
        "$(location :ld.so.cache.new)",
    ],
    data = [
        ":ld.so.cache",
        ":ld.so.cache.new",
    ],
)
