# defines a function to replicate the container images for different distributions
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load(":distro.bzl", "DISTRO_PACKAGES", "DISTRO_REPOSITORY")
load("//cacerts:cacerts.bzl", "cacerts")
load("//:checksums.bzl", "ARCHITECTURES")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")

NONROOT = 65532

# Replicate everything for all distroless suffixes
def distro_components(distro_suffix):
    for arch in ARCHITECTURES:
        cacerts(
            name = "cacerts_" + arch + distro_suffix,
            deb = DISTRO_PACKAGES[arch][distro_suffix]["ca-certificates"],
        )

        for (user, uid, workdir) in [("root", 0, "/"), ("nonroot", NONROOT, "/home/nonroot")]:
            container_image(
                name = "static_" + user + "_" + arch + distro_suffix,
                debs = [
                    DISTRO_PACKAGES[arch][distro_suffix]["base-files"],
                    DISTRO_PACKAGES[arch][distro_suffix]["netbase"],
                    DISTRO_PACKAGES[arch][distro_suffix]["tzdata"],
                ],
                architecture = arch,
                env = {
                    "PATH": "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                    # allows openssl to find the certificates by default
                    # TODO: We should run update-ca-certifaces, but that requires "openssl rehash"
                    # which would probably need to be run inside the container
                    "SSL_CERT_FILE": "/etc/ssl/certs/ca-certificates.crt",
                },
                tars = [
                    ":passwd",
                    ":group_tar",

                    # Create /tmp, too many things assume it exists.
                    # tmp.tar has a /tmp with the correct permissions 01777
                    # A tar is needed because at the moment there is no way to create a
                    # directory with specific permissions.
                    ":tmp.tar",
                    ":nsswitch.tar",
                    DISTRO_REPOSITORY[arch][distro_suffix] + "//file:os_release.tar",
                    ":cacerts_" + arch + distro_suffix + ".tar",
                ],
                user = "%d" % uid,
                workdir = workdir,
            )

            container_image(
                name = "base_" + user + "_" + arch + distro_suffix,
                architecture = arch,
                base = ":static_" + user + "_" + arch + distro_suffix,
                debs = [
                    DISTRO_PACKAGES[arch][distro_suffix]["libc6"],
                    DISTRO_PACKAGES[arch][distro_suffix]["libssl1.1"],
                    DISTRO_PACKAGES[arch][distro_suffix]["openssl"],
                ],
            )

            # A debug image with busybox available.
            container_image(
                name = "debug_" + user + "_" + arch + distro_suffix,
                architecture = arch,
                base = ":base_" + user + "_" + arch + distro_suffix,
                directory = "/",
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
            )

            # A static debug image with busybox available.
            container_image(
                name = "static_debug_" + user + "_" + arch + distro_suffix,
                architecture = arch,
                base = ":static_" + user + "_" + arch + distro_suffix,
                directory = "/",
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
            )

        ##########################################################################################
        # Check that we can overlay a pure Go binary on a static base to check certificates
        ##########################################################################################
        go_binary(
            name = "check_certs_" + arch + distro_suffix,
            srcs = ["testdata/check_certs.go"],
            goarch = arch,
            # Test image is linux based
            goos = "linux",
            pure = "on",
        )

        container_image(
            name = "check_certs_image_" + arch + distro_suffix,
            base = "//base:static_root_" + arch + distro_suffix,
            files = [":check_certs_" + arch + distro_suffix],
            symlinks = {
                "/check_certs": "check_certs_" + arch + distro_suffix,
            },
            visibility = ["//visibility:private"],
        )

        container_test(
            name = "static_" + arch + distro_suffix + "_test",
            configs = ["testdata/static.yaml"],
            image = ":check_certs_image_" + arch + distro_suffix,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check that we can invoke openssl in the base image to check certificates.
        ##########################################################################################
        container_test(
            name = "openssl_" + arch + distro_suffix + "_test",
            configs = ["testdata/certs.yaml"],
            image = ":base_root_" + arch + distro_suffix,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check for common base files.
        ##########################################################################################
        container_test(
            name = "base_" + arch + distro_suffix + "_test",
            configs = ["testdata/base.yaml"],
            image = ":base_root_" + arch + distro_suffix,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check for busybox
        ##########################################################################################
        container_test(
            name = "debug_" + arch + distro_suffix + "_test",
            configs = ["testdata/debug.yaml"],
            image = ":debug_root_" + arch + distro_suffix,
            tags = ["manual", arch],
        )

        container_test(
            name = "static_debug_" + arch + distro_suffix + "_test",
            configs = ["testdata/debug.yaml"],
            image = ":static_debug_root_" + arch + distro_suffix,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check the /etc/os-release contents.
        ##########################################################################################
        container_test(
            name = "base_release_" + arch + distro_suffix + "_test",
            configs = ["testdata/" + distro_suffix[1:] + ".yaml"],
            image = ":base_root_" + arch + distro_suffix,
            tags = ["manual", arch],
        )

        container_test(
            name = "debug_release_" + arch + distro_suffix + "_test",
            configs = ["testdata/" + distro_suffix[1:] + ".yaml"],
            image = ":debug_root_" + arch + distro_suffix,
            tags = ["manual", arch],
        )

        container_test(
            name = "static_release_" + arch + distro_suffix + "_test",
            configs = ["testdata/" + distro_suffix[1:] + ".yaml"],
            image = ":static_root_" + arch + distro_suffix,
            tags = ["manual", arch],
        )

        container_test(
            name = "static_debug_release_" + arch + distro_suffix + "_test",
            configs = ["testdata/" + distro_suffix[1:] + ".yaml"],
            image = ":static_debug_root_" + arch + distro_suffix,
            tags = ["manual", arch],
        )
