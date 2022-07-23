package(default_visibility = ["//experimental/dotnet:__pkg__"])

load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load(":dotnet_publish.bzl", "dotnet_binary")

VERSION_PAIRS = [
    ("6.0", "amd64"),
    ("6.0", "arm64"),
    ("7.0", "amd64"),
    ("7.0", "arm64"),
]


ISA_MAP = {
    "arm64": "arm64",
    "amd64": "x64",
}

[
    filegroup(
        name = "testapp-sources",
        srcs = glob(["TestApp/*"]),
    ),
    filegroup(
        name = "asp-testapp-sources",
        srcs = glob(["AspTestApp/*"]),
    )
]

[
    [
        dotnet_binary(
            name = "testapp-publish_" + version + "_" + arch,
            srcs = [":testapp-sources"],
            flags = [
                "--framework net" + version,
                "--runtime linux-" + ISA_MAP[arch],
                "--disable-build-servers",
                "-c Release",
            ],
        ),
        dotnet_binary(
            name = "asp-testapp-publish_" + version + "_" + arch,
            srcs = [":asp-testapp-sources"],
            flags = [
                "--framework net" + version,
                "--runtime linux-" + ISA_MAP[arch],
                "--disable-build-servers",
                "-c Release",
            ],
        ),
        pkg_tar(
            name = "testapp-bin_" + version + "_" + arch,
            package_dir = "/app",
            deps = [
                ":testapp-publish_" + version + "_" + arch + ".tar",
                ":asp-testapp-publish_" + version + "_" + arch + ".tar",
            ],
            mode = "0755",
        )
    ]
    for (version, arch) in VERSION_PAIRS
]
