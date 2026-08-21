load("@aspect_bazel_lib//lib:tar.bzl", "tar_lib")

SPDX_CMD = """\
readonly bsdtar="$1"
readonly control="$2"
readonly data="$3"
readonly package_name="$4"
readonly generator="$5"
shift 5

tmp="$(mktemp -d)"

"$bsdtar" -xf "$control" -C "$tmp" "./control" 2>/dev/null || "$bsdtar" -xf "$control" -C "$tmp" "control"

COPYRIGHT=""
if "$bsdtar" -xf "$data" -C "$tmp" "usr/share/doc/$package_name/copyright" 2>/dev/null || "$bsdtar" -xf "$data" -C "$tmp" "./usr/share/doc/$package_name/copyright" 2>/dev/null; then
    COPYRIGHT="$tmp/usr/share/doc/$package_name/copyright"
fi

"$generator" --control="$tmp/control" --copyright="$COPYRIGHT" "$@"
"""

def _impl(ctx):
    bsdtar = ctx.toolchains[tar_lib.toolchain_type]
    output = ctx.actions.declare_file("%s.spdx.json" % ctx.label.name)

    args = ctx.actions.args()
    args.add(bsdtar.tarinfo.binary.path)
    args.add(ctx.file.control.path)
    args.add(ctx.file.data.path)
    args.add(ctx.attr.package_name)
    args.add(ctx.executable._generator.path)
    args.add(ctx.attr.spdx_id, format = "--id=%s")
    args.add(output.path, format = "--output=%s")
    args.add(ctx.label, format = "--generates=%s")

    # TODO: multiple urls. it is not required at the moment since .deb are fetched without a fallback mirror.
    args.add(ctx.attr.urls[0], format = "--url=%s")
    args.add(ctx.attr.sha256, format = "--sha256=%s")

    ctx.actions.run_shell(
        inputs = [ctx.file.control, ctx.file.data],
        outputs = [output],
        command = SPDX_CMD,
        tools = [ctx.executable._generator, bsdtar.default.files],
        arguments = [args],
    )

    return OutputGroupInfo(
        spdx = depset([output]),
    )

debian_spdx = rule(
    implementation = _impl,
    attrs = {
        "control": attr.label(mandatory = True, allow_single_file = [".tar", ".tar.xz", "tar.gz", "tar.zst"]),
        "data": attr.label(mandatory = True, allow_single_file = [".tar", ".tar.xz", "tar.gz", "tar.zst"]),
        "package_name": attr.string(mandatory = True),
        "spdx_id": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "_generator": attr.label(default = ":debian_spdx", executable = True, allow_single_file = True, cfg = "exec"),
    },
    toolchains = [tar_lib.toolchain_type],
)
