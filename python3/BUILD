load("//:checksums.bzl", "BASE_ARCHITECTURES")
load(":python.bzl", "python3_image", "python3_image_index")

package(default_visibility = ["//visibility:public"])

PYTHON_DISTROS = ["debian12"]

PYTHON_ARCHITECTURES = BASE_ARCHITECTURES

[
    python3_image(
        arch = arch,
        distro = distro,
    )
    for distro in PYTHON_DISTROS
    for arch in PYTHON_ARCHITECTURES
]

[
    python3_image_index(
        architectures = PYTHON_ARCHITECTURES,
        distro = distro,
    )
    for distro in PYTHON_DISTROS
]
