# defines a function to replicate the container images for different distributions
load("//cacerts:cacerts.bzl", "cacerts")
load("//:checksums.bzl", "ARCHITECTURES", "VARIANTS")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")
load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_image_index", "structure_test")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

NONROOT = 65532

def deb_file(arch, distro, package):
    return "@{arch}_{distro}_{package}//:data".format(arch = arch, distro = distro, package = package)

def deb_pkg(arch, distro, package):
    return "@{arch}_{distro}_{package}".format(arch = arch, distro = distro, package = package)

# Replicate everything for all distroless suffixes
def distro_components(distro):
    USER_VARIANTS = [("root", 0, "/"), ("nonroot", NONROOT, "/home/nonroot")]

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
        cacerts(
            name = "cacerts_" + arch + "_" + distro,
            deb = deb_file(arch, distro, "ca-certificates"),
        )

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
                    deb_pkg(arch, distro, "base-files"),
                    deb_pkg(arch, distro, "netbase"),
                    deb_pkg(arch, distro, "tzdata"),
                    ":passwd",
                    ":group_tar",

                    # Create /tmp, too many things assume it exists.
                    # tmp.tar has a /tmp with the correct permissions 01777
                    # A tar is needed because at the moment there is no way to create a
                    # directory with specific permissions.
                    ":tmp.tar",
                    ":nsswitch.tar",
                    "//os_release:os_release_" + distro + ".tar",
                    ":cacerts_" + arch + "_" + distro + ".tar",
                ],
                user = "%d" % uid,
                workdir = workdir,
                os = "linux",
                architecture = arch,
                variant = VARIANTS.get(arch),
            )

            oci_image(
                name = "base_nossl_" + user + "_" + arch + "_" + distro,
                architecture = arch,
                base = ":static_" + user + "_" + arch + "_" + distro,
                tars = [
                    deb_pkg(arch, distro, "libc6"),
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
                    "libstdc++6"
                ],
            }

            oci_image(
                name = "base_" + user + "_" + arch + "_" + distro,
                base = ":static_" + user + "_" + arch + "_" + distro,
                tars = [
                    deb_pkg(arch, distro, "libc6"),
                ] + [
                    deb_pkg(arch, distro, deb)
                    for deb in BASE_DISTRO_DEBS[distro]
                ],
            )

            # A debug image with busybox available.
            oci_image(
                name = "debug_" + user + "_" + arch + "_" + distro,
                base = ":base_" + user + "_" + arch + "_" + distro,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
            )

            # A base_nossl debug image with busybox available.
            oci_image(
                name = "base_nossl_debug_" + user + "_" + arch + "_" + distro,
                base = ":base_nossl_" + user + "_" + arch + "_" + distro,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
            )

            # A static debug image with busybox available.
            oci_image(
                name = "static_debug_" + user + "_" + arch + "_" + distro,
                base = ":static_" + user + "_" + arch + "_" + distro,
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
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

        structure_test(
            name = "static_" + arch + "_" + distro + "_test",
            config = ["testdata/static.yaml"],
            image = ":check_certs_image_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check that we can invoke openssl in the base image to check certificates (only debian11).
        ##########################################################################################
        if distro == "debian11":
            structure_test(
                name = "openssl_" + arch + "_" + distro + "_test",
                config = ["testdata/certs.yaml"],
                image = ":base_root_" + arch + "_" + distro,
                tags = ["manual", arch],
            )

        ##########################################################################################
        # Check for common base files.
        ##########################################################################################
        structure_test(
            name = "base_" + arch + "_" + distro + "_test",
            config = ["testdata/base.yaml"],
            image = ":base_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        structure_test(
            name = "base_nossl_" + arch + "_" + distro + "_test",
            config = ["testdata/base.yaml"],
            image = ":base_nossl_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check for busybox
        ##########################################################################################
        structure_test(
            name = "debug_" + arch + "_" + distro + "_test",
            config = ["testdata/debug.yaml"],
            image = ":debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        structure_test(
            name = "base_nossl_debug_" + arch + "_" + distro + "_test",
            config = ["testdata/debug.yaml"],
            image = ":base_nossl_debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        structure_test(
            name = "static_debug_" + arch + "_" + distro + "_test",
            config = ["testdata/debug.yaml"],
            image = ":static_debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check the /etc/os-release contents.
        ##########################################################################################
        structure_test(
            name = "base_release_" + arch + "_" + distro + "_test",
            config = ["testdata/" + distro + ".yaml"],
            image = ":base_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        structure_test(
            name = "base_nossl_release_" + arch + "_" + distro + "_test",
            config = ["testdata/" + distro + ".yaml"],
            image = ":base_nossl_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        structure_test(
            name = "debug_release_" + arch + "_" + distro + "_test",
            config = ["testdata/" + distro + ".yaml"],
            image = ":debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        structure_test(
            name = "static_release_" + arch + "_" + distro + "_test",
            config = ["testdata/" + distro + ".yaml"],
            image = ":static_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        structure_test(
            name = "static_debug_release_" + arch + "_" + distro + "_test",
            config = ["testdata/" + distro + ".yaml"],
            image = ":static_debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )
