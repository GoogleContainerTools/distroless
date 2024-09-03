"utility functions for constructing debian package labels"

load("@versions//:versions.bzl", "version")

DIST_ALIAS = dict(
    # bullseye (deprecated)
    debian11 = "bullseye",
    bullseye = "debian11",
    # bookworm
    debian12 = "bookworm",
    bookworm = "debian12",
)

ARCH_ALIAS = dict(
    arm = "armhf",
    ppc64le = "ppc64el",
    arm64 = "arm64",
    amd64 = "amd64",
    s390x = "s390x",
)

def _get_dist_arch_alias(arch, dist):
    dist = DIST_ALIAS[dist]
    arch = ARCH_ALIAS[arch]

    rel = native.package_name()
    if rel == "java":
        dist += "_java"
    elif rel == "experimental/python3" or rel == "python3":
        dist += "_python"

    return (arch, dist)

def _package(arch, dist, package):
    (arch, dist) = _get_dist_arch_alias(arch, dist)
    return "@{dist}//{package}/{arch}".format(arch = arch, dist = dist, package = package)

def _data(arch, dist, package):
    (arch, dist) = _get_dist_arch_alias(arch, dist)
    return "@{dist}//{package}/{arch}:data".format(arch = arch, dist = dist, package = package)

def _version(arch, dist, package):
    (arch, dist) = _get_dist_arch_alias(arch, dist)
    return version(dist, arch, package).raw

deb = struct(
    package = _package,
    data = _data,
    version = _version,
)
