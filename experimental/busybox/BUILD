load("//:distro.bzl", BUSYBOX_ARCHITECTURES = "ALL_ARCHITECTURES")
load(":commands.bzl", "busybox_layer")

package(default_visibility = ["//static:__subpackages__"])

[
    busybox_layer(
        name = "busybox_" + arch,
        busybox = "@busybox_" + arch + "//:file",
        compress = "gzip",
    )
    for arch in BUSYBOX_ARCHITECTURES
]
