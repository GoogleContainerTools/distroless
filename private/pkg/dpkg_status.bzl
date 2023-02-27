def _impl(ctx):
    output = ctx.actions.declare_file("%s.tar" % ctx.label.name)

    args = ctx.actions.args()
    args.add(ctx.file.control.path, format = "--control=%s")
    args.add(ctx.attr.package_name, format = "--package-name=%s")
    args.add("--output", output.path)

    ctx.actions.run(
        inputs = [ctx.file.control],
        outputs = [output],
        executable = ctx.executable._generator,
        arguments = [args],
    )

    return DefaultInfo(files = depset([output]))

dpkg_status = rule(
    implementation = _impl,
    attrs = {
        "control": attr.label(allow_single_file = [".tar", ".tar.xz", "tar.gz"]),
        "package_name": attr.string(mandatory = True),
        "_generator": attr.label(default = ":dpkg_status", executable = True, allow_single_file = True, cfg = "exec"),
    },
)
