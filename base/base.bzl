"defines a function to replicate the container images for different distributions"

load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_go//go:def.bzl", "go_binary")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//:checksums.bzl", "ARCHITECTURES", "VARIANTS")
load("//common:variables.bzl", "NONROOT")
load("//private/util:deb.bzl", "deb")

USER_VARIANTS = [("root", 0, "/"), ("nonroot", NONROOT, "/home/nonroot")]

def base_images(distro):
    """Replicate everything for all distroless suffixes

    Args:
        distro: name of the distribution
    """

    # loop for multi-arch images
    for (user, _, _) in USER_VARIANTS:
        oci_image_index(
            name = "static_" + user + "_" + distro,
            images = [
                "static_" + user + "_" + arch + "_" + distro
                for arch in ARCHITECTURES
            ],
        )

        oci_image_index(
            name = "base_nossl_" + user + "_" + distro,
            images = [
                "base_nossl_" + user + "_" + arch + "_" + distro
                for arch in ARCHITECTURES
            ],
        )

        oci_image_index(
            name = "base_" + user + "_" + distro,
            images = [
                "base_" + user + "_" + arch + "_" + distro
                for arch in ARCHITECTURES
            ],
        )

        oci_image_index(
            name = "debug_" + user + "_" + distro,
            images = [
                "debug_" + user + "_" + arch + "_" + distro
                for arch in ARCHITECTURES
            ],
        )

        oci_image_index(
            name = "base_nossl_debug_" + user + "_" + distro,
            images = [
                "base_nossl_debug_" + user + "_" + arch + "_" + distro
                for arch in ARCHITECTURES
            ],
        )

        oci_image_index(
            name = "static_debug_" + user + "_" + distro,
            images = [
                "static_debug_" + user + "_" + arch + "_" + distro
                for arch in ARCHITECTURES
            ],
        )

    for arch in ARCHITECTURES:
        for (user, uid, workdir) in USER_VARIANTS:
            oci_image(
                name = "static_" + user + "_" + arch + "_" + distro,
                env = {
                    "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                    # allows openssl to find the certificates by default
                    # TODO: We should run update-ca-certifaces, but that requires "openssl rehash"
                    # which would probably need to be run inside the container
                    "SSL_CERT_FILE": "/etc/ssl/certs/ca-certificates.crt",
                },
                tars = [
                    deb.package(arch, distro, "base-files"),
                    deb.package(arch, distro, "netbase"),
                    deb.package(arch, distro, "tzdata"),
                    "//common:rootfs",
                    "//common:passwd",
                    "//common:home",
                    "//common:group",
                    # Create /tmp, too many things assume it exists.
                    # tmp.tar has a /tmp with the correct permissions 01777
                    "//common:tmp",
                    ":nsswitch.tar",
                    "//common:os_release_" + distro,
                    "//common:cacerts_" + distro + "_" + arch,
                ],
                user = "%d" % uid,
                workdir = workdir,
                os = "linux",
                architecture = arch,
                variant = VARIANTS.get(arch),
            )

            oci_image(
                name = "base_nossl_" + user + "_" + arch + "_" + distro,
                base = ":static_" + user + "_" + arch + "_" + distro,
                tars = [
                    deb.package(arch, distro, "libc6"),
                ],
            )

            oci_image(
                name = "base_" + user + "_" + arch + "_" + distro,
                base = ":static_" + user + "_" + arch + "_" + distro,
                tars = [
                    deb.package(arch, distro, "libc6"),
                    deb.package(arch, distro, "libssl3"),
                ],
            )

            # A debug image with busybox available.
            oci_image(
                name = "debug_" + user + "_" + arch + "_" + distro,
                base = ":base_" + user + "_" + arch + "_" + distro,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch],
            )

            # A base_nossl debug image with busybox available.
            oci_image(
                name = "base_nossl_debug_" + user + "_" + arch + "_" + distro,
                base = ":base_nossl_" + user + "_" + arch + "_" + distro,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch],
            )

            # A static debug image with busybox available.
            oci_image(
                name = "static_debug_" + user + "_" + arch + "_" + distro,
                base = ":static_" + user + "_" + arch + "_" + distro,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch],
            )

        ##########################################################################################
        # Check that we can overlay a pure Go binary on a static base to check certificates
        ##########################################################################################
        go_binary(
            name = "check_certs_" + arch + "_" + distro,
            srcs = ["testdata/check_certs.go"],
            goarch = arch,
            # Test image is linux based
            goos = "linux",
            pure = "on",
        )

        pkg_tar(
            name = "check_certs_" + arch + "_" + distro + "_tar",
            srcs = ["check_certs_" + arch + "_" + distro],
            symlinks = {
                "/check_certs": "check_certs_" + arch + "_" + distro,
            },
        )

        oci_image(
            name = "check_certs_image_" + arch + "_" + distro,
            base = "//base:static_root_" + arch + "_" + distro,
            tars = [
                ":check_certs_" + arch + "_" + distro + "_tar",
            ],
            visibility = ["//visibility:private"],
        )

        container_structure_test(
            name = "static_" + arch + "_" + distro + "_test",
            configs = ["testdata/static.yaml"],
            image = ":check_certs_image_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check for common base files.
        ##########################################################################################
        container_structure_test(
            name = "base_" + arch + "_" + distro + "_test",
            configs = ["testdata/base.yaml"],
            image = ":base_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_structure_test(
            name = "base_nossl_" + arch + "_" + distro + "_test",
            configs = ["testdata/base.yaml"],
            image = ":base_nossl_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check for busybox
        ##########################################################################################
        container_structure_test(
            name = "debug_" + arch + "_" + distro + "_test",
            configs = ["testdata/debug.yaml"],
            image = ":debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_structure_test(
            name = "base_nossl_debug_" + arch + "_" + distro + "_test",
            configs = ["testdata/debug.yaml"],
            image = ":base_nossl_debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_structure_test(
            name = "static_debug_" + arch + "_" + distro + "_test",
            configs = ["testdata/debug.yaml"],
            image = ":static_debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check the /etc/os-release contents.
        ##########################################################################################
        container_structure_test(
            name = "base_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":base_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_structure_test(
            name = "base_nossl_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":base_nossl_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_structure_test(
            name = "debug_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_structure_test(
            name = "static_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":static_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_structure_test(
            name = "static_debug_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":static_debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )
