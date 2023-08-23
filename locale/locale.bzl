"""A rule to unpack minimal locales from the debian package."""

load("@rules_pkg//:providers.bzl", "PackageFilesInfo")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

def _impl(ctx):
    cutf8 = "C.UTF-8" if ctx.attr.distro == "debian11" else "C.utf8"
    locale = ctx.actions.declare_directory("%s/locale" % ctx.label.name)
    copyright = ctx.actions.declare_file("%s/copyright" % ctx.label.name)
    ctx.actions.run_shell(
        inputs = [ctx.file.deb_file],
        outputs = [locale, copyright],
        arguments = [
            ctx.file.deb_file.path,
            cutf8,
            locale.path,
            copyright.path,
        ],
        command = """
        set -o pipefail -o errexit -o nounset
        tmp=$(mktemp -d)
        tar -xf "$1" -C "$tmp" ./usr/lib/locale/$2 ./usr/share/doc/libc-bin/copyright
        cp -r "$tmp/usr/lib/locale/$2/." $3
        mv "$tmp/usr/share/doc/libc-bin/copyright" $4
        """,
    )

    return [
        DefaultInfo(files = depset([locale, copyright])),
        PackageFilesInfo(
            dest_src_map = {
                "/usr/lib/locale/%s" % cutf8: locale,
                "/usr/share/doc/libc-bin/copyright": copyright,
            },
            attributes = {"mode": "0644"},
        ),
    ]

_locale = rule(
    attrs = {
        "deb_file": attr.label(
            allow_single_file = True,
            mandatory = True,
        ),
        "distro": attr.string(),
    },
    executable = False,
    implementation = _impl,
)

def locale(name, **kwargs):
    _locale(name = "%s_locale" % name, **kwargs)
    pkg_tar(
        name = name,
        srcs = ["%s_locale" % name],
    )
