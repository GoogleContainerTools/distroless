def php_version_dependencies(packages, php_version, excludedDeps = []):
    deps = []

    for (package) in packages:
        if package in excludedDeps:
            print("Excluded: {} package\n".format(package))
            continue
        elif "php" + php_version in package:
            deps.append(packages[package])

    return deps
