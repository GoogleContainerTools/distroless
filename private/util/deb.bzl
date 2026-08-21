"utility functions for constructing debian package labels"

load("@versions//:versions.bzl", "version")
load("//private/util:merge_providers.bzl", "merge_providers")
load("//private/util:tar.bzl", "tar")

DIST_ALIAS = dict(
    # bullseye (deprecated)
    debian11 = "bullseye",
    bullseye = "debian11",
    # bookworm
    debian12 = "bookworm",
    bookworm = "debian12",
    # trixie
    debian13 = "trixie",
    trixie = "debian13",
)

ARCH_ALIAS = dict(
    arm = "armhf",
    ppc64le = "ppc64el",
    arm64 = "arm64",
    amd64 = "amd64",
    s390x = "s390x",
    riscv64 = "riscv64",
)

def _get_dist_arch_alias(arch, dist, repo_suffix):
    dist = DIST_ALIAS[dist]
    arch = ARCH_ALIAS[arch]

    if dist == "bookworm" and arch == "s390x" and repo_suffix == None:
        dist = "bookworm_s390x"

    if repo_suffix != None:
        dist += "_" + repo_suffix

    return (arch, dist)

def _package(arch, dist, package, repo_suffix = None):
    (arch, dist) = _get_dist_arch_alias(arch, dist, repo_suffix)
    return "@{dist}//{package}/{arch}".format(arch = arch, dist = dist, package = package)

def _data(arch, dist, package, repo_suffix = None):
    (arch, dist) = _get_dist_arch_alias(arch, dist, repo_suffix)
    return "@{dist}//{package}/{arch}:data".format(arch = arch, dist = dist, package = package)

def _statusd(arch, dist, package, repo_suffix = None):
    (arch, dist) = _get_dist_arch_alias(arch, dist, repo_suffix)
    return "@{dist}//{package}/{arch}:statusd".format(arch = arch, dist = dist, package = package)

def _spdx(arch, dist, package, repo_suffix = None):
    (arch, dist) = _get_dist_arch_alias(arch, dist, repo_suffix)
    return "@{dist}//{package}/{arch}:spdx".format(arch = arch, dist = dist, package = package)

def _version(arch, dist, package, repo_suffix = None):
    (arch, dist) = _get_dist_arch_alias(arch, dist, repo_suffix)
    return version(dist, arch, package).raw

def deb_derived_package(name, data, package, distro, arch, repo_suffix = None, visibility = None):
    """Wraps a derived data layer with its Debian status.d registration and SPDX SBOM."""
    tar(
        name = name + "_tar",
        extension = "tar.gz",
        package_dir = "./",
        deps = [
            data,
            _statusd(arch, distro, package, repo_suffix),
        ],
        visibility = ["//visibility:private"],
    )

    merge_providers(
        name = name,
        srcs = [
            ":" + name + "_tar",
            _spdx(arch, distro, package, repo_suffix),
        ],
        visibility = visibility,
    )

deb = struct(
    package = _package,
    data = _data,
    statusd = _statusd,
    spdx = _spdx,
    version = _version,
)
