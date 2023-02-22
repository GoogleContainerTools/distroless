"a utility rule that merges DefaultInfo and OutputGroupInfo providers"

SKIP = "_hidden_top_level_INTERNAL_"

def _impl(ctx):
    output_group_info = {}
    default_info = {"files": depset(), "runfiles": ctx.runfiles()}

    for src in ctx.attr.srcs:
        if DefaultInfo in src:
            default_info = {
                "files": depset(transitive = [default_info["files"], src[DefaultInfo].files]),
                "runfiles": default_info["runfiles"].merge(src[DefaultInfo].default_runfiles),
            }
        if OutputGroupInfo in src:
            for key in src[OutputGroupInfo]:
                if key == SKIP:
                    continue
                depsets = [src[OutputGroupInfo][key]]
                if key in output_group_info:
                    depsets.append(output_group_info[key])
                output_group_info[key] = depset(transitive = depsets)

    return [
        OutputGroupInfo(**output_group_info),
        DefaultInfo(**default_info),
    ]

merge_providers = rule(
    implementation = _impl,
    attrs = {
        "srcs": attr.label_list(),
    },
)
