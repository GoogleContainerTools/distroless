"rules for generating generic package spdx documents"

def _impl(ctx):
    output = ctx.actions.declare_file("%s.spdx.json" % ctx.label.name)

    args = ctx.actions.args()
    args.add(output.path, format = "--output=%s")
    args.add(ctx.attr.package_name, format = "--package_name=%s")
    args.add(ctx.attr.version, format = "--version=%s")
    args.add(ctx.attr.spdx_id, format = "--id=%s")
    args.add(ctx.label, format = "--generates=%s")

    if ctx.attr.urls:
        args.add(ctx.attr.urls[0], format = "--url=%s")
    if ctx.attr.sha256:
        args.add(ctx.attr.sha256, format = "--sha256=%s")
    if ctx.attr.purl:
        args.add(ctx.attr.purl, format = "--purl=%s")
    if ctx.attr.homepage:
        args.add(ctx.attr.homepage, format = "--homepage=%s")
    if ctx.attr.supplier:
        args.add(ctx.attr.supplier, format = "--supplier=%s")
    if ctx.attr.description:
        args.add(ctx.attr.description, format = "--description=%s")

    inputs = []
    if ctx.file.copyright:
        inputs.append(ctx.file.copyright)
        args.add(ctx.file.copyright.path, format = "--copyright=%s")

    ctx.actions.run(
        inputs = inputs,
        outputs = [output],
        executable = ctx.executable._generator,
        arguments = [args],
    )

    return OutputGroupInfo(
        spdx = depset([output]),
    )

package_spdx = rule(
    implementation = _impl,
    attrs = {
        "package_name": attr.string(mandatory = True),
        "version": attr.string(mandatory = True),
        "purl": attr.string(),
        "spdx_id": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "copyright": attr.label(allow_single_file = True),
        "homepage": attr.string(),
        "supplier": attr.string(),
        "description": attr.string(),
        "_generator": attr.label(default = ":package_spdx", executable = True, allow_single_file = True, cfg = "exec"),
    },
)
