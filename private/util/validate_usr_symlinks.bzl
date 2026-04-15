"Bazel aspect to validate merged-usr conventions in tar files."

load("@aspect_bazel_lib//lib:tar.bzl", "tar_lib")

# https://wiki.gentoo.org/wiki/Merge-usr
# https://salsa.debian.org/md/usrmerge/raw/master/debian/README.Debian
# https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
# Mapping taken from https://github.com/floppym/merge-usr/blob/15dd02207bdee7ca6720d7024e8c0ffdc166ed23/merge-usr#L17-L25
# https://salsa.debian.org/md/usrmerge/-/tree/master/debian?ref_type=heads
_VALIDATE_SYMLINKS = """\
BEGIN {
    # Mapping from root-level path to expected symlink destination.
    # Taken from https://github.com/floppym/merge-usr/blob/15dd02207bdee7ca6720d7024e8c0ffdc166ed23/merge-usr#L17-L25
    # Note: both /bin and /sbin must point to usr/bin on Debian (sbin is merged into bin).
    expected["./bin"]    = "usr/bin"
    expected["./sbin"]   = "usr/bin"
    expected["./lib"]    = "usr/lib"
    expected["./lib32"]  = "usr/lib32"
    expected["./lib64"]  = "usr/lib64"
    expected["./libx32"] = "usr/libx32"
    prefixes = "./bin|./sbin|./lib|./lib32|./lib64|./libx32"
}
{
    path = $1
    if (path in expected) {
        if ($0 !~ /type=link/) {
            VIOLATIONS[path] = path " is not a symlink (must link to " expected[path] ")"
        } else if (match($0, / link=([^ \\t]+)/, dest) && dest[1] != expected[path]) {
            VIOLATIONS[path] = path " symlinks to '" dest[1] "' instead of '" expected[path] "'"
        }
    } else if ($0 ~ ("^(" prefixes ")/")) {
        VIOLATIONS[path] = path " found under a merged-usr symlink path (should not exist)"
    }
}
END {
    for (violation in VIOLATIONS) {
        print "VIOLATION: " VIOLATIONS[violation] " violates usr-merge convention."
        print violation
    }
    if (length(VIOLATIONS) > 0) {
        exit 1
    }
    print "" > validation_output_file
}

"""

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
        inputs = [output],
        outputs = [validation_output],
        arguments = [
            "-v",
            "validation_output_file=" + validation_output.path,
            _VALIDATE_SYMLINKS,
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
    },
    attr_aspects = ["tars"],
    toolchains = [tar_lib.toolchain_type],
)
