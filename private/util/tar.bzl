"Wrapper around tar rules for creating tar archives"

load("@aspect_bazel_lib//lib:tar.bzl", _aspect_tar = "tar")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

def tar(
        name,
        srcs = [],
        deps = [],
        extension = "tar.gz",
        package_dir = None,
        strip_prefix = None,
        symlinks = {},
        args = [],
        mtree = [],
        **kwargs):
    """Create a tar archive.

    Uses aspect_bazel_lib tar when mtree is provided for precise control.
    Uses pkg_tar otherwise for compatibility with deps merging.

    Args:
        name: Name of the target
        srcs: Source files to include
        deps: Other tar files to merge
        extension: Output extension (tar.gz, tar, etc.)
        package_dir: Directory prefix for files in the archive
        strip_prefix: Prefix to strip from source file paths
        symlinks: Dict of symlink path -> target
        args: Additional arguments to pass to tar (aspect_bazel_lib only)
        mtree: mtree specification for file metadata (aspect_bazel_lib only)
        **kwargs: Additional arguments passed to underlying rule
    """

    # Use aspect_bazel_lib tar when mtree is provided
    if mtree:
        compress = None
        if extension == "tar.gz":
            compress = "gzip"
        elif extension == "tar.bz2":
            compress = "bzip2"
        elif extension == "tar.xz":
            compress = "xz"
        elif extension == "tar.zst":
            compress = "zstd"

        _aspect_tar(
            name = name,
            srcs = srcs + deps,
            args = args,
            mtree = mtree,
            compress = compress,
            **kwargs
        )
    else:
        # Use pkg_tar for deps merging and legacy compatibility
        pkg_tar(
            name = name,
            srcs = srcs,
            deps = deps,
            extension = extension,
            package_dir = package_dir,
            strip_prefix = strip_prefix,
            symlinks = symlinks,
            **kwargs
        )
