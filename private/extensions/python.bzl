"python"

BUILD_TMPL = """\
# GENERATED FILE; DO NOT EDIT.
load("@distroless//private/pkg:package_spdx.bzl", "package_spdx")
load("@distroless//private/util:merge_providers.bzl", "merge_providers")
load("@distroless//private/util:tar.bzl", "tar")

tar(
    name = "data",
    extension = "tar.gz",
    srcs = glob(
        [
            "output/bin/python{pyver}",
            "output/lib/python{pyver}/**",
        ],
        exclude = [
            "output/lib/python{pyver}/ensurepip/**",
            "output/lib/python{pyver}/idlelib/**",
            "output/lib/python{pyver}/tkinter/**",
            "output/lib/python{pyver}/turtle.py",
            "output/lib/python{pyver}/turtledemo/**",
            "output/lib/python{pyver}/lib-dynload/_tkinter*",
            "output/lib/python{pyver}/config-{pyver}-*/**",
            "output/lib/python{pyver}/site-packages/pip/**",
            "output/lib/python{pyver}/site-packages/pip-*.dist-info/**",
        ],
    ),
    symlinks = {{
        "/python/bin/python": "python{pyver}",
        "/python/bin/python3": "python{pyver}",
    }},
    package_dir = "/python",
    strip_prefix = "external/{canonical_name}/output"
)

package_spdx(
    name = "spdx",
    package_name = "{package_name}",
    version = "{version}",
    spdx_id = "{spdx_id}",
    sha256 = "{sha256}",
    urls = [{urls}],
    copyright = "output/lib/python{pyver}/LICENSE.txt",
    homepage = "https://www.python.org/",
    supplier = "Organization: Astral <https://astral.sh/>",
    description = "Standalone CPython runtime built by python-build-standalone",
)

merge_providers(
    name = "{name}",
    srcs = [":data", ":spdx"],
    visibility = ["//visibility:public"],
)
"""

def _impl(rctx):
    rctx.report_progress("Fetching {}".format(rctx.attr.package_name))
    rctx.download_and_extract(
        url = rctx.attr.urls,
        sha256 = rctx.attr.sha256,
        type = rctx.attr.type,
        stripPrefix = rctx.attr.strip_prefix,
        output = "output",
    )
    rctx.file(
        "BUILD.bazel",
        content = BUILD_TMPL.format(
            canonical_name = rctx.attr.name,
            name = rctx.attr.name.split("+")[-1],
            package_name = rctx.attr.package_name,
            version = rctx.attr.version,
            spdx_id = rctx.attr.name,
            pyver = rctx.attr.python_version,
            urls = ",".join(['"%s"' % url for url in rctx.attr.urls]),
            sha256 = rctx.attr.sha256,
        ),
    )

python_archive = repository_rule(
    implementation = _impl,
    attrs = {
        "urls": attr.string_list(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "type": attr.string(default = ".tar.gz"),
        "strip_prefix": attr.string(),
        "package_name": attr.string(default = "python"),
        "version": attr.string(mandatory = True),
        # The x.y version used for binary and library paths, such as "3.14".
        "python_version": attr.string(mandatory = True),
        "architecture": attr.string(mandatory = True),
    },
)

_PYTHON_VERSIONS_TMPL = """\
"python versions"

# AUTO GENERATED. DO NOT EDIT.
PYTHON_VERSIONS = {versions}
"""

def _python_versions_repo_impl(rctx):
    rctx.file("versions.bzl", _PYTHON_VERSIONS_TMPL.format(versions = str(rctx.attr.versions)))
    rctx.file("BUILD.bazel", 'exports_files(["versions.bzl"])')

python_versions_repo = repository_rule(
    implementation = _python_versions_repo_impl,
    attrs = {
        "versions": attr.string_dict(),
    },
)

def _python_impl(module_ctx):
    mod = module_ctx.modules[0]

    if len(module_ctx.modules) > 1:
        fail("python.archive should be called only once")
    if not mod.is_root:
        fail("python.archive should be called from root module only.")

    # Python from python-build-standalone (https://github.com/astral-sh/python-build-standalone)
    # Release 20260901. Linux targets only (distroless images).
    # Versions 3.13 and 3.14. New stable minors are added by the updater.
    # armv7 is excluded: PBS publishes soft-float gnueabi builds
    # (interpreter /lib/ld-linux.so.3) which cannot run on the distroless armhf base
    # (loader /usr/lib/ld-linux-armhf.so.3); ppc64le is not published by PBS.
    python_archive(
        name = "python313_amd64",
        sha256 = "8a689a077337bea6d1c4bc0b7df1d52fcaa28f5f67e50df8bf417c1e3f9d8874",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.13.15+20260901-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.13.15+20260901",
        python_version = "3.13",
        architecture = "amd64",
    )

    python_archive(
        name = "python313_arm64",
        sha256 = "01ce0ce9189feaead3298abf10d4efe998c55a489b3d5d38ca4f83dda7e7977e",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.13.15+20260901-aarch64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.13.15+20260901",
        python_version = "3.13",
        architecture = "arm64",
    )

    python_archive(
        name = "python313_s390x",
        sha256 = "2790847d1cdbe98c911ae5eb66d14792267368a657e690934782d2618126b0e7",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.13.15+20260901-s390x-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.13.15+20260901",
        python_version = "3.13",
        architecture = "s390x",
    )

    python_archive(
        name = "python313_riscv64",
        sha256 = "361c7989038fa28cf63f0cfc43919b6fa7b4a6402772886603435fd0a162fd7c",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.13.15+20260901-riscv64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.13.15+20260901",
        python_version = "3.13",
        architecture = "riscv64",
    )

    python_archive(
        name = "python314_amd64",
        sha256 = "3959f92825141e04adf44982d3a83ee57af0877e893b0796e04c1468749d9b04",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.14.7+20260901-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.14.7+20260901",
        python_version = "3.14",
        architecture = "amd64",
    )

    python_archive(
        name = "python314_arm64",
        sha256 = "8a0798baa8a2c27b5751d590aced543eaa85e20b3f73d93c1af049688acdc9c5",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.14.7+20260901-aarch64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.14.7+20260901",
        python_version = "3.14",
        architecture = "arm64",
    )

    python_archive(
        name = "python314_s390x",
        sha256 = "75563511537f01d529d1eb3ca561beec90c1c0880271fe2373c3e3f3ec0940ab",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.14.7+20260901-s390x-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.14.7+20260901",
        python_version = "3.14",
        architecture = "s390x",
    )

    python_archive(
        name = "python314_riscv64",
        sha256 = "d078e7b8a92fa505e19778c3e2808a70d507679b5f18a4b22e2ff1b65746f33c",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20260901/cpython-3.14.7+20260901-riscv64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.14.7+20260901",
        python_version = "3.14",
        architecture = "riscv64",
    )

    python_versions_repo(
        name = "python_versions",
        versions = {
            "3.13_amd64": "3.13.15",
            "3.13_arm64": "3.13.15",
            "3.13_s390x": "3.13.15",
            "3.13_riscv64": "3.13.15",
            "3.14_amd64": "3.14.7",
            "3.14_arm64": "3.14.7",
            "3.14_s390x": "3.14.7",
            "3.14_riscv64": "3.14.7",
        },
    )

    return module_ctx.extension_metadata(
        root_module_direct_deps = [
            "python_versions",
            "python313_amd64",
            "python313_arm64",
            "python313_s390x",
            "python313_riscv64",
            "python314_amd64",
            "python314_arm64",
            "python314_s390x",
            "python314_riscv64",
        ],
        root_module_direct_dev_deps = [],
    )

_archive = tag_class(attrs = {})

python = module_extension(
    implementation = _python_impl,
    tag_classes = {
        "archive": _archive,
    },
)
