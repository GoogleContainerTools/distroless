package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTROS")
load("//base:base.bzl", "deb_file")
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
# load("@io_bazel_rules_dotnet//dotnet:defs.bzl", "csharp_binary")
load("//:debian_versions.bzl", DEBIAN_VERSIONS = "DEBIAN_PACKAGE_VERSIONS")

# Microsoft publishes .NET 6 for Bullseye only
DISTROS = [ "debian11" ]

VARIANTS = [
    "slim",
    "kerberos",
    "i18n",
    "full"
]


EXTRA_DEBS = {
    "slim": [],
    "kerberos": [
      "libcom-err2",
      "libgssapi-krb5-2",
      "libk5crypto3",
      "libkeyutils1",
      "libkrb5-3",
      "libkrb5support0",
    ],
    "i18n": [
      "libicu67",
    ],
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
    ("6", "amd64", "debian11"),
    ("6", "arm64", "debian11"),
]

[
    container_image(
        name = "dotnet_runtime_deps_" + variant + mode + "_" + user + "_" + arch + "_" + distro,
        architecture = arch,
        base = ("//cc:cc" if (not ("debug" in mode)) else "//cc:debug") + "_" + user + "_" + arch + "_" + distro,
        debs = [
            deb_file(arch, distro, "zlib1g"),
        ] + [deb_file(arch, distro, deb) for deb in EXTRA_DEBS[variant]],
        symlinks = { "/usr/bin/dotnet": "/usr/share/dotnet/dotnet" },
        env = {
          "ASPNETCORE_URLS": "http://+:8080",
          "DOTNET_EnableDiagnostics": "0",
          "DOTNET_gcServer": "0",
          "DOTNET_RUNNING_IN_CONTAINER": "true",
          "Logging__Console__FormatterName": "Json",
         }
    )
    for mode in [
        "",
        "_debug",
    ]
    for user in USERS
    for distro in [ "debian11" ]
    for arch in ARCHITECTURES
    for variant in VARIANTS
]
