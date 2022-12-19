
load(
    "@rules_pkg//pkg/private:pkg_files.bzl",
    "add_tree_artifact",
    "write_manifest",
)

DPKG_STATUS_DIR = '/var/lib/dpkg/status.d'


EXTRACT_CMD="""\
tmp="$(mktemp -d)"
tar -xf "$1" -C $tmp

mkdir -p "$2"
mv "$tmp/control" "$2/$3"

if [ -f "$tmp/md5sums" ]; then 
    mv "$tmp/md5sums" "$2/$3.md5sums"
fi
"""


def _impl(ctx):
    dpkg_status = ctx.actions.declare_directory("%s/status" % ctx.label.name)
    
    
    args = ctx.actions.args()
    args.add(ctx.file.control.path)
    args.add(dpkg_status.path)
    args.add(ctx.attr.package_name)

    ctx.actions.run_shell(
        inputs = [ctx.file.control],
        outputs = [dpkg_status],
        command = EXTRACT_CMD,
        arguments = [args],
    )


    tar = ctx.actions.declare_file("%s.tar" % ctx.label.name)

    tar_manifest = ctx.actions.declare_file("%s/tar.manifest" % ctx.label.name)
    content_map = {}
    add_tree_artifact(content_map, DPKG_STATUS_DIR, dpkg_status, ctx.label)
    write_manifest(ctx, tar_manifest, content_map)

    args = ctx.actions.args()
    args.add("--output", tar.path)
    args.add("--directory", "/")
    args.add("--manifest", tar_manifest.path)

    ctx.actions.run(
        inputs = [dpkg_status, tar_manifest],
        outputs = [tar],
        executable = ctx.executable._build_tar,
        arguments = [args],
    )

    return DefaultInfo(files = depset([tar]))




dpkg_status = rule(
    implementation = _impl,
    attrs = {
        "control": attr.label(allow_single_file = [".tar", ".tar.xz", "tar.gz"]),
        "package_name": attr.string(mandatory = True),
        "_build_tar": attr.label(
            default = Label("@rules_pkg//pkg/private/tar:build_tar"),
            cfg = "exec",
            executable = True,
            allow_files = True,
        ),
    }
)