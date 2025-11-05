load(":config.bzl", "PYTHON_ARCHITECTURES", "PYTHON_DISTROS")
load(":python.bzl", "python3_image", "python3_image_index")

package(default_visibility = ["//visibility:public"])

[
    python3_image(
        arch = arch,
        distro = distro,
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
