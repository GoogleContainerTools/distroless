"an aspect rule that generates spdx by collecting spdx output group"

def _image_aspect_impl(target, ctx):
    output = ctx.actions.declare_file("%s.spdx.json" % target.label.name)

    args = ctx.actions.args()
    args.add(output.path, format = "--output=%s")
    args.add(target.label, format = "--label=%s")

    input_depsets = []

    if ctx.rule.kind == "oci_image":
        if ctx.rule.attr.base != None:
            output_group_info = ctx.rule.attr.base[OutputGroupInfo]
            if output_group_info and "spdx" in output_group_info:
                input_depsets.append(output_group_info.spdx)
                args.add_all(output_group_info.spdx, format_each = "--contains=%s")

        for src in ctx.rule.attr.tars:
            if OutputGroupInfo in src and "spdx" in src[OutputGroupInfo]:
                input_depsets.append(src[OutputGroupInfo].spdx)
                args.add_all(src[OutputGroupInfo].spdx)

    elif ctx.rule.kind == "oci_image_index":
        for image in ctx.rule.attr.images:
            if OutputGroupInfo in image and "spdx" in image[OutputGroupInfo]:
                input_depsets.append(image[OutputGroupInfo].spdx)
                args.add_all(image[OutputGroupInfo].spdx, format_each = "--contains=%s")

    ctx.actions.run(
        inputs = depset(transitive = input_depsets),
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
    attr_aspects = ["base", "images"],
    attrs = {"_generator": attr.label(default = ":oci_image_spdx", executable = True, allow_single_file = True, cfg = "exec")},
)

def _oci_image_spdx_impl(ctx):
    return DefaultInfo(files = ctx.attr.image[OutputGroupInfo].spdx)

oci_image_spdx = rule(
    implementation = _oci_image_spdx_impl,
    attrs = {
        "image": attr.label(aspects = [image_aspect]),
    },
)
