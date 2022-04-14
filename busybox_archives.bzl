load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

# For the debug image
def repositories():
    # To update amd64 busybox binary (#1014)
    # Get the latest commit hash from dist-amd64 branch of docker-library repo.
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/stable/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_file(
        name = "busybox_amd64",
        executable = True,
        sha256 = "169548e8934284b7292bc359ba542c0cfad0b14069881294a6e6939555afbfc0",
        urls = ["https://github.com/docker-library/busybox/raw/8822d69939aa6c41b50c66d0a4c5a5f8729f2178/stable/musl/busybox.tar.xz"],
    )

    http_file(
        name = "busybox_arm",
        executable = True,
        sha256 = "cd04052b8b6885f75f50b2a280bfcbf849d8710c8e61d369c533acf307eda064",
        urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-armv7l"],
    )

    # To update arm64 busybox binary (#657)
    # Get the latest commit hash from dist-arm64v8 branch of docker-library repo.
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/stable/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_file(
        name = "busybox_arm64",
        executable = True,
        sha256 = "02033a50ef38a32a72b4b28183654116c42dae61ec9dccb349f9f63c6ae30f53",
        urls = ["https://github.com/docker-library/busybox/raw/22bb23a2665eefb1520dc4c99d5ac9bdf87ae93b/stable/musl/busybox.tar.xz"],
    )

    http_file(
        name = "busybox_s390x",
        executable = True,
        sha256 = "48d13ac057046b95ba58921958be639cc3a179ac888cdd65aacd7a69139aa857",
        urls = ["https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-s390x"],
    )

    # To update ppc64le busybox binary (#723)
    # Get the latest commit hash from dist-ppc64le branch of docker-library repo.
    # Substitute it in the link: https://github.com/docker-library/busybox/raw/<latest-commit-hash>/stable/musl/busybox.tar.xz
    # Update the sha256 value. Since github api doesn't give sha256 value, it can be obtained using sha256sum command.
    http_file(
        name = "busybox_ppc64le",
        executable = True,
        sha256 = "469297ea9293df0dcb6c3f8d344eaf9f9b6ec1732696ffe86994f87c3600423b",
        urls = ["https://github.com/docker-library/busybox/raw/c0125333c4c3dfa4b9e5fd9fe6fbb875242f3613/stable/musl/busybox.tar.xz"],
    )
