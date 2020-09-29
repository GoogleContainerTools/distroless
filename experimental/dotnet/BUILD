package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")

DOTNET_VARIANTS = ("", "_core_aspnet", "_core_runtime", "_core_sdk")

# distribution-specific deb dependencies
DISTRO_DEBS = {
    "_debian9": [
        "libcurl3",
        "libssl1.0.2",
        "libicu57",
        "libunistring0",
    ],
    "_debian10": [
        "libcurl4",
        "libssl1.1",
        "libicu63",
        "libunistring2",
    ],
}

[
    container_image(
        name = "dotnet" + dotnet_variant + ("" if (not mode) else mode) + distro_suffix,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_root_amd64" + distro_suffix,
        debs = [
            DISTRO_PACKAGES["amd64"][distro_suffix]["libgssapi-krb5-2"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["liblttng-ust0"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libunwind8"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libuuid1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["zlib1g"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["curl"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libcomerr2"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libidn2-0"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libk5crypto3"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libkrb5-3"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libldap-2.4-2"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libldap-common"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libsasl2-2"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libnghttp2-14"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libpsl5"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["librtmp1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libssh2-1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libkeyutils1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libkrb5support0"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libgnutls30"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libgmp10"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libhogweed4"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libidn11"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libnettle6"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libp11-kit0"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libffi6"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libtasn1-6"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libsasl2-modules-db"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libdb5.3"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libgcrypt20"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libgpg-error0"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libacl1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libattr1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libselinux1"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libpcre3"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["libbz2-1.0"],
            DISTRO_PACKAGES["amd64"][distro_suffix]["liblzma5"],
        ] + [DISTRO_PACKAGES["amd64"][distro_suffix][deb] for deb in DISTRO_DEBS[distro_suffix]],
        entrypoint = [
            #"/opt/dotnet/dotnet",
        ],
        symlinks = {
            "/usr/bin/dotnet": "/opt/dotnet/dotnet",
        },
        tars = ["@dotnet" + dotnet_variant + "//:tar"],
    )
    for mode in [
        "",
        "_debug",
    ]
    for distro_suffix in DISTRO_SUFFIXES
    for dotnet_variant in DOTNET_VARIANTS
]
