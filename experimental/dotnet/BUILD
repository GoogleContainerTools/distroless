package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", "deb_file")
load("//base:base.bzl", "NONROOT")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//:debian_versions.bzl", DEBIAN_VERSIONS = "DEBIAN_PACKAGE_VERSIONS")

# Microsoft publishes .NET 6 for Bullseye only
DISTROS = ["debian11"]

VARIANTS = [
    "slim",
#    "kerberos",
#    "i18n",
    "full",
]

EXTRA_DEBS = {
    "slim": [],
#    "kerberos": [
#        "libcom-err2",
#        "libgssapi-krb5-2",
#        "libk5crypto3",
#        "libkeyutils1",
#        "libkrb5-3",
#        "libkrb5support0",
#    ],
#    "i18n": [
#        "libicu67",
#    ],
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
    ("6-0", "amd64", "debian11"),
    #("6-0", "arm64", "debian11"),
]

DOTNET_TYPES = [
    "sdk",
    "runtime",
    "aspnetcore",
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
            "Logging__Console__FormatterName": "Json",
        },
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
    container_image(
        name = "dotnet-" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ":dotnet-" + version + "_runtime-deps_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        symlinks = {"/usr/bin/dotnet": "/usr/share/dotnet/dotnet"},
        tars = ["@dotnet_" + version + "_" + type + "_" + arch + "//:tar"],
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for (version, arch, distro) in VERSION_PAIRS
    for variant in VARIANTS
    for type in DOTNET_TYPES
]

[
    container_test(
        name = "dotnet-" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/dotnet" + version + "_" + type +  mode + ".yaml"],
        image = ":dotnet-" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            type,
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
    for type in DOTNET_TYPES
]

[
    filegroup(
        name = "testapp-sources",
        srcs = glob(["testdata/TestApp/*"]),
    ),
    filegroup(
        name = "asp-testapp-sources",
        srcs = glob(["testdata/AspTestApp/*"]),
    ),
    # These should be two genrules and to pks_tar rules.
    # Using two genrules suffers from some weird file permissions when building AspTestApp :/
    genrule(
        name = "testapp-publish",
        cmd = "dotnet publish --framework net6.0 -c Release -o $(@D)/app ./experimental/dotnet/testdata/TestApp"
              + " && dotnet publish --framework net6.0 -c Release -o $(@D)/asp-app ./experimental/dotnet/testdata/AspTestApp",
        srcs = [":testapp-sources", "asp-testapp-sources"],
        outs = [
          "app/TestApp.deps.json",
          "app/TestApp.dll",
          "app/TestApp.pdb",
          "app/TestApp.runtimeconfig.json",
          "asp-app/appsettings.json",
          "asp-app/AspTestApp.deps.json",
          "asp-app/AspTestApp.dll",
          "asp-app/AspTestApp.pdb",
          "asp-app/AspTestApp.runtimeconfig.json"
        ],
    ),
    pkg_tar(
        name = "testapp-bin",
        package_dir = "/app",
        srcs = [":testapp-publish"],
        mode = "0755",
    ),
]

[
    # Need to set file permissions, so test command can write to /src/ when running as non-root
    pkg_tar(
        name = "testapp-sources-tar_" + user,
        package_dir = "/src",
        owner = str(uid) + "." + str(uid),
        srcs = [":testapp-sources"],
        mode = "0755",
    )
    for (user, uid) in [("root", 0), ("nonroot", NONROOT)]
]

[
    container_image(
        name = "dotnet-testapp" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ":dotnet-" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        tars = [":testapp-bin", ":testapp-sources-tar_" + user]
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for (version, arch, distro) in VERSION_PAIRS
    for variant in VARIANTS
    for type in DOTNET_TYPES
]


[
    container_test(
        name = "dotnet-testapp" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/dotnet-testapp" + version + ".yaml"],
        image = ":dotnet-testapp" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            type,
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
    for type in DOTNET_TYPES
]

[
    container_test(
        name = "dotnet-i18n-testapp" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/dotnet-" + variant + "-testapp" + version + ".yaml"],
        image = ":dotnet-testapp" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            type,
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
    for type in DOTNET_TYPES
]

[
    container_test(
        name = "dotnet-build-testapp" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro + "_test",
        configs = ["testdata/dotnet-testapp" + version + "_" + type + ".yaml"],
        image = ":dotnet-testapp" + version + "_" + type + "_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        tags = [
            arch,
            type,
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
    for type in DOTNET_TYPES
]
