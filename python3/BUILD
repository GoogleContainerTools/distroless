load("//private/util:tar.bzl", "tar")
load(":config.bzl", "PYTHON_ARCHITECTURES", "PYTHON_DISTROS", "PYTHON_PACKAGES")
load(":ldconfig.bzl", "python3_ldconfig")
load(":python.bzl", "python3_image", "python3_image_index")

package(default_visibility = ["//visibility:public"])

[
    tar(
        name = "ldconfig_cache_{}".format(arch),
        srcs = ["ldconfig/ld.so.cache.{}".format(arch)],
        args = [
            "--format",
            "gnutar",
        ],
        extension = "tar.gz",
        mtree = ["etc/ld.so.cache uid=0 gid=0 uname=root gname=root mode=0644 time=0 type=file content=$(location ldconfig/ld.so.cache.{})".format(arch)],
    )
    for arch in PYTHON_ARCHITECTURES["debian13"]
]

[
    python3_image(
        arch = arch,
        distro = distro,
        packages = PYTHON_PACKAGES[distro],
    )
    for distro in PYTHON_DISTROS
    for arch in PYTHON_ARCHITECTURES[distro]
]

[
    python3_image_index(
        architectures = PYTHON_ARCHITECTURES[distro],
        distro = distro,
    )
    for distro in PYTHON_DISTROS
]

# ldconfig.so.cache generation
python3_ldconfig(
    architectures = PYTHON_ARCHITECTURES["debian13"],
    distro = "debian13",
)
