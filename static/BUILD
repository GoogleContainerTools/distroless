load(":static.bzl", "static_image", "static_image_index")
load("//:distro.bzl", "DISTROS", "PREVIEW_DISTROS")
load("//:checksums.bzl", "ARCHITECTURES")

package(default_visibility = ["//visibility:public"])

STATIC_DISTROS = DISTROS + PREVIEW_DISTROS

STATIC_ARCHITECTURES = ARCHITECTURES

[
    static_image(
        arch = arch,
        distro = distro,
    )
    for distro in STATIC_DISTROS
    for arch in STATIC_ARCHITECTURES
]

[
    static_image_index(
        architectures = STATIC_ARCHITECTURES,
        distro = distro,
    )
    for distro in STATIC_DISTROS
]
