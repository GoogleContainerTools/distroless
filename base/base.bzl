"defines a function to replicate the container images for different distributions"

load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_image_index", "structure_test")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//common:variables.bzl", "variables")
load("//private/util:deb.bzl", "deb")

USER_VARIANTS = [("root", 0, "/"), ("nonroot", variables.NONROOT, "/home/nonroot")]

def base_images(dist):
    """Replicate everything for all distroless suffixes

    Args:
        dist: name of the distribution
    """

    # loop for multi-arch images
    for (user, _, _) in USER_VARIANTS:
        oci_image_index(
            name = "static_" + user + "_" + dist,
            images = [
                "static_" + user + "_" + arch + "_" + dist
                for arch in variables.ARCHS
            ],
        )

        oci_image_index(
            name = "base_nossl_" + user + "_" + dist,
            images = [
                "base_nossl_" + user + "_" + arch + "_" + dist
                for arch in variables.ARCHS
            ],
        )

        oci_image_index(
            name = "base_" + user + "_" + dist,
            images = [
                "base_" + user + "_" + arch + "_" + dist
                for arch in variables.ARCHS
            ],
        )

        oci_image_index(
            name = "debug_" + user + "_" + dist,
            images = [
                "debug_" + user + "_" + arch + "_" + dist
                for arch in variables.ARCHS
            ],
        )

        oci_image_index(
            name = "base_nossl_debug_" + user + "_" + dist,
            images = [
                "base_nossl_debug_" + user + "_" + arch + "_" + dist
                for arch in variables.ARCHS
            ],
        )

        oci_image_index(
            name = "static_debug_" + user + "_" + dist,
            images = [
                "static_debug_" + user + "_" + arch + "_" + dist
                for arch in variables.ARCHS
            ],
        )

    for arch in variables.ARCHS:
        for (user, uid, workdir) in USER_VARIANTS:
            oci_image(
                name = "static_" + user + "_" + arch + "_" + dist,
                env = {
                    "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                    # allows openssl to find the certificates by default
                    # TODO: We should run update-ca-certifaces, but that requires "openssl rehash"
                    # which would probably need to be run inside the container
                    "SSL_CERT_FILE": "/etc/ssl/certs/ca-certificates.crt",
                },
                tars = [
                    deb.package(arch, dist, "base-files"),
                    deb.package(arch, dist, "netbase"),
                    deb.package(arch, dist, "tzdata"),
                    ":passwd",
                    # Create /tmp, too many things assume it exists.
                    # tmp.tar has a /tmp with the correct permissions 01777
                    # A tar is needed because at the moment there is no way to create a
                    # directory with specific permissions.
                    ":tmp.tar",
                    ":nsswitch.tar",
                    "//common:group",
                    "//common:os_release_" + dist,
                    "//common:cacerts_" + dist + "_" + arch,
                ],
                user = "%d" % uid,
                workdir = workdir,
                os = "linux",
                architecture = arch,
                variant = variables.VARIANTS.get(arch),
            )

            oci_image(
                name = "base_nossl_" + user + "_" + arch + "_" + dist,
                architecture = arch,
                base = ":static_" + user + "_" + arch + "_" + dist,
                tars = [
                    deb.package(arch, dist, "libc6"),
                ],
            )

            # base image distribution-specific deb dependencies
            BASE_DISTRO_DEBS = {
                "debian11": [
                    "libssl1.1",
                    "openssl",
                ],
                "debian12": [
                    "libssl3",
                ],
            }

            oci_image(
                name = "base_" + user + "_" + arch + "_" + dist,
                base = ":static_" + user + "_" + arch + "_" + dist,
                tars = [
                    deb.package(arch, dist, "libc6"),
                ] + [
                    deb.package(arch, dist, pkg)
                    for pkg in BASE_DISTRO_DEBS[dist]
                ],
            )

            # A debug image with busybox available.
            oci_image(
                name = "debug_" + user + "_" + arch + "_" + dist,
                base = ":base_" + user + "_" + arch + "_" + dist,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
            )

            # A base_nossl debug image with busybox available.
            oci_image(
                name = "base_nossl_debug_" + user + "_" + arch + "_" + dist,
                base = ":base_nossl_" + user + "_" + arch + "_" + dist,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
            )

            # A static debug image with busybox available.
            oci_image(
                name = "static_debug_" + user + "_" + arch + "_" + dist,
                base = ":static_" + user + "_" + arch + "_" + dist,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
            )

        ##########################################################################################
        # Check that we can overlay a pure Go binary on a static base to check certificates
        ##########################################################################################
        go_binary(
            name = "check_certs_" + arch + "_" + dist,
            srcs = ["testdata/check_certs.go"],
            goarch = arch,
            # Test image is linux based
            goos = "linux",
            pure = "on",
        )

        pkg_tar(
            name = "check_certs_" + arch + "_" + dist + "_tar",
            srcs = ["check_certs_" + arch + "_" + dist],
            symlinks = {
                "/check_certs": "check_certs_" + arch + "_" + dist,
            },
        )

        oci_image(
            name = "check_certs_image_" + arch + "_" + dist,
            base = "//base:static_root_" + arch + "_" + dist,
            tars = [
                ":check_certs_" + arch + "_" + dist + "_tar",
            ],
            visibility = ["//visibility:private"],
        )

        structure_test(
            name = "static_" + arch + "_" + dist + "_test",
            config = ["testdata/static.yaml"],
            image = ":check_certs_image_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check that we can invoke openssl in the base image to check certificates (only debian11).
        ##########################################################################################
        if dist == "debian11":
            structure_test(
                name = "openssl_" + arch + "_" + dist + "_test",
                config = ["testdata/certs.yaml"],
                image = ":base_root_" + arch + "_" + dist,
                tags = ["manual", arch],
            )

        ##########################################################################################
        # Check for common base files.
        ##########################################################################################
        structure_test(
            name = "base_" + arch + "_" + dist + "_test",
            config = ["testdata/base.yaml"],
            image = ":base_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        structure_test(
            name = "base_nossl_" + arch + "_" + dist + "_test",
            config = ["testdata/base.yaml"],
            image = ":base_nossl_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check for busybox
        ##########################################################################################
        structure_test(
            name = "debug_" + arch + "_" + dist + "_test",
            config = ["testdata/debug.yaml"],
            image = ":debug_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        structure_test(
            name = "base_nossl_debug_" + arch + "_" + dist + "_test",
            config = ["testdata/debug.yaml"],
            image = ":base_nossl_debug_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        structure_test(
            name = "static_debug_" + arch + "_" + dist + "_test",
            config = ["testdata/debug.yaml"],
            image = ":static_debug_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check the /etc/os-release contents.
        ##########################################################################################
        structure_test(
            name = "base_release_" + arch + "_" + dist + "_test",
            config = ["testdata/" + dist + ".yaml"],
            image = ":base_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        structure_test(
            name = "base_nossl_release_" + arch + "_" + dist + "_test",
            config = ["testdata/" + dist + ".yaml"],
            image = ":base_nossl_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        structure_test(
            name = "debug_release_" + arch + "_" + dist + "_test",
            config = ["testdata/" + dist + ".yaml"],
            image = ":debug_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        structure_test(
            name = "static_release_" + arch + "_" + dist + "_test",
            config = ["testdata/" + dist + ".yaml"],
            image = ":static_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )

        structure_test(
            name = "static_debug_release_" + arch + "_" + dist + "_test",
            config = ["testdata/" + dist + ".yaml"],
            image = ":static_debug_root_" + arch + "_" + dist,
            tags = ["manual", arch],
        )
