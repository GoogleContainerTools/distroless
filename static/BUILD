load(":static.bzl", "static_image", "static_image_index")
load(":config.bzl", "STATIC_ARCHITECTURES", "STATIC_DISTROS")

package(default_visibility = ["//visibility:public"])

[
    static_image(
        arch = arch,
        distro = distro,
    )
    for distro in STATIC_DISTROS
    for arch in STATIC_ARCHITECTURES[distro]
]

[
    static_image_index(
        architectures = STATIC_ARCHITECTURES[distro],
        distro = distro,
    )
    for distro in STATIC_DISTROS
]
