load(":java.bzl", "java_base_image", "java_base_image_index", "java_image_index", "java_openjdk_image", "java_temurin_image_from_adoptium_debs", "java_temurin_image_from_github_releases")
load("//:distro.bzl", "DISTROS", "PREVIEW_DISTROS")

package(default_visibility = ["//visibility:public"])

JAVA_DISTROS = DISTROS + PREVIEW_DISTROS

JAVA_ARCHITECTURES = {
    "debian12": [
        "amd64",
        "arm64",
        "s390x",
        "ppc64le",
    ],
    "debian13": [
        "amd64",
        "arm64",
        "s390x",
        "ppc64le",
    ],
}

# publishable java base images
[
    java_base_image(distro, arch)
    for distro in JAVA_DISTROS
    for arch in JAVA_ARCHITECTURES[distro]
]

[
    java_base_image_index(
        distro,
        JAVA_ARCHITECTURES[distro],
    )
    for distro in JAVA_DISTROS
]

# publishable java temurin images from github releases
ADOPTIUM_GH_PER_DISTRO = [
    ("21", "debian12"),
]

[
    java_temurin_image_from_github_releases(distro, java_version, arch)
    for java_version, distro in ADOPTIUM_GH_PER_DISTRO
    for arch in JAVA_ARCHITECTURES[distro]
]

# publishable java temurin images from adoptium deb repository
ADOPTIUM_DEB_PER_DISTRO = [
    ("25", "debian13"),
]

[
    java_temurin_image_from_adoptium_debs(distro, java_version, arch)
    for java_version, distro in ADOPTIUM_DEB_PER_DISTRO
    for arch in JAVA_ARCHITECTURES[distro]
]

# publishable java openjdk (from debian) images
JAVA_OPENJDK_VERSIONS_PER_DISTRO = [
    ("17", "debian12"),
]

[
    java_openjdk_image(distro, java_version, arch)
    for java_version, distro in JAVA_OPENJDK_VERSIONS_PER_DISTRO
    for arch in JAVA_ARCHITECTURES[distro]
]

# all image indexes
[
    java_image_index(
        distro,
        java_version,
        JAVA_ARCHITECTURES[distro],
    )
    for java_version, distro in JAVA_OPENJDK_VERSIONS_PER_DISTRO + ADOPTIUM_GH_PER_DISTRO + ADOPTIUM_DEB_PER_DISTRO
]
