load(":cc.bzl", "cc_image", "cc_image_index")
load("//:distro.bzl", "DISTROS", "PREVIEW_DISTROS")
load("//:checksums.bzl", "ARCHITECTURES")

package(default_visibility = ["//visibility:public"])

CC_DISTROS = DISTROS + PREVIEW_DISTROS

CC_ARCHITECTURES = ARCHITECTURES

[
    cc_image(
        arch = arch,
        distro = distro,
    )
    for distro in CC_DISTROS
    for arch in CC_ARCHITECTURES
]

[
    cc_image_index(
        architectures = CC_ARCHITECTURES,
        distro = distro,
    )
    for distro in CC_DISTROS
]
