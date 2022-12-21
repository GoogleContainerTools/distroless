def _image_aspect_impl(target, ctx):

    spdx_depsets = []
    for src in ctx.rule.attr.tars:
        if OutputGroupInfo in src and "spdx" in src[OutputGroupInfo]:
            spdx_depsets.append(src[OutputGroupInfo].spdx)

    spdxes = depset(transitive = spdx_depsets)

    output = ctx.actions.declare_file("%s.spdx.json" % target.label.name)


    args = ctx.actions.args()
    args.add("bundle")
    args.add(output.path, format = "--output=%s")
    args.add(target.label, format = "--label=%s")

    contains_spdx = depset()
    if ctx.rule.attr.base != None:
        if OutputGroupInfo in ctx.rule.attr.base and "spdx" in ctx.rule.attr.base[OutputGroupInfo]:
            contains_spdx = ctx.rule.attr.base[OutputGroupInfo].spdx
            args.add(contains_spdx.to_list()[0], format="--contains=%s")


    args.add_all(spdxes)
    ctx.actions.run(
        inputs = depset(transitive = [spdxes, contains_spdx]),
        outputs = [output],
        executable = ctx.executable._generator,
        arguments = [args],
    )
    return [
        OutputGroupInfo(
            spdx = depset([output]),
        ),
    ]

image_aspect = aspect(
    implementation = _image_aspect_impl,
    attr_aspects = ["base"],
    attrs = {
        "_generator": attr.label(default = ":debian_spdx", executable = True, allow_single_file = True, cfg = "exec"),
    },
)

def _oci_image_spdx_impl(ctx):
    return DefaultInfo(files = ctx.attr.image[OutputGroupInfo].spdx)

oci_image_spdx = rule(
    implementation = _spdx_sbom_impl,
    attrs = {
        "image": attr.label(aspects = [_image_aspect]),
    },
)
