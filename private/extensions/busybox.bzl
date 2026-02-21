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

    # To update arm busybox binary
    # Get the latest commit hash from dist-arm32v7 branch of docker-library repo. You can also view it
    # at https://github.com/docker-library/official-images/blob/master/library/busybox
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/arm32v7/rootfs.tar.gz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_arm",
        sha256 = "3c873527f998bba56151b7c7d19c133390a44ef894242e7ad5536de1ac0c347e",
        urls = ["https://raw.githubusercontent.com/docker-library/busybox/a4fac83861d137e9dcfce70b31d0b8fafea9346e/latest/musl/arm32v7/rootfs.tar.gz"],
        build_file_content = BUSYBOX_ARCHIVE_BUILD,
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

    # To update s390x busybox binary
    # Get the latest commit hash from dist-s390x branch of docker-library repo. You can also view it
    # at https://github.com/docker-library/official-images/blob/master/library/busybox
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/s390x/rootfs.tar.gz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_s390x",
        sha256 = "3bd977f75e22a5e164e2e6ac3556cee55053022e9ad8bba89614e7a8680791d1",
        urls = ["https://raw.githubusercontent.com/docker-library/busybox/87c948a4fac6f84195e795486a8d650b0c9cc10d/latest/musl/s390x/rootfs.tar.gz"],
        build_file_content = BUSYBOX_ARCHIVE_BUILD,
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

    # To update riscv64 busybox binary
    # Get the latest commit hash from dist-riscv64 branch of docker-library repo. You can also view it
    # at https://github.com/docker-library/official-images/blob/master/library/busybox
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest/musl/busybox.tar.gz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_archive(
        name = "busybox_riscv64",
        sha256 = "17737180c892fb9eac75524ae789040f0b01415e6e05e063bc2b8f982b340d97",
        urls = ["https://raw.githubusercontent.com/docker-library/busybox/eabe7cf678f2abbc0477a8603428519771ede877/latest/musl/riscv64/rootfs.tar.gz"],
        build_file_content = BUSYBOX_ARCHIVE_BUILD,
    )

    return module_ctx.extension_metadata(
        root_module_direct_deps = [
            "busybox_amd64",
            "busybox_arm",
            "busybox_arm64",
            "busybox_s390x",
            "busybox_ppc64le",
            "busybox_riscv64",
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
