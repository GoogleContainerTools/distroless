"tar macro with compression matching crane/go-containerregistry"

load("@rules_pkg//:pkg.bzl", _pkg_tar = "pkg_tar")

def pkg_tar(name, extension = "tar.gz", **kwargs):
    """pkg_tar wrapper with compression matching crane's gzip.BestSpeed.

    Uses pigz with level 1 and no filename/timestamp to match the compression
    settings used by crane (google/go-containerregistry).

    Args:
        name: target name
        extension: file extension, defaults to tar.gz
        **kwargs: additional arguments passed to pkg_tar
    """
    if extension in ["tar.gz", "tgz"]:
        _pkg_tar(
            name = name,
            extension = extension,
            compressor = "@@pigz~//:pigz",
            compressor_args = "-1 -n -T",
            **kwargs
        )
    else:
        _pkg_tar(
            name = name,
            extension = extension,
            **kwargs
        )
