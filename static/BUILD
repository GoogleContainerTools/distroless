load("//private/util:tar.bzl", "tar")
load(":config.bzl", "STATIC_ARCHITECTURES", "STATIC_DISTROS", "STATIC_PACKAGES")
load(":static.bzl", "static_image", "static_image_index")

package(default_visibility = ["//visibility:public"])

# Build gzip-compressed tar with GNU format and correct metadata
tar(
    name = "nsswitch",
    srcs = ["nsswitch.conf"],
    args = [
        "--format",
        "gnutar",
    ],
    extension = "tar.gz",
    mtree = ["etc/nsswitch.conf uid=0 gid=0 uname=root gname=root mode=0644 time=1514722362 type=file content=$(location nsswitch.conf)"],
)

[
    static_image(
        arch = arch,
        distro = distro,
        packages = STATIC_PACKAGES[distro],
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
