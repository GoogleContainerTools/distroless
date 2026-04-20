"Bazel aspect to validate merged-usr conventions in tar files."

load("@aspect_bazel_lib//lib:tar.bzl", "tar_lib")

# https://wiki.gentoo.org/wiki/Merge-usr
# https://salsa.debian.org/md/usrmerge/raw/master/debian/README.Debian
# https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
# Mapping taken from https://github.com/floppym/merge-usr/blob/15dd02207bdee7ca6720d7024e8c0ffdc166ed23/merge-usr#L17-L25
# https://salsa.debian.org/md/usrmerge/-/tree/master/debian?ref_type=heads

def _validate_usr_symlink_impl(target, ctx):
    if target.label.name.find("debian12") != -1:
        return []

    if not hasattr(ctx.rule.files, "tars"):
        return []
    bsdtar = ctx.toolchains[tar_lib.toolchain_type]

    output = ctx.actions.declare_file(target.label.name + ".mtree")

    args = ctx.actions.args()
    args.add("--create")
    args.add("--file", output)
    args.add("--format=mtree")
    args.add_all(ctx.rule.files.tars, format_each = "@%s")

    ctx.actions.run(
        executable = bsdtar.tarinfo.binary,
        inputs = ctx.rule.files.tars,
        outputs = [output],
        tools = bsdtar.default.files,
        arguments = [args],
        mnemonic = "PackageListing",
    )

    validation_output = ctx.actions.declare_file(target.label.name + ".validation")
    ctx.actions.run(
        executable = ctx.executable._awk,
        inputs = [output, ctx.file._validate_symlinks],
        outputs = [validation_output],
        arguments = [
            "-v",
            "validation_output_file=" + validation_output.path,
            "-f",
            ctx.file._validate_symlinks.path,
            output.path,
        ],
        mnemonic = "ValidateUsrSymlinks",
    )

    return [
        OutputGroupInfo(_validation = depset([validation_output])),
    ]

validate_usr_symlinks = aspect(
    implementation = _validate_usr_symlink_impl,
    attrs = {
        "_awk": attr.label(default = "@gawk//:gawk", cfg = "exec", executable = True),
        "_validate_symlinks": attr.label(
            default = "//private/util:validate_usr_symlinks.awk",
            allow_single_file = True,
        ),
    },
    attr_aspects = ["tars"],
    toolchains = [tar_lib.toolchain_type],
)
