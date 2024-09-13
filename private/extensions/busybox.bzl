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
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_amd64",
        sha256 = "77b216d55c6895ddb04a90f3025b5ce2480140da779fe3dca91303b135a1fefe",
        urls = ["https://github.com/docker-library/busybox/raw/09ee80aedec1d8c604f104e8bec41ed19274620a/latest/musl/busybox.tar.xz"],
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
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_arm64",
        sha256 = "1d0610f348ae3f95897a967fae429b0a0c712b252ca63e1547a89bf13a1a82c7",
        urls = ["https://github.com/docker-library/busybox/raw/e5e22cb0710fe54da4beaa6a72c1bd56b8fc9c54/latest/musl/busybox.tar.xz"],
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
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_ppc64le",
        sha256 = "2d898cab234190697e5df74c537dd86955e9f61725d6c86d97b97c3d58aed9ca",
        urls = ["https://github.com/docker-library/busybox/raw/aa059e43d48801abcb012dfa965a432fa12c385d/latest/musl/busybox.tar.xz"],
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
