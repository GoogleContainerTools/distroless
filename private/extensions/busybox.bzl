"busybox"

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("//experimental/busybox:commands.bzl", "BUSYBOX_ARCHIVE_BUILD")

def _busybox_impl(module_ctx):
    mod = module_ctx.modules[0]

    if len(module_ctx.modules) > 1:
        fail("busybox.archive should be called only once")
    if not mod.is_root:
        fail("busybox.archive should be called from root module only.")

    # To update amd64 busybox binary (#1014)
    # Get the latest commit hash from dist-amd64 branch of docker-library repo. You can also view it
    # at https://github.com/docker-library/official-images/blob/master/library/busybox
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/busybox.tar.gz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_amd64",
        sha256 = "8e7bef4a92afca21c56c9f85e4e63885b320f1da8f8f82a1cf87af359faf57d3",
        urls = ["https://raw.githubusercontent.com/docker-library/busybox/e5b5178110ca0332364a77d5eb4fff87b0e2ba3f/latest/musl/amd64/rootfs.tar.gz"],
        build_file_content = BUSYBOX_ARCHIVE_BUILD,
    )

    http_file(
        name = "busybox_arm",
        executable = True,
        sha256 = "cd04052b8b6885f75f50b2a280bfcbf849d8710c8e61d369c533acf307eda064",
        urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-armv7l"],
    )

    # To update arm64 busybox binary (#657)
    # Get the latest commit hash from dist-arm64v8 branch of docker-library repo. You can also view it
    # at https://github.com/docker-library/official-images/blob/master/library/busybox
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/busybox.tar.gz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_arm64",
        sha256 = "07b73337cea2a5d87c21278f251e1e742e253232ebd035d6a4a6d2cb4612e462",
        urls = ["https://raw.githubusercontent.com/docker-library/busybox/f30de561de9bf38da10058620e9c4c383ec8a905/latest/musl/arm64v8/rootfs.tar.gz"],
        build_file_content = BUSYBOX_ARCHIVE_BUILD,
    )

    http_file(
        name = "busybox_s390x",
        executable = True,
        sha256 = "48d13ac057046b95ba58921958be639cc3a179ac888cdd65aacd7a69139aa857",
        urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-s390x"],
    )

    # To update ppc64le busybox binary (#723)
    # Get the latest commit hash from dist-ppc64le branch of docker-library repo. You can also view it
    # at https://github.com/docker-library/official-images/blob/master/library/busybox
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/busybox.tar.gz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_ppc64le",
        sha256 = "f3f5d636887b8d56aabe29047a58ef074511f5252c722b1e476b7f79fd35fb7f",
        urls = ["https://raw.githubusercontent.com/docker-library/busybox/149c39d6036d77a55679c6b9e0c946ba2ad38555/latest/musl/ppc64le/rootfs.tar.gz"],
        build_file_content = BUSYBOX_ARCHIVE_BUILD,
    )

    return module_ctx.extension_metadata(
        root_module_direct_deps = [
            "busybox_amd64",
            "busybox_arm",
            "busybox_arm64",
            "busybox_s390x",
            "busybox_ppc64le",
        ],
        root_module_direct_dev_deps = [],
    )

_archive = tag_class(attrs = {})

busybox = module_extension(
    implementation = _busybox_impl,
    tag_classes = {
        "archive": _archive,
    },
)
