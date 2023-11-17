"utility functions for constructing debian package labels"

def deb_package(arch, dist, package):
    return "@{arch}_{dist}_{package}".format(arch = arch, dist = dist, package = package)

deb = struct(
    package = deb_package
)