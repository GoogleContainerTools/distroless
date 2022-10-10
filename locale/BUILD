package(default_visibility = ["//:__subpackages__"])

load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", "deb_file")
load("//:checksums.bzl", "ARCHITECTURES")
load(":locale.bzl", "locale")

DISTRO_LOCALE_PATH = {
    "debian11": "/usr/lib/locale/C.UTF-8",
    "debian12": "/usr/lib/locale/C.utf8",
}

[
    locale(
        name = "locale_" + arch + "_" + distro,
        deb = deb_file(arch, distro, "libc-bin"),
        path = DISTRO_LOCALE_PATH[distro],
    )
    for arch in ARCHITECTURES
    for distro in DISTROS
]
