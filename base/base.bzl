# defines a function to replicate the container images for different distributions
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("//cacerts:cacerts.bzl", "cacerts")
load("//:checksums.bzl", "ARCHITECTURES")
load("@io_bazel_rules_go//go:def.bzl", "go_binary")

NONROOT = 65532

def deb_file(arch, distro, package):
    return "@" + arch + "_" + distro + "_" + package + "//file"

# Replicate everything for all distroless suffixes
def distro_components(distro):
    for arch in ARCHITECTURES:
        cacerts(
            name = "cacerts_" + arch + "_" + distro,
            deb = deb_file(arch, distro, "ca-certificates"),
        )

        for (user, uid, workdir) in [("root", 0, "/"), ("nonroot", NONROOT, "/home/nonroot")]:
            container_image(
                name = "static_" + user + "_" + arch + "_" + distro,
                debs = [
                    deb_file(arch, distro, "base-files"),
                    deb_file(arch, distro, "netbase"),
                    deb_file(arch, distro, "tzdata"),
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
                    "//os_release:os_release_" + distro + ".tar",
                    ":cacerts_" + arch + "_" + distro + ".tar",
                ],
                user = "%d" % uid,
                workdir = workdir,
            )

            container_image(
                name = "base_" + user + "_" + arch + "_" + distro,
                architecture = arch,
                base = ":static_" + user + "_" + arch + "_" + distro,
                debs = [
                    deb_file(arch, distro, "libc6"),
                    deb_file(arch, distro, "libssl1.1"),
                    deb_file(arch, distro, "openssl"),
                ],
            )

            # A debug image with busybox available.
            container_image(
                name = "debug_" + user + "_" + arch + "_" + distro,
                architecture = arch,
                base = ":base_" + user + "_" + arch + "_" + distro,
                directory = "/",
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$$PATH:/busybox"},
                tars = ["//experimental/busybox:busybox_" + arch + ".tar"],
            )

            # A static debug image with busybox available.
            container_image(
                name = "static_debug_" + user + "_" + arch + "_" + distro,
                architecture = arch,
                base = ":static_" + user + "_" + arch + "_" + distro,
                directory = "/",
                entrypoint = ["/busybox/sh"],
                env = {"PATH": "$$PATH:/busybox"},
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

        container_image(
            name = "check_certs_image_" + arch + "_" + distro,
            base = "//base:static_root_" + arch + "_" + distro,
            files = [":check_certs_" + arch + "_" + distro],
            symlinks = {
                "/check_certs": "check_certs_" + arch + "_" + distro,
            },
            visibility = ["//visibility:private"],
        )

        container_test(
            name = "static_" + arch + "_" + distro + "_test",
            configs = ["testdata/static.yaml"],
            image = ":check_certs_image_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check that we can invoke openssl in the base image to check certificates.
        ##########################################################################################
        container_test(
            name = "openssl_" + arch + "_" + distro + "_test",
            configs = ["testdata/certs.yaml"],
            image = ":base_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check for common base files.
        ##########################################################################################
        container_test(
            name = "base_" + arch + "_" + distro + "_test",
            configs = ["testdata/base.yaml"],
            image = ":base_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check for busybox
        ##########################################################################################
        container_test(
            name = "debug_" + arch + "_" + distro + "_test",
            configs = ["testdata/debug.yaml"],
            image = ":debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_test(
            name = "static_debug_" + arch + "_" + distro + "_test",
            configs = ["testdata/debug.yaml"],
            image = ":static_debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        ##########################################################################################
        # Check the /etc/os-release contents.
        ##########################################################################################
        container_test(
            name = "base_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":base_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_test(
            name = "debug_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_test(
            name = "static_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":static_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )

        container_test(
            name = "static_debug_release_" + arch + "_" + distro + "_test",
            configs = ["testdata/" + distro + ".yaml"],
            image = ":static_debug_root_" + arch + "_" + distro,
            tags = ["manual", arch],
        )
