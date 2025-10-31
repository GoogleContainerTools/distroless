load(":cc.bzl", "cc_image", "cc_image_index")
load(":config.bzl", "CC_ARCHITECTURES", "CC_DISTROS", "CC_PACKAGES")

package(default_visibility = ["//visibility:public"])

[
    cc_image(
        arch = arch,
        distro = distro,
        packages = CC_PACKAGES[distro],
    )
    for distro in CC_DISTROS
    for arch in CC_ARCHITECTURES[distro]
]

[
    cc_image_index(
        architectures = CC_ARCHITECTURES[distro],
        distro = distro,
    )
    for distro in CC_DISTROS
]
