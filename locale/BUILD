load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", "deb_file")
load("//:checksums.bzl", "ARCHITECTURES")
load(":locale.bzl", "locale")

package(default_visibility = ["//:__subpackages__"])

[
    locale(
        name = "locale_" + arch + "_" + distro,
        deb_file = deb_file(arch, distro, "libc-bin"),
    )
    for arch in ARCHITECTURES
    for distro in DISTROS
]
