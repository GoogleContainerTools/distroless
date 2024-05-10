load("//:checksums.bzl", "ARCHITECTURES")
load(":commands.bzl", "busybox_layer")

package(default_visibility = ["//base:__subpackages__"])

# This works for all architectures because it is just files.
# Ppc64le/Arm64/Amd64 needs special case as there is no direct working binary file available.
SPECIAL_CASE_ARCH = [
    "ppc64le",
    "arm64",
    "amd64",
]

[
    busybox_layer(
        name = "busybox_" + arch,
        busybox = "@busybox_" + arch + "//:file" if arch in SPECIAL_CASE_ARCH else "@busybox_" + arch + "//file",
        compress = "gzip",
    )
    for arch in ARCHITECTURES
]
