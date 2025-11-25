load(":config.bzl", "JAVA_ARCHITECTURES", "JAVA_BASE_PACKAGES", "JAVA_BUILD_BASE_PACKAGES", "JAVA_DISTROS")
load(":java.bzl", "java_base_image", "java_base_image_index", "java_build_base_image", "java_image_index", "java_openjdk_image", "java_temurin_image_from_adoptium_debs", "java_temurin_image_from_github_releases")

package(default_visibility = ["//visibility:public"])

# unpublished build-base images (deprecated)
[
    java_build_base_image(
        "debian12",
        arch,
        JAVA_BUILD_BASE_PACKAGES["debian12"],
    )
    for arch in JAVA_ARCHITECTURES["debian12"]
]

# publishable java base images
[
    java_base_image(
        distro,
        arch,
        JAVA_BASE_PACKAGES[distro],
    )
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

# publishable java temurin images from github releases (deprecated)
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
    ("21", "debian13"),
    ("25", "debian13"),
]

[
    java_temurin_image_from_adoptium_debs(distro, java_version, arch)
    for java_version, distro in ADOPTIUM_DEB_PER_DISTRO
    for arch in JAVA_ARCHITECTURES[distro]
]

# publishable java openjdk (from debian) images (deprecated)
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
