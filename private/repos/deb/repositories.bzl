"defines debian repositories"

load("@rules_distroless//apt:index.bzl", "deb_index")
load("//private/util:versions.bzl", "versions")

_PACKAGE_TMPL = """
load("@distroless//private/pkg:debian_spdx.bzl", "debian_spdx")
load("@distroless//private/util:merge_providers.bzl", "merge_providers")
load("@rules_distroless//apt:defs.bzl", "dpkg_statusd")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

alias(
    name = "control",
    actual = "@{repo_name}//:control",
    visibility = ["//visibility:public"]
)
alias(
    name = "data",
    actual = "@{repo_name}//:data",
    visibility = ["//visibility:public"]
)

dpkg_statusd(
    name = "statusd",
    control = ":control",
    package_name = "{name}"
)

pkg_tar(
    name = "data_statusd",
    # workaround for https://github.com/bazelbuild/rules_pkg/issues/652
    package_dir = "./",
    deps = [
        ":data",
        ":statusd"
    ]
)

debian_spdx(
    name = "spdx",
    control = ":control",
    data = ":data",
    package_name = "{name}",
    spdx_id = "{repo_name}",
    sha256 = "{sha256}",
    urls = {urls}
)

merge_providers(
    name = "{target_name}",
    srcs = [":data_statusd", ":spdx"],
    visibility = ["//visibility:public"],
)
"""

def repositories():
    "defines debian repositories"

    # bookworm
    deb_index(
        name = "bookworm",
        package_template = _PACKAGE_TMPL,
        resolve_transitive = False,
        lock = "//private/repos/deb:bookworm.lock.json",
        manifest = "//private/repos/deb:bookworm.yaml",
    )

    # bookworm java only
    deb_index(
        name = "bookworm_java",
        package_template = _PACKAGE_TMPL,
        resolve_transitive = False,
        lock = "//private/repos/deb:bookworm_java.lock.json",
        manifest = "//private/repos/deb:bookworm_java.yaml",
    )

    # bookworm python only
    deb_index(
        name = "bookworm_python",
        package_template = _PACKAGE_TMPL,
        resolve_transitive = False,
        lock = "//private/repos/deb:bookworm_python.lock.json",
        manifest = "//private/repos/deb:bookworm_python.yaml",
    )

    # bullseye
    deb_index(
        name = "bullseye",
        package_template = _PACKAGE_TMPL,
        resolve_transitive = False,
        lock = "//private/repos/deb:bullseye.lock.json",
        manifest = "//private/repos/deb:bullseye.yaml",
    )

    # bullseye java only
    deb_index(
        name = "bullseye_java",
        package_template = _PACKAGE_TMPL,
        resolve_transitive = False,
        lock = "//private/repos/deb:bullseye_java.lock.json",
        manifest = "//private/repos/deb:bullseye_java.yaml",
    )

    # bullseye python only
    deb_index(
        name = "bullseye_python",
        package_template = _PACKAGE_TMPL,
        resolve_transitive = False,
        lock = "//private/repos/deb:bullseye_python.lock.json",
        manifest = "//private/repos/deb:bullseye_python.yaml",
    )

    # versions generated from lockfiles
    versions(
        name = "versions",
        locks = {
            "//private/repos/deb:bullseye_python.lock.json": "bullseye_python",
            "//private/repos/deb:bullseye_java.lock.json": "bullseye_java",
            "//private/repos/deb:bullseye.lock.json": "bullseye",
            "//private/repos/deb:bookworm_python.lock.json": "bookworm_python",
            "//private/repos/deb:bookworm_java.lock.json": "bookworm_java",
            "//private/repos/deb:bookworm.lock.json": "bookworm",
        },
    )
