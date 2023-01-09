"""A rule to unpack ca certificates from the debian package."""
load("@rules_pkg//:providers.bzl", "PackageFilesInfo")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

CMD="""\
#!/usr/bin/env bash
set -o pipefail -o errexit -o nounset

tmp=$(mktemp -d)
tar -xf "$1" -C "$tmp" ./usr/share/ca-certificates ./usr/share/doc/ca-certificates/copyright

cp "$tmp/usr/share/doc/ca-certificates/copyright" $3

CERTS=$(find $tmp/usr/share/ca-certificates -type f | sort)
for cert in $CERTS; do
    cat $cert >> $2
done
"""

def _impl(ctx):
    ca_certificates = ctx.actions.declare_file("ca_certificates_{}.crt".format(ctx.label.name))
    copyright = ctx.actions.declare_file("ca_certificates_copyright_{}".format(ctx.label.name))
    ctx.actions.run_shell(
        inputs = [ctx.file.deb],
        outputs = [ca_certificates, copyright],
        arguments = [
            ctx.file.deb.path,
            ca_certificates.path,
            copyright.path
        ],
        command = CMD,
    ) 

    files = {
        "/etc/ssl/certs/ca-certificates.crt": ca_certificates,
        "/usr/share/doc/ca-certificates/copyright": copyright
    }

    return [
        DefaultInfo(files = depset([ca_certificates, copyright])),
        PackageFilesInfo(dest_src_map = files)
    ]   

_cacerts = rule(
    attrs = {
        "deb": attr.label(
            allow_single_file = [".tar.xz"],
            mandatory = True,
        )
    },
    executable = False,
    implementation = _impl,
)

def cacerts(name, deb, **kwargs):
    _cacerts(name = "%s_extract" % name, deb = deb, **kwargs)
    pkg_tar(name = name, srcs = ["%s_extract" % name], **kwargs)