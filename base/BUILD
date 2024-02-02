load(":base.bzl", "base_images")
load(":distro.bzl", "DISTROS")

package(default_visibility = ["//visibility:public"])

[
    base_images(distro = distro)
    for distro in DISTROS
]
