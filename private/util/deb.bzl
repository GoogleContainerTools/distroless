"utility functions for constructing debian package labels"

load("@versions//:versions.bzl", "version")

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

    if repo_suffix != None:
        dist += "_" + repo_suffix

    return (arch, dist)

def _package(arch, dist, package, repo_suffix = None):
    (arch, dist) = _get_dist_arch_alias(arch, dist, repo_suffix)
    return "@{dist}//{package}/{arch}".format(arch = arch, dist = dist, package = package)

def _data(arch, dist, package, repo_suffix = None):
    (arch, dist) = _get_dist_arch_alias(arch, dist, repo_suffix)
    return "@{dist}//{package}/{arch}:data".format(arch = arch, dist = dist, package = package)

def _version(arch, dist, package, repo_suffix = None):
    (arch, dist) = _get_dist_arch_alias(arch, dist, repo_suffix)
    return version(dist, arch, package).raw

deb = struct(
    package = _package,
    data = _data,
    version = _version,
)
