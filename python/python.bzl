"python image definitions"

load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@python_versions//:versions.bzl", "PYTHON_VERSIONS")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("//common:variables.bzl", "DEBUG_MODE", "OS_RELEASE", "USERS")
load("//private/util:deb.bzl", "deb")
load("//private/util:tar.bzl", "tar")

def _bin_version(major_version):
    """Return x.y from a beta or RC matrix version."""
    return major_version.split("b")[0].split("rc")[0]

def python_image_index(distro, major_version, architectures):
    """Create a Python image index for a distribution.

    Args:
        distro: distribution name
        major_version: Python version, such as "3.14"
        architectures: architectures included in the index
    """
    for mode in DEBUG_MODE:
        for user in USERS:
            oci_image_index(
                name = "python" + major_version.replace(".", "") + mode + "_" + user + "_" + distro,
                images = [
                    "python" + major_version.replace(".", "") + mode + "_" + user + "_" + arch + "_" + distro
                    for arch in architectures
                ],
            )

def _example_tar():
    if native.existing_rule("example"):
        return

    tar(
        name = "example",
        extension = "tar.gz",
        srcs = ["testdata/stdlib_check.py"],
    )

def python_image(distro, major_version, arch, packages):
    """Create Python and debug images with tests.

    Python comes from a python-build-standalone prebuilt tarball
    instead of the Debian Python package.

    Args:
        distro: distribution name
        major_version: Python version, such as "3.14"
        arch: target architecture
        packages: Debian packages to add to the image
    """

    _version_key = major_version + "_" + arch
    if _version_key not in PYTHON_VERSIONS:
        fail("No version found for Python version/arch: " + _version_key)
    _annotations = {
        "org.opencontainers.image.source": OS_RELEASE["HOME_URL"],
        "com.google.distroless.python.version": PYTHON_VERSIONS[_version_key],
    }

    for mode in DEBUG_MODE:
        for user in USERS:
            oci_image(
                name = "python" + major_version.replace(".", "") + mode + "_" + user + "_" + arch + "_" + distro,
                base = "//cc:cc" + mode + "_" + user + "_" + arch + "_" + distro,
                entrypoint = ["/python/bin/python" + _bin_version(major_version)],
                env = {"LANG": "C.UTF-8"},
                tars = [
                    deb.package(arch, distro, pkg)
                    for pkg in packages
                ] + [
                    "@python" + major_version.replace(".", "") + "_" + arch,
                ] + ([":ldconfig_cache_" + arch] if distro == "debian13" else []),
                annotations = _annotations,
            )

    _example_tar()

    # Debug images include BusyBox; structure tests cover non-debug images.
    for user in USERS:
        container_structure_test(
            name = "python" + major_version.replace(".", "") + "_" + user + "_" + arch + "_" + distro + "_test",
            size = "medium",
            configs = [
                "testdata/python3.yaml",
                "testdata/python3." + _bin_version(major_version).split(".")[1] + ".yaml",
            ],
            image = ":python" + major_version.replace(".", "") + "_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )

    for mode in DEBUG_MODE:
        for user in USERS:
            oci_image(
                name = "example_python" + major_version.replace(".", "") + mode + "_" + user + "_" + arch + "_" + distro,
                base = ":python" + major_version.replace(".", "") + mode + "_" + user + "_" + arch + "_" + distro,
                tars = [
                    ":example",
                ],
            )

    for user in USERS:
        container_structure_test(
            name = "example_python" + major_version.replace(".", "") + "_" + user + "_" + arch + "_" + distro + "_test",
            size = "medium",
            configs = ["testdata/example.yaml"],
            image = ":example_python" + major_version.replace(".", "") + "_" + user + "_" + arch + "_" + distro,
            tags = [
                arch,
                "manual",
            ],
        )
