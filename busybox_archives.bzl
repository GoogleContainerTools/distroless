load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

# For the debug image
def repositories():
    # To update amd64 busybox binary (#1014)
    # Get the latest commit hash from dist-amd64 branch of docker-library repo. You can also view it
    # at https://github.com/docker-library/official-images/blob/master/library/busybox
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest-1/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_file(
        name = "busybox_amd64",
        executable = True,
        sha256 = "2af6ea3f9a4a3a19bf4924006f0e4797ea8fe8a370b99717dc0649a5a8af820a",
        urls = ["https://github.com/docker-library/busybox/raw/c4c1b1f404daebc67a32c5949d5d5b3af3b14302/latest-1/musl/busybox.tar.xz"],
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
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest-1/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_file(
        name = "busybox_arm64",
        executable = True,
        sha256 = "2441ebc513f4a9d49e3f8e82a71ebc039cc330c611323eb2e11cc960f4ca83c3",
        urls = ["https://github.com/docker-library/busybox/raw/905f4a7acda06df4b1d1884bd25f98f522f5afa8/latest-1/musl/busybox.tar.xz"],
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
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/latest-1/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_file(
        name = "busybox_ppc64le",
        executable = True,
        sha256 = "6b453957c98455b8e7ea3bf55e2f20888317100a597b76b6cab590c4a9412103",
        urls = ["https://github.com/docker-library/busybox/raw/1a8d828e317a782249cb83ca3bae442b48f5f41c/latest-1/musl/busybox.tar.xz"],
    )
