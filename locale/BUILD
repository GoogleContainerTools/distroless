package(default_visibility = ["//:__subpackages__"])

load("@package_bundle//file:packages.bzl", "packages")
load("@package_bundle_debian10//file:packages.bzl", packages_debian10 = "packages")

DISTRO_PACKAGES = {
    "_debian9": packages,
    "_debian10": packages_debian10,
}

DISTRO_SUFFIXES = ("_debian9", "_debian10")

[genrule(
    name = "locale" + distro_suffix,
    srcs = [
        DISTRO_PACKAGES[distro_suffix]["libc-bin"],
    ],
    outs = ["locale" + distro_suffix + ".tar"],
    cmd = """
        $(location //package_manager:dpkg_extract) $(SRCS) ./usr/lib/locale/C.UTF-8
        $(location //package_manager:tar) --output $(OUTS) usr/lib/locale
    """,
    tools = [
        "//package_manager:dpkg_extract",
        "//package_manager:tar",
    ],
) for distro_suffix in DISTRO_SUFFIXES]
