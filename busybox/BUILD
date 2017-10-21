package(default_visibility = ["//base:__subpackages__"])

load("@runtimes_common//structure_tests:tests.bzl", "structure_test")
load(":commands.bzl", "BUSYBOX_COMMANDS")

# For convenience, rename busybox-x86_64 to busybox.
genrule(
    name = "busybox_tar",
    srcs = ["@busybox//file"],
    outs = ["busybox.tar"],
    cmd = "mkdir busybox; cp $(<) busybox/busybox; cd busybox; \
           for cmd in %s; do \
             ln -s busybox $$cmd; \
           done; \
           cd ..; \
           tar -cf $@ busybox" % " ".join(BUSYBOX_COMMANDS),
)
