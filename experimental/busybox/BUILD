package(default_visibility = ["//base:__subpackages__"])

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load(":commands.bzl", "BUSYBOX_COMMANDS")

# Generate links according to `busybox --list-full`.
genrule(
    name = "busybox_tar",
    outs = ["busybox.tar"],
    cmd = "mkdir -p bin sbin usr/bin usr/sbin; \
           for cmd in %s; do \
             ln -s /bin/busybox $$cmd; \
           done; \
           tar -cf $@ bin sbin usr" % " ".join(BUSYBOX_COMMANDS),
)
