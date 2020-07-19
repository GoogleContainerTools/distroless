"""A rule to unpack c locale from the debian package."""

def _impl(ctx):
    ctx.actions.run(
        executable = ctx.executable._extract,
        arguments = [
            ctx.file.deb.path,
            ctx.outputs.tar.path,
        ],
        inputs = [ctx.file.deb],
        outputs = [ctx.outputs.tar],
    )

locale = rule(
    attrs = {
        "deb": attr.label(
            allow_single_file = [".deb"],
            mandatory = True,
        ),
        # Implicit dependencies.
        "_extract": attr.label(
            default = Label("//locale:extract_locale"),
            cfg = "host",
            executable = True,
            allow_files = True,
        ),
    },
    executable = False,
    outputs = {
        "tar": "%{name}.tar",
    },
    implementation = _impl,
)
