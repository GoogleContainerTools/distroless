"tar macro using bsdtar with reproducible gzip compression"

load("@tar.bzl//tar:mtree.bzl", "mtree_mutate", "mtree_spec")
load("@tar.bzl//tar:tar.bzl", _tar = "tar")

def tar(
        name,
        srcs = [],
        deps = [],
        extension = "tar.gz",
        package_dir = None,
        strip_prefix = None,
        symlinks = {},
        **kwargs):
    """Create a compressed tarball using bsdtar.

    Uses bsdtar with --options=gzip:!timestamp to produce reproducible
    gzip output without requiring pigz.

    Args:
        name: target name
        srcs: files to include in the tar
        deps: other tar targets to include (must be uncompressed .tar)
        extension: file extension, defaults to tar.gz
        package_dir: directory prefix to add to all paths
        strip_prefix: prefix to remove from all paths
        symlinks: dict of symlink path -> target path
        **kwargs: additional arguments passed to tar rule
    """
    visibility = kwargs.pop("visibility", None)

    compress = None
    if extension in ["tar.gz", "tgz"]:
        compress = "gzip"
    elif extension in ["tar.zst", "tzst"]:
        compress = "zstd"
    elif extension in ["tar.bz2", "tbz2"]:
        compress = "bzip2"
    elif extension in ["tar.xz", "txz"]:
        compress = "xz"

    # Build mtree lines for symlinks
    symlink_mtree = []
    for link_path, target in symlinks.items():
        # Remove leading slash for mtree format
        path = link_path.lstrip("/")
        symlink_mtree.append("{path} uid=0 gid=0 time=0 mode=0755 type=link link={target}".format(
            path = path,
            target = target,
        ))

    # If we have deps (other tars to merge), we need a different approach
    if deps:
        # For deps case, use native.genrule to merge tars
        # First create the content tar from srcs if any
        merge_inputs = list(deps)

        if srcs or symlinks:
            content_tar_name = name + "_content"
            _create_tar_from_srcs(
                name = content_tar_name,
                srcs = srcs,
                package_dir = package_dir,
                strip_prefix = strip_prefix,
                symlink_mtree = symlink_mtree,
                compress = None,  # No compression for intermediate tar
                **kwargs
            )
            merge_inputs.append(":" + content_tar_name)

        # Merge all tars and compress
        native.genrule(
            name = name,
            srcs = merge_inputs,
            outs = [name + "." + extension],
            cmd = """
                # Create a temp dir for extraction
                TMPDIR=$$(mktemp -d)
                trap "rm -rf $$TMPDIR" EXIT

                # Extract all input tars
                for src in $(SRCS); do
                    case "$$src" in
                        *.tar.gz|*.tgz) tar -xzf "$$src" -C "$$TMPDIR" ;;
                        *.tar) tar -xf "$$src" -C "$$TMPDIR" ;;
                        *) tar -xf "$$src" -C "$$TMPDIR" ;;
                    esac
                done

                # Create output tar with compression
                tar -cf - -C "$$TMPDIR" . | gzip -1 -n > $@
            """,
            visibility = visibility,
        )
    else:
        _create_tar_from_srcs(
            name = name,
            srcs = srcs,
            package_dir = package_dir,
            strip_prefix = strip_prefix,
            symlink_mtree = symlink_mtree,
            compress = compress,
            visibility = visibility,
            **kwargs
        )

def _create_tar_from_srcs(
        name,
        srcs,
        package_dir,
        strip_prefix,
        symlink_mtree,
        compress,
        **kwargs):
    """Internal helper to create tar from srcs with optional transformations."""
    mtree_name = name + "_mtree"
    use_mutate = package_dir or strip_prefix

    if srcs:
        mtree_spec(
            name = mtree_name,
            srcs = srcs,
        )

        if use_mutate:
            mutated_name = name + "_mtree_mutated"
            mtree_mutate(
                name = mutated_name,
                mtree = ":" + mtree_name,
                package_dir = package_dir,
                strip_prefix = strip_prefix,
            )
            mtree_name = mutated_name

    # Build final mtree - either from srcs or just symlinks
    if srcs and symlink_mtree:
        # Combine srcs mtree with symlinks
        native.genrule(
            name = name + "_final_mtree",
            srcs = [":" + mtree_name],
            outs = [name + "_final.mtree"],
            cmd = "cat $(SRCS) > $@ && echo '{}' >> $@".format("\\n".join(symlink_mtree)),
        )
        final_mtree = ":" + name + "_final_mtree"
    elif srcs:
        final_mtree = ":" + mtree_name
    elif symlink_mtree:
        # Only symlinks, no srcs
        native.genrule(
            name = name + "_symlink_mtree",
            outs = [name + "_symlinks.mtree"],
            cmd = "echo '#mtree' > $@ && echo '{}' >> $@".format("\\n".join(symlink_mtree)),
        )
        final_mtree = ":" + name + "_symlink_mtree"
    else:
        # Empty tar - create minimal mtree
        native.genrule(
            name = name + "_empty_mtree",
            outs = [name + "_empty.mtree"],
            cmd = "echo '#mtree' > $@",
        )
        final_mtree = ":" + name + "_empty_mtree"

    _tar(
        name = name,
        srcs = srcs,
        mtree = final_mtree,
        compress = compress,
        **kwargs
    )
