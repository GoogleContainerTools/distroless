"""A rule to build os-release information for debian-distroless releases."""

load("@rules_pkg//:providers.bzl", "PackageFilesInfo")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

OS_RELEASE_TMPL="""\
PRETTY_NAME="Distroless"
NAME="Debian GNU/Linux"
ID="debian"
VERSION_ID="{VERSION}"
VERSION="Debian GNU/Linux {VERSION} ({CODENAME})"
HOME_URL="https://github.com/GoogleContainerTools/distroless"
SUPPORT_URL="https://github.com/GoogleContainerTools/distroless/blob/master/README.md"
BUG_REPORT_URL="https://github.com/GoogleContainerTools/distroless/issues/new"
"""

def _impl(ctx):
    os_release = ctx.actions.declare_file("os_release_{}".format(ctx.label.name))
    ctx.actions.write(
        os_release,
        content = OS_RELEASE_TMPL.format(
            VERSION = ctx.attr.version,
            CODENAME = ctx.attr.codename
        )
    )
    return [
        DefaultInfo(files = depset([os_release])),
        PackageFilesInfo(dest_src_map = {"/usr/lib/os-release": os_release})
    ]   


_os_release = rule(
    attrs = {
        "codename": attr.string(mandatory = True),
        "version": attr.string(mandatory = True),
    },
    implementation = _impl,
)

def os_release(name, codename, version, **kwargs):
    _os_release(name = "%s_generated" % name, codename = codename, version = version, **kwargs)
    pkg_tar(name = name, srcs = ["%s_generated" % name], **kwargs)