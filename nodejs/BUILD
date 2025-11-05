load(":nodejs.bzl", "nodejs_image", "nodejs_image_index")
load(":config.bzl", "NODEJS_ARCHITECTURES", "NODEJS_DISTROS", "NODEJS_MAJOR_VERSIONS")

package(default_visibility = ["//visibility:public"])

[
    nodejs_image(
        arch = arch,
        distro = distro,
        major_version = major_version,
    )
    for distro in NODEJS_DISTROS
    for major_version in NODEJS_MAJOR_VERSIONS
    for arch in NODEJS_ARCHITECTURES[distro][major_version]
]

[
    nodejs_image_index(
        architectures = NODEJS_ARCHITECTURES[distro][major_version],
        distro = distro,
        major_version = major_version,
    )
    for distro in NODEJS_DISTROS
    for major_version in NODEJS_MAJOR_VERSIONS
]
