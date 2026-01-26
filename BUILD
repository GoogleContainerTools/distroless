load("//private/oci:defs.bzl", "sign_and_push_all")
load("//private/tools/lifecycle:defs.bzl", "attach_lifecycle_tags")
load("//static:config.bzl", "STATIC_ARCHITECTURES", "STATIC_DISTROS")
load("//base:config.bzl", "BASE_ARCHITECTURES", "BASE_DISTROS")
load("//cc:config.bzl", "CC_ARCHITECTURES", "CC_DISTROS")
load("//nodejs:config.bzl", "NODEJS_ARCHITECTURES", "NODEJS_DISTROS", "NODEJS_MAJOR_VERSIONS")
load("//java:config.bzl", "JAVA_ARCHITECTURES", "JAVA_DISTROS")
load("//python3:config.bzl", "PYTHON_ARCHITECTURES", "PYTHON_DISTROS")

package(default_visibility = ["//visibility:public"])

DEFAULT_DISTRO = "debian12"

VARIANTS = [
    ("latest", "", "root"),
    ("nonroot", "", "nonroot"),
    ("debug", "_debug", "root"),
    ("debug-nonroot", "_debug", "nonroot"),
]

###############
# STATIC      #
###############
STATIC = {
    "{REGISTRY}/{PROJECT_ID}/static:" + tag_base + "-" + arch: "//static:static" + debug_mode + "_" + user + "_" + arch + "_" + DEFAULT_DISTRO
    for arch in STATIC_ARCHITECTURES[DEFAULT_DISTRO]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
STATIC |= {
    "{REGISTRY}/{PROJECT_ID}/static:" + tag_base: "//static:static" + debug_mode + "_" + user + "_" + DEFAULT_DISTRO
    for (tag_base, debug_mode, user) in VARIANTS
}

STATIC |= {
    "{REGISTRY}/{PROJECT_ID}/static-" + distro + ":" + tag_base + "-" + arch: "//static:static" + debug_mode + "_" + user + "_" + arch + "_" + distro
    for (tag_base, debug_mode, user) in VARIANTS
    for distro in STATIC_DISTROS
    for arch in STATIC_ARCHITECTURES[distro]
}

# oci_image_index
STATIC |= {
    "{REGISTRY}/{PROJECT_ID}/static-" + distro + ":" + tag_base: "//static:static" + debug_mode + "_" + user + "_" + distro
    for (tag_base, debug_mode, user) in VARIANTS
    for distro in STATIC_DISTROS
}

###############
# BASE        #
###############
BASE = {
    "{REGISTRY}/{PROJECT_ID}/base:" + tag_base + "-" + arch: "//base:base" + debug_mode + "_" + user + "_" + arch + "_" + DEFAULT_DISTRO
    for arch in BASE_ARCHITECTURES[DEFAULT_DISTRO]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
BASE |= {
    "{REGISTRY}/{PROJECT_ID}/base:" + tag_base: "//base:base" + debug_mode + "_" + user + "_" + DEFAULT_DISTRO
    for (tag_base, debug_mode, user) in VARIANTS
}

BASE |= {
    "{REGISTRY}/{PROJECT_ID}/base-" + distro + ":" + tag_base + "-" + arch: "//base:base" + debug_mode + "_" + user + "_" + arch + "_" + distro
    for distro in BASE_DISTROS
    for arch in BASE_ARCHITECTURES[distro]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
BASE |= {
    "{REGISTRY}/{PROJECT_ID}/base-" + distro + ":" + tag_base: "//base:base" + debug_mode + "_" + user + "_" + distro
    for (tag_base, debug_mode, user) in VARIANTS
    for distro in BASE_DISTROS
}

###############
# BASE_NOSSL  #
###############
BASE_NOSSL = {
    "{REGISTRY}/{PROJECT_ID}/base-nossl:" + tag_base + "-" + arch: "//base:base_nossl" + debug_mode + "_" + user + "_" + arch + "_" + DEFAULT_DISTRO
    for arch in BASE_ARCHITECTURES[DEFAULT_DISTRO]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
BASE_NOSSL |= {
    "{REGISTRY}/{PROJECT_ID}/base-nossl:" + tag_base: "//base:base_nossl" + debug_mode + "_" + user + "_" + DEFAULT_DISTRO
    for (tag_base, debug_mode, user) in VARIANTS
}

BASE_NOSSL |= {
    "{REGISTRY}/{PROJECT_ID}/base-nossl-" + distro + ":" + tag_base + "-" + arch: "//base:base_nossl" + debug_mode + "_" + user + "_" + arch + "_" + distro
    for (tag_base, debug_mode, user) in VARIANTS
    for distro in BASE_DISTROS
    for arch in BASE_ARCHITECTURES[distro]
}

# oci_image_index
BASE_NOSSL |= {
    "{REGISTRY}/{PROJECT_ID}/base-nossl-" + distro + ":" + tag_base: "//base:base_nossl" + debug_mode + "_" + user + "_" + distro
    for (tag_base, debug_mode, user) in VARIANTS
    for distro in BASE_DISTROS
}

###############
# CC          #
###############
CC = {
    "{REGISTRY}/{PROJECT_ID}/cc:" + tag_base + "-" + arch: "//cc:cc" + debug_mode + "_" + user + "_" + arch + "_" + DEFAULT_DISTRO
    for arch in CC_ARCHITECTURES[DEFAULT_DISTRO]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
CC |= {
    "{REGISTRY}/{PROJECT_ID}/cc:" + tag_base: "//cc:cc" + debug_mode + "_" + user + "_" + DEFAULT_DISTRO
    for (tag_base, debug_mode, user) in VARIANTS
}

CC |= {
    "{REGISTRY}/{PROJECT_ID}/cc-" + distro + ":" + tag_base + "-" + arch: "//cc:cc" + debug_mode + "_" + user + "_" + arch + "_" + distro
    for (tag_base, debug_mode, user) in VARIANTS
    for distro in CC_DISTROS
    for arch in CC_ARCHITECTURES[distro]
}

# oci_image_index
CC |= {
    "{REGISTRY}/{PROJECT_ID}/cc-" + distro + ":" + tag_base: "//cc:cc" + debug_mode + "_" + user + "_" + distro
    for (tag_base, debug_mode, user) in VARIANTS
    for distro in CC_DISTROS
}

###############
# PYTHON 3    #
###############
PYTHON3 = {
    "{REGISTRY}/{PROJECT_ID}/python3:" + tag_base + "-" + arch: "//python3:python3" + debug_mode + "_" + user + "_" + arch + "_" + DEFAULT_DISTRO
    for arch in PYTHON_ARCHITECTURES[DEFAULT_DISTRO]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
PYTHON3 |= {
    "{REGISTRY}/{PROJECT_ID}/python3:" + tag_base: "//python3:python3" + debug_mode + "_" + user + "_" + DEFAULT_DISTRO
    for (tag_base, debug_mode, user) in VARIANTS
}

PYTHON3 |= {
    "{REGISTRY}/{PROJECT_ID}/python3-" + distro + ":" + tag_base + "-" + arch: "//python3:python3" + debug_mode + "_" + user + "_" + arch + "_" + distro
    for distro in PYTHON_DISTROS
    for arch in PYTHON_ARCHITECTURES[distro]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
PYTHON3 |= {
    "{REGISTRY}/{PROJECT_ID}/python3-" + distro + ":" + tag_base: "//python3:python3" + debug_mode + "_" + user + "_" + distro
    for distro in PYTHON_DISTROS
    for (tag_base, debug_mode, user) in VARIANTS
}

###############
# NODEJS      #
###############
NODEJS = {
    "{REGISTRY}/{PROJECT_ID}/nodejs" + version + "-" + distro + ":" + tag_base + "-" + arch: "//nodejs:nodejs" + version + debug_mode + "_" + user + "_" + arch + "_" + distro
    for version in NODEJS_MAJOR_VERSIONS
    for distro in NODEJS_DISTROS
    for arch in NODEJS_ARCHITECTURES[distro][version]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
NODEJS |= {
    "{REGISTRY}/{PROJECT_ID}/nodejs" + version + "-" + distro + ":" + tag_base: "//nodejs:nodejs" + version + debug_mode + "_" + user + "_" + distro
    for version in NODEJS_MAJOR_VERSIONS
    for distro in NODEJS_DISTROS
    for (tag_base, debug_mode, user) in VARIANTS
}

NODEJS |= {
    "{REGISTRY}/{PROJECT_ID}/nodejs" + version + ":" + tag_base + "-" + arch: "//nodejs:nodejs" + version + debug_mode + "_" + user + "_" + arch + "_" + DEFAULT_DISTRO
    for version in NODEJS_MAJOR_VERSIONS
    for arch in NODEJS_ARCHITECTURES[DEFAULT_DISTRO][version]
    for (tag_base, debug_mode, user) in VARIANTS
}

# oci_image_index
NODEJS |= {
    "{REGISTRY}/{PROJECT_ID}/nodejs" + version + ":" + tag_base: "//nodejs:nodejs" + version + debug_mode + "_" + user + "_" + DEFAULT_DISTRO
    for version in NODEJS_MAJOR_VERSIONS
    for (tag_base, debug_mode, user) in VARIANTS
}

##############################################################################
# Java will remain a bit bizzare as we clean it up post debian12 deprecation #
# - make all things multi-arch                                               #
# - use the standard variants                                                #
##############################################################################
## JAVA_BASE
JAVA_VARIATIONS = [
    ("latest", "root"),
    ("nonroot", "nonroot"),
    ("debug", "debug_root"),
    ("debug-nonroot", "debug_nonroot"),
]

JAVA_BASE = {
    "{REGISTRY}/{PROJECT_ID}/java-base:latest": "//java:java_base_root_amd64_" + DEFAULT_DISTRO,
    "{REGISTRY}/{PROJECT_ID}/java-base:nonroot": "//java:java_base_nonroot_amd64_" + DEFAULT_DISTRO,
    "{REGISTRY}/{PROJECT_ID}/java-base:debug": "//java:java_base_debug_root_amd64_" + DEFAULT_DISTRO,
    "{REGISTRY}/{PROJECT_ID}/java-base:debug-nonroot": "//java:java_base_debug_nonroot_amd64_" + DEFAULT_DISTRO,
    "{REGISTRY}/{PROJECT_ID}/java-base-debian12:latest": "//java:java_base_root_amd64_debian12",
    "{REGISTRY}/{PROJECT_ID}/java-base-debian12:nonroot": "//java:java_base_nonroot_amd64_debian12",
    "{REGISTRY}/{PROJECT_ID}/java-base-debian12:debug": "//java:java_base_debug_root_amd64_debian12",
    "{REGISTRY}/{PROJECT_ID}/java-base-debian12:debug-nonroot": "//java:java_base_debug_nonroot_amd64_debian12",
}

JAVA_BASE |= {
    "{REGISTRY}/{PROJECT_ID}/java-base-" + distro + ":" + tag_base + "-" + arch: "//java:java_base_" + label + "_" + arch + "_" + distro
    for distro in JAVA_DISTROS
    for arch in JAVA_ARCHITECTURES[distro]
    for (tag_base, label) in JAVA_VARIATIONS
}

JAVA_BASE |= {
    "{REGISTRY}/{PROJECT_ID}/java-base-" + distro + ":" + tag_base: "//java:java_base_" + label + "_" + distro
    for (tag_base, label) in JAVA_VARIATIONS
    for distro in JAVA_DISTROS
}

## JAVA17
JAVA17 = {
    "{REGISTRY}/{PROJECT_ID}/java17:latest": "//java:java17_root_amd64_" + DEFAULT_DISTRO,
    "{REGISTRY}/{PROJECT_ID}/java17:nonroot": "//java:java17_nonroot_amd64_" + DEFAULT_DISTRO,
    "{REGISTRY}/{PROJECT_ID}/java17:debug": "//java:java17_debug_root_amd64_" + DEFAULT_DISTRO,
    "{REGISTRY}/{PROJECT_ID}/java17:debug-nonroot": "//java:java17_debug_nonroot_amd64_" + DEFAULT_DISTRO,
    "{REGISTRY}/{PROJECT_ID}/java17-debian12:latest": "//java:java17_root_amd64_debian12",
    "{REGISTRY}/{PROJECT_ID}/java17-debian12:nonroot": "//java:java17_nonroot_amd64_debian12",
    "{REGISTRY}/{PROJECT_ID}/java17-debian12:debug": "//java:java17_debug_root_amd64_debian12",
    "{REGISTRY}/{PROJECT_ID}/java17-debian12:debug-nonroot": "//java:java17_debug_nonroot_amd64_debian12",
}

JAVA17 |= {
    "{REGISTRY}/{PROJECT_ID}/java17-debian12:" + tag_base + "-" + arch: "//java:java17_" + label + "_" + arch + "_debian12"
    for (tag_base, label) in JAVA_VARIATIONS
    for arch in JAVA_ARCHITECTURES["debian12"]
}

JAVA17 |= {
    "{REGISTRY}/{PROJECT_ID}/java17-debian12:" + tag_base: "//java:java17_" + label + "_debian12"
    for (tag_base, label) in JAVA_VARIATIONS
}

## JAVA 17 on debian13
JAVA17 |= {
    "{REGISTRY}/{PROJECT_ID}/java17-debian13:" + tag_base + "-" + arch: "//java:java17_" + label + "_" + arch + "_debian13"
    for (tag_base, label) in JAVA_VARIATIONS
    for arch in JAVA_ARCHITECTURES["debian13"]
}

## oci_image_index (skipping java17 distro suffix covered above - fix post 17 deprecation)
JAVA17 |= {
    "{REGISTRY}/{PROJECT_ID}/java17-debian13:" + tag_base: "//java:java17_" + label + "_debian13"
    for (tag_base, label) in JAVA_VARIATIONS
}

## JAVA 21
JAVA21 = {
    "{REGISTRY}/{PROJECT_ID}/java21-" + distro + ":" + tag_base + "-" + arch: "//java:java21_" + label + "_" + arch + "_" + distro
    for (tag_base, label) in JAVA_VARIATIONS
    for distro in JAVA_DISTROS
    for arch in JAVA_ARCHITECTURES[distro]
}

# oci_image_index
JAVA21 |= {
    "{REGISTRY}/{PROJECT_ID}/java21:" + tag_base: "//java:java21_" + label + "_" + DEFAULT_DISTRO
    for (tag_base, label) in JAVA_VARIATIONS
}

JAVA21 |= {
    "{REGISTRY}/{PROJECT_ID}/java21-" + distro + ":" + tag_base: "//java:java21_" + label + "_" + distro
    for (tag_base, label) in JAVA_VARIATIONS
    for distro in JAVA_DISTROS
}

## Java 25 from temurin, available on debian13
JAVA25 = {
    "{REGISTRY}/{PROJECT_ID}/java25-debian13:" + tag_base + "-" + arch: "//java:java25_" + label + "_" + arch + "_debian13"
    for (tag_base, label) in JAVA_VARIATIONS
    for arch in JAVA_ARCHITECTURES["debian13"]
}

# oci_image_index
JAVA25 |= {
    "{REGISTRY}/{PROJECT_ID}/java25:" + tag_base: "//java:java25_" + label + "_debian13"
    for (tag_base, label) in JAVA_VARIATIONS
}

JAVA25 |= {
    "{REGISTRY}/{PROJECT_ID}/java25-debian13:" + tag_base: "//java:java25_" + label + "_debian13"
    for (tag_base, label) in JAVA_VARIATIONS
}

ALL = {}

ALL |= STATIC

ALL |= BASE

ALL |= BASE_NOSSL

ALL |= CC

ALL |= PYTHON3

ALL |= NODEJS

ALL |= JAVA_BASE

ALL |= JAVA17

ALL |= JAVA21

ALL |= JAVA25

# create additional tags by appending COMMIT_SHA to all tags
# remove "latest" if they contain it (this is brittle if we make funky changes):
# - image:latest -> image:{COMMIT_SHA}
# - image:latest-xyz -> image:xyz-{COMMIT_SHA}
COMMIT_SUFFIXED_TAGS = {
    (image_ref.replace("latest", "") + "-{COMMIT_SHA}").replace(":-", ":"): build_target
    for (image_ref, build_target) in ALL.items()
}

ALL |= COMMIT_SUFFIXED_TAGS

sign_and_push_all(
    name = "sign_and_push",
    images = ALL,
)

attach_lifecycle_tags(
    name = "attach_lifecycle_tags",
    images = ALL,
)
