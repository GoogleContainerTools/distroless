"""A rule to unpack ca certificates from the debian package."""

def _impl(ctx):
    ctx.actions.run(
        executable = ctx.executable._extract,
        arguments = [
            ctx.file.deb.path,
            ctx.outputs.tar.path,
            ctx.outputs.deb.path,
        ],
        inputs = [ctx.file.deb],
        outputs = [ctx.outputs.tar, ctx.outputs.deb],
    )

cacerts = rule(
    attrs = {
        "deb": attr.label(
            allow_single_file = [".deb"],
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
