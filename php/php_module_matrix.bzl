load("//base:base.bzl", "deb_file")

def php_module_matrix(arch, distro, php_version, modules):
    debs = []

    if php_version == "7.4":
        debs.append(deb_file(arch, distro, "php" + php_version + "-json"))
    for module in modules:
        debs.append(deb_file(arch, distro, "php" + php_version + "-" + module))

    return debs
