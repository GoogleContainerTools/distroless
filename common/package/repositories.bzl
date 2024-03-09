"defines debian repositories"

load("@rules_distroless//apt:index.bzl", "deb_package_index")
load("//private/util:versions.bzl", "versions")

def repositories():
    "defines debian repositories"

    # bookworm
    deb_package_index(
        name = "bookworm",
        resolve_transitive = False,
        lock = "//common/package:bookworm.lock.json",
        manifest = "//common/package:bookworm.yaml",
    )

    # bookworm java only
    deb_package_index(
        name = "bookworm_java",
        resolve_transitive = False,
        lock = "//common/package:bookworm_java.lock.json",
        manifest = "//common/package:bookworm_java.yaml",
    )

    # bookworm python only
    deb_package_index(
        name = "bookworm_python",
        resolve_transitive = False,
        lock = "//common/package:bookworm_python.lock.json",
        manifest = "//common/package:bookworm_python.yaml",
    )

    # bullseye
    deb_package_index(
        name = "bullseye",
        resolve_transitive = False,
        lock = "//common/package:bullseye.lock.json",
        manifest = "//common/package:bullseye.yaml",
    )

    # bullseye java only
    deb_package_index(
        name = "bullseye_java",
        resolve_transitive = False,
        lock = "//common/package:bullseye_java.lock.json",
        manifest = "//common/package:bullseye_java.yaml",
    )

    # bullseye python only
    deb_package_index(
        name = "bullseye_python",
        resolve_transitive = False,
        lock = "//common/package:bullseye_python.lock.json",
        manifest = "//common/package:bullseye_python.yaml",
    )

    # versions generated from lockfiles
    versions(
        name = "versions",
        locks = {
            "//common/package:bullseye_python.lock.json": "bullseye_python",
            "//common/package:bullseye_java.lock.json": "bullseye_java",
            "//common/package:bullseye.lock.json": "bullseye",
            "//common/package:bookworm_python.lock.json": "bookworm_python",
            "//common/package:bookworm_java.lock.json": "bookworm_java",
            "//common/package:bookworm.lock.json": "bookworm",
        },
    )
