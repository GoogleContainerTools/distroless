# defines a function to replicate the container images for different distributions
load("@io_bazel_rules_docker//container:container.bzl", "container_image")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@package_bundle//file:packages.bzl", "packages")
load("@package_bundle_debian10//file:packages.bzl", packages_debian10 = "packages")
load("//cacerts:cacerts.bzl", "cacerts")

NONROOT = 65532

DISTRO_PACKAGES = {
    "_debian9": packages,
    "_debian10": packages_debian10,
}

DISTRO_REPOSITORY = {
    "_debian9": "@debian_stretch",
    "_debian10": "@debian10",
}

# Replicate everything for debian9 and debian10
def distro_components(distro_suffix):
    cacerts(
        name = "cacerts" + distro_suffix,
        deb = DISTRO_PACKAGES[distro_suffix]["ca-certificates"],
    )

    container_image(
        name = "static" + distro_suffix,
        debs = [
            DISTRO_PACKAGES[distro_suffix]["base-files"],
            DISTRO_PACKAGES[distro_suffix]["netbase"],
            DISTRO_PACKAGES[distro_suffix]["tzdata"],
        ],
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
            DISTRO_REPOSITORY[distro_suffix] + "//file:os_release.tar",
            ":cacerts" + distro_suffix + ".tar",
        ],
    )

    container_image(
        name = "base" + distro_suffix,
        base = ":static" + distro_suffix,
        debs = [
            DISTRO_PACKAGES[distro_suffix]["libc6"],
            DISTRO_PACKAGES[distro_suffix]["libssl1.1"],
            DISTRO_PACKAGES[distro_suffix]["openssl"],
        ],
    )

    # A debug image with busybox available.
    container_image(
        name = "debug" + distro_suffix,
        base = ":base" + distro_suffix,
        directory = "/",
        entrypoint = ["/busybox/sh"],
        env = {"PATH": "$$PATH:/busybox"},
        tars = ["//experimental/busybox:busybox.tar"],
    )

    # Non-root base images
    container_image(
        name = "static-nonroot" + distro_suffix,
        base = ":static" + distro_suffix,
        user = "%d" % NONROOT,
        workdir = "/home/nonroot",
    )

    container_image(
        name = "base-nonroot" + distro_suffix,
        base = ":base" + distro_suffix,
        user = "%d" % NONROOT,
        workdir = "/home/nonroot",
    )

    container_image(
        name = "debug-nonroot" + distro_suffix,
        base = ":debug" + distro_suffix,
        user = "%d" % NONROOT,
        workdir = "/home/nonroot",
    )

    container_test(
        name = "debug" + distro_suffix + "_test",
        configs = ["testdata/debug.yaml"],
        image = ":debug" + distro_suffix,
    )

    container_test(
        name = "base" + distro_suffix + "_test",
        configs = ["testdata/base.yaml"],
        image = ":base" + distro_suffix,
    )

    container_image(
        name = "check_certs_image" + distro_suffix,
        base = "//base:base" + distro_suffix,
        files = [":check_certs"],
        visibility = ["//visibility:private"],
    )

    container_test(
        name = "certs" + distro_suffix + "_test",
        configs = ["testdata/certs.yaml"],
        image = ":check_certs_image" + distro_suffix,
    )

    container_test(
        name = "base_release" + distro_suffix + "_test",
        configs = ["testdata/" + distro_suffix[1:] + ".yaml"],
        image = ":base" + distro_suffix,
    )

    container_test(
        name = "debug_release" + distro_suffix + "_test",
        configs = ["testdata/" + distro_suffix[1:] + ".yaml"],
        image = ":debug" + distro_suffix,
    )

    container_test(
        name = "static_release" + distro_suffix + "_test",
        configs = ["testdata/" + distro_suffix[1:] + ".yaml"],
        image = ":static" + distro_suffix,
    )
