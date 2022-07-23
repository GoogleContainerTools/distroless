package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", deb_file = "deb_file", NONROOT = "NONROOT")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//:dotnet.debian_versions.bzl", DEBIAN_VERSIONS = "DEBIAN_PACKAGE_VERSIONS")

# Microsoft supports .NET 6 on Bullseye only
DISTROS = ["debian11"]

VARIANTS = [
    "slim",
    "full",
]

EXTRA_DEBS = {
    "slim": [],
    "full": [
        "libicu67",
        "libcom-err2",
        "libgssapi-krb5-2",
        "libk5crypto3",
        "libkeyutils1",
        "libkrb5-3",
        "libkrb5support0",
    ],
}

USERS = [
    "root",
    "nonroot",
]


VERSION_PAIRS = [
    ("6.0", "amd64", "debian11"),
    ("6.0", "arm64", "debian11"),
    ("7.0", "amd64", "debian11"),
    ("7.0", "arm64", "debian11"),
]

[
    container_image(
        name = "dotnet-" + version + "_runtime-deps_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_" + user + "_" + arch + "_" + distro,
        debs = [
            deb_file(arch, distro, "zlib1g"),
        ] + [deb_file(arch, distro, deb) for deb in EXTRA_DEBS[variant]],
        env = {
            "ASPNETCORE_URLS": "http://+:8080",
            "DOTNET_EnableDiagnostics": "0",
            "DOTNET_gcServer": "0",
            "DOTNET_RUNNING_IN_CONTAINER": "true",
            "DOTNET_SYSTEM_GLOBALIZATION_INVARIANT": ("0" if (not ("slim" in variant)) else "1"),
            "DOTNET_NOLOGO": "1",
            "LOGGING__CONSOLE__FORMATTERNAME": "json",
        },
        tags = [
            arch,
            "image",
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for (version, arch, distro) in VERSION_PAIRS
    for variant in VARIANTS
]

[
    container_test(
        name = "dotnet-fstests-modeonly-" + version + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/dotnet-filesystem" + mode + ".yaml"],
        image = ":dotnet-" + version + "_runtime-deps_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        driver = "tar",
        timeout = "short",
        size = "small",
        tags = [],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for (version, arch, distro) in VERSION_PAIRS
    for variant in VARIANTS
]

[
    container_test(
        name = "dotnet-fstests-useronly" + version + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/dotnet-filesystem-" + user + ".yaml"],
        image = ":dotnet-" + version + "_runtime-deps_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        driver = "tar",
        timeout = "short",
        size = "small",
        tags = [],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for (version, arch, distro) in VERSION_PAIRS
    for variant in VARIANTS
]

[
    container_test(
        name = "dotnet-fstests-variant-arch" + version + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/dotnet-filesystem-" + variant + "-" + arch + ".yaml"],
        image = ":dotnet-" + version + "_runtime-deps_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        driver = "tar",
        timeout = "short",
        size = "small",
        tags = [],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for (version, arch, distro) in VERSION_PAIRS
    for variant in VARIANTS
]

[
    container_image(
        name = "dotnet-testapp" + version + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ":dotnet-" + version + "_runtime-deps_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
#        tars = [
#            ":testapp-bin_" + version + "_" + arch,
#        ],
        tars = ["//experimental/dotnet/test-binaries" + ":testapp-bin_" + version + "_" + arch + ".tar"],
        tags = [
            arch,
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for (version, arch, distro) in VERSION_PAIRS
    for variant in VARIANTS
]

[
    container_test(
        name = "dotnet-testapp" + version + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/dotnet-" + variant + "-testapp.yaml"],
        image = ":dotnet-testapp" + version + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        timeout = "moderate",
        size = "large",
        tags = [
            arch,
            "manual",
        ],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for (version, arch, distro) in VERSION_PAIRS
    for variant in VARIANTS
]
