"""A rule to unpack ca certificates from the debian package."""

def _impl(ctx):
    file_args = ' '.join([str(f.path) for f in ctx.files.certs[:]])
    args = "%s %s %s %s \"%s\"" % (
        ctx.executable._extract.path,
        ctx.file.deb.path,
        ctx.outputs.tar.path,
        ctx.outputs.deb.path,
        file_args,
    )

    ctx.action(command = args,
            inputs = [ctx.executable._extract, ctx.file.deb] + ctx.files.certs,
            outputs = [ctx.outputs.tar, ctx.outputs.deb])

cacerts = rule(
    attrs = {
        "deb": attr.label(
            allow_files = [".deb"],
            single_file = True,
            mandatory = True,
        ),
        "certs": attr.label_list(
            allow_files = [".crt"],
        ),
        # Implicit dependencies.
        "_extract": attr.label(
            default = Label("//cacerts:extract_certs"),
            cfg = "host",
            executable = True,
            allow_files = True,
        ),
    },
    executable = False,
    outputs = {
        "tar": "%{name}.tar",
        "deb": "%{name}.deb",
    },
    implementation = _impl,
)

