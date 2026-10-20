"a utility that removes files from a tar"

load("@aspect_bazel_lib//lib:tar.bzl", "tar_lib")

def _tar_exclude_files_impl(ctx):
    bsdtar = ctx.toolchains[tar_lib.toolchain_type]
    output = ctx.actions.declare_file(ctx.label.name + ".tar")

    args = ctx.actions.args()
    args.add(bsdtar.tarinfo.binary)
    args.add(ctx.file.archive)
    args.add(output)
    args.add_all(ctx.attr.files)

    # Fail if an excluded path is missing, so an upstream rename can't silently let a file back in.
    ctx.actions.run_shell(
        inputs = [ctx.file.archive],
        outputs = [output],
        tools = bsdtar.default.files,
        arguments = [args],
        command = """
set -o errexit -o nounset -o pipefail
bsdtar="$1"; archive="$2"; output="$3"; shift 3
listing="$("$bsdtar" --list --file "$archive")"
excludes=()
for f in "$@"; do
    if ! grep -qxF "$f" <<< "$listing"; then
        echo "tar_exclude_files: $f not found in $archive" >&2
        exit 1
    fi
    excludes+=(--exclude "$f")
done
"$bsdtar" --create --format gnutar --file "$output" "${excludes[@]}" "@$archive"
""",
        mnemonic = "TarExcludeFiles",
    )

    return [
        DefaultInfo(files = depset([output])),
    ]

tar_exclude_files = rule(
    implementation = _tar_exclude_files_impl,
    attrs = {
        "archive": attr.label(allow_single_file = True, mandatory = True),
        "files": attr.string_list(
            mandatory = True,
            doc = "exact paths to drop, as they appear in the archive listing (e.g. ./usr/share/ca-certificates/mozilla/X.crt)",
        ),
    },
    toolchains = [tar_lib.toolchain_type],
)
