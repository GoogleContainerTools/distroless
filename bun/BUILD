load(":bun.bzl", "bun_image", "bun_image_index")
load(":config.bzl", "BUN_ARCHITECTURES", "BUN_DISTROS")

package(default_visibility = ["//visibility:public"])

[
    bun_image(
        arch = arch,
        distro = distro,
    )
    for distro in BUN_DISTROS
    for arch in BUN_ARCHITECTURES[distro]
]

[
    bun_image_index(
        architectures = BUN_ARCHITECTURES[distro],
        distro = distro,
    )
    for distro in BUN_DISTROS
]
