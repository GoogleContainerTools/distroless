"""A rule to unpack ca certificates from the debian package."""

def _impl(ctx):
    args = "%s %s %s %s" % (
	ctx.executable._extract.path,
	ctx.file.deb.path,
	ctx.outputs.tar.path,
	ctx.outputs.deb.path,
    )

    ctx.action(command = args,
            inputs = [ctx.executable._extract, ctx.file.deb],
            outputs = [ctx.outputs.tar, ctx.outputs.deb])

cacerts = rule(
    attrs = {
        "deb": attr.label(
            allow_files = [".deb"],
            single_file = True,
            mandatory = True,
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

