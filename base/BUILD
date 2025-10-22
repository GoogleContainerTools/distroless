load(":base.bzl", "base_image", "base_image_index", "base_nossl_image", "base_nossl_image_index")
load("//:distro.bzl", "DISTROS", "PREVIEW_DISTROS")
load("//:checksums.bzl", "ARCHITECTURES")

package(default_visibility = ["//visibility:public"])

BASE_DISTROS = DISTROS + PREVIEW_DISTROS

BASE_ARCHITECTURES = ARCHITECTURES

# base nossl
[
    base_nossl_image(
        arch = arch,
        distro = distro,
    )
    for distro in BASE_DISTROS
    for arch in BASE_ARCHITECTURES
]

[
    base_nossl_image_index(
        architectures = BASE_ARCHITECTURES,
        distro = distro,
    )
    for distro in BASE_DISTROS
]

# base (with libssl)

[
    base_image(
        arch = arch,
        distro = distro,
    )
    for distro in BASE_DISTROS
    for arch in BASE_ARCHITECTURES
]

[
    base_image_index(
        architectures = BASE_ARCHITECTURES,
        distro = distro,
    )
    for distro in BASE_DISTROS
]
