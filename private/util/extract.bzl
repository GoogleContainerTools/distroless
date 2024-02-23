"a utility that extracts files from tar"

load("@aspect_bazel_lib//lib:tar.bzl", "tar_lib")

def _tar_extract_file_impl(ctx):
    bsdtar = ctx.toolchains[tar_lib.toolchain_type]
    parts = ctx.attr.file.split("/")
    output = ctx.actions.declare_file("/".join([ctx.label.name, parts[-1]]))

    args = ctx.actions.args()
    args.add("--extract")
    args.add("-C", "/".join([ctx.bin_dir.path, ctx.label.package, ctx.label.name]))
    args.add("--file", ctx.file.archive)
    args.add("--include", ctx.attr.file)
    args.add("--strip-components={}".format(len(parts) - 1))

    ctx.actions.run(
        executable = bsdtar.tarinfo.binary,
        inputs = [ctx.file.archive],
        outputs = [output],
        tools = bsdtar.default.files,
        arguments = [args],
    )

    return [
        DefaultInfo(files = depset([output])),
    ]

tar_extract_file = rule(
    implementation = _tar_extract_file_impl,
    attrs = {
        "archive": attr.label(allow_single_file = True, mandatory = True),
        "file": attr.string(mandatory = True),
    },
    toolchains = [tar_lib.toolchain_type],
)
