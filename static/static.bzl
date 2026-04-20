"defines a function to build static different distributions"

load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_go//go:def.bzl", "go_binary")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("//:distro.bzl", "VARIANTS")
load("//common:variables.bzl", "DEBUG_MODE", "NONROOT")
load("//private/util:deb.bzl", "deb")
load("//private/util:tar.bzl", "tar")

USER_VARIANTS = [("root", 0, "/"), ("nonroot", NONROOT, "/home/nonroot")]

def static_image_index(distro, architectures):
    """Build image index for a distro

    Args:
        distro: name of distribution
        architectures: all architectures included in index
    """
    for (user, _, _) in USER_VARIANTS:
        for mode in DEBUG_MODE:
            oci_image_index(
                name = "static" + mode + "_" + user + "_" + distro,
                images = [
                    "static" + mode + "_" + user + "_" + arch + "_" + distro
                    for arch in architectures
                ],
            )

def static_image(distro, arch, packages):
    """static and debug images and tests for a distro/arch

    Args:
        distro: name of the distribution
        arch: the target architecture
        packages: distro-specific packages to include
    """
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
                deb.package(arch, distro, pkg)
                for pkg in packages
            ] + [
                "//common:rootfs",
                "//common:passwd",
                "//common:home",
                "//common:group",
                # Create /tmp, too many things assume it exists.
                # tmp.tar has a /tmp with the correct permissions 01777
                "//common:tmp",
                ":nsswitch",
                "//common:os_release_" + distro,
                "//common:cacerts_" + distro + "_" + arch,
            ],
            user = "%d" % uid,
            workdir = workdir,
            os = "linux",
            architecture = arch,
            variant = VARIANTS.get(arch),
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

    tar(
        name = "check_certs_" + arch + "_" + distro + "_tar",
        extension = "tar.gz",
        srcs = ["check_certs_" + arch + "_" + distro],
        symlinks = {
            "/check_certs": "check_certs_" + arch + "_" + distro,
        },
    )

    oci_image(
        name = "check_certs_image_" + arch + "_" + distro,
        base = "//static:static_root_" + arch + "_" + distro,
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
    # Check for busybox
    ##########################################################################################
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
