load(":nodejs.bzl", "nodejs_image", "nodejs_image_index")
load(":node_arch.bzl", "node_arch")
load("//:distro.bzl", "DISTROS", "PREVIEW_DISTROS")

package(default_visibility = ["//visibility:public"])

NODEJS_MAJOR_VERSIONS = ("20", "22", "24")

NODEJS_DISTROS = DISTROS + PREVIEW_DISTROS

# NODEJS_ARCHITECTURES = ARCHITECTURES
# using node_arch for now, but we can probably get rid of that

[
    nodejs_image(
        arch = arch,
        distro = distro,
        major_version = major_version,
    )
    for distro in NODEJS_DISTROS
    for major_version in NODEJS_MAJOR_VERSIONS
    for arch in node_arch(major_version)
]

[
    nodejs_image_index(
        architectures = node_arch(major_version),
        distro = distro,
        major_version = major_version,
    )
    for distro in NODEJS_DISTROS
    for major_version in NODEJS_MAJOR_VERSIONS
]
