"utility functions for constructing debian package labels"

def _package(arch, dist, package):
    return "@{arch}_{dist}_{package}".format(arch = arch, dist = dist, package = package)

def _data(arch, dist, package):
    return "@{}//:data".format(_package(arch = arch, dist = dist, package = package))

deb = struct(
    package = _package,
    data = _data,
)
