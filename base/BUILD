load(":base.bzl", "base_image", "base_image_index", "base_nossl_image", "base_nossl_image_index")
load(":config.bzl", "BASE_ARCHITECTURES", "BASE_DISTROS", "BASE_NOSSL_PACKAGES", "BASE_PACKAGES")

package(default_visibility = ["//visibility:public"])

# base nossl
[
    base_nossl_image(
        arch = arch,
        distro = distro,
        packages = BASE_NOSSL_PACKAGES[distro],
    )
    for distro in BASE_DISTROS
    for arch in BASE_ARCHITECTURES[distro]
]

[
    base_nossl_image_index(
        architectures = BASE_ARCHITECTURES[distro],
        distro = distro,
    )
    for distro in BASE_DISTROS
]

# base (with libssl)

[
    base_image(
        arch = arch,
        distro = distro,
        packages = BASE_PACKAGES[distro],
    )
    for distro in BASE_DISTROS
    for arch in BASE_ARCHITECTURES[distro]
]

[
    base_image_index(
        architectures = BASE_ARCHITECTURES[distro],
        distro = distro,
    )
    for distro in BASE_DISTROS
]
