def _dpkg_list_impl(repository_ctx):
    repository_ctx.file("file/BUILD", """
package(default_visibility = ["//visibility:public"])
deb_files = glob(["*.deb"])
exports_files(deb_files + ["packages.bzl"])
""")

    args = [
        # dpkg_parser.par must be built separately beforehand (bazel build ... //package_manager:dpkg_parser.par)
        str(repository_ctx.path(Label("//:WORKSPACE")).dirname) + "/bazel-bin/package_manager/dpkg_parser.par",
        "--package-files",
        ",".join([str(repository_ctx.path(src_path)) for src_path in repository_ctx.attr.sources]),
        "--packages",
        ",".join(repository_ctx.attr.packages),
        "--workspace-name",
        repository_ctx.name,
        "--versionsfile",
        str(repository_ctx.path(Label("//:WORKSPACE")).dirname) + "/" + repository_ctx.attr.name + ".versions",
    ]

    result = repository_ctx.execute(args)
    if result.return_code:
        fail("dpkg_parser command failed: %s (%s)" % (result.stderr, " ".join([str(a) for a in args])))

_dpkg_list = repository_rule(
    _dpkg_list_impl,
    attrs = {
        "sources": attr.label_list(
            allow_files = True,
        ),
        "packages": attr.string_list(),
    },
)

def _dpkg_src_impl(repository_ctx):
    repository_ctx.file("file/BUILD", """
package(default_visibility = ["//visibility:public"])
exports_files(["Packages.json", "os_release.tar"])
""")
    args = [
        # dpkg_parser.par must be built separately beforehand (bazel build ... //package_manager:dpkg_parser.par)
        str(repository_ctx.path(Label("//:WORKSPACE")).dirname) + "/bazel-bin/package_manager/dpkg_parser.par",
        "--download-and-extract-only=True",
        "--mirror-url=" + repository_ctx.attr.url,
        "--arch=" + repository_ctx.attr.arch,
        "--distro=" + repository_ctx.attr.distro,
        "--snapshot=" + repository_ctx.attr.snapshot,
        "--packages-url=" + repository_ctx.attr.packages_url,
        "--package-prefix=" + repository_ctx.attr.package_prefix,
        "--sha256=" + repository_ctx.attr.sha256,
    ]

    result = repository_ctx.execute(args)
    if result.return_code:
        fail("dpkg_parser command failed: %s (%s)" % (result.stderr, " ".join([str(a) for a in args])))

_dpkg_src = repository_rule(
    _dpkg_src_impl,
    attrs = {
        "url": attr.string(),
        "arch": attr.string(),
        "distro": attr.string(),
        "snapshot": attr.string(),
        "packages_url": attr.string(),
        "package_prefix": attr.string(),
        "sha256": attr.string(),
    },
)

def dpkg_list(**kwargs):
    _dpkg_list(**kwargs)

def dpkg_src(**kwargs):
    _dpkg_src(**kwargs)
