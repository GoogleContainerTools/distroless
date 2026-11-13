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
    # Release 20261110. Linux targets only (distroless images).
    # Versions 3.13, 3.14, 3.15. New stable minors are added by the updater.
    # armv7 is excluded: PBS publishes soft-float gnueabi builds
    # (interpreter /lib/ld-linux.so.3) which cannot run on the distroless armhf base
    # (loader /usr/lib/ld-linux-armhf.so.3); ppc64le is not published by PBS.
    python_archive(
        name = "python313_amd64",
        sha256 = "f2d2199eb25880e07863b391cf7124e7ffa1338b0d65600dfcec117c4223a7fb",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.13.18+20261110-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.13.18+20261110",
        python_version = "3.13",
        architecture = "amd64",
    )

    python_archive(
        name = "python313_arm64",
        sha256 = "55c00325f7c1fddf325dfc621aabdfbbac4dc54adda224af88ec411dc12db239",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.13.18+20261110-aarch64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.13.18+20261110",
        python_version = "3.13",
        architecture = "arm64",
    )

    python_archive(
        name = "python313_s390x",
        sha256 = "a163a17596c47f16052b2e24a1bf4ee0214c2683b69390deac2c5b7688d75b8e",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.13.18+20261110-s390x-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.13.18+20261110",
        python_version = "3.13",
        architecture = "s390x",
    )

    python_archive(
        name = "python313_riscv64",
        sha256 = "769d6fb6420c6d12e1abf2e446cdb981d8775bd784772a3f885c43780ebf5e45",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.13.18+20261110-riscv64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.13.18+20261110",
        python_version = "3.13",
        architecture = "riscv64",
    )

    python_archive(
        name = "python314_amd64",
        sha256 = "c2ff2e97422f5d3896a16e0317fd212ba977bbf2688d93a6f7a03d817506bd30",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.14.10+20261110-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.14.10+20261110",
        python_version = "3.14",
        architecture = "amd64",
    )

    python_archive(
        name = "python314_arm64",
        sha256 = "38fd50f07170adc29d481913d1c30b17ecb538fbe290315fe1f83d84fdd5b694",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.14.10+20261110-aarch64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.14.10+20261110",
        python_version = "3.14",
        architecture = "arm64",
    )

    python_archive(
        name = "python314_s390x",
        sha256 = "e70f5f99dba26665dad0e43b521b44d080a33790bf5805872c676736462c2bb0",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.14.10+20261110-s390x-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.14.10+20261110",
        python_version = "3.14",
        architecture = "s390x",
    )

    python_archive(
        name = "python314_riscv64",
        sha256 = "e7225b7b4c2d61ca4e241423fe7ee8784cd40313c62169595eebafb8a553fed8",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.14.10+20261110-riscv64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.14.10+20261110",
        python_version = "3.14",
        architecture = "riscv64",
    )

    python_archive(
        name = "python315_amd64",
        sha256 = "ad23d1b73fac26440b0306ae06911031344c49a90ec19716c8362e7fa40cae43",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.15.2+20261110-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.15.2+20261110",
        python_version = "3.15",
        architecture = "amd64",
    )

    python_archive(
        name = "python315_arm64",
        sha256 = "d1367a6c3cd86a9e35712072841f1376859f3b47a2a54e224421a0f9fd169047",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.15.2+20261110-aarch64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.15.2+20261110",
        python_version = "3.15",
        architecture = "arm64",
    )

    python_archive(
        name = "python315_s390x",
        sha256 = "87228faf46bedc27fd6b8a7bcdc7ff520c86ca1b7c59eee9f14a4cf12b9d0d86",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.15.2+20261110-s390x-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.15.2+20261110",
        python_version = "3.15",
        architecture = "s390x",
    )

    python_archive(
        name = "python315_riscv64",
        sha256 = "b05b96b52b0833443c8340800e957406dbfb5db2fe2f4af6e546db9b2ae1056a",
        strip_prefix = "python/",
        urls = ["https://github.com/astral-sh/python-build-standalone/releases/download/20261110/cpython-3.15.2+20261110-riscv64-unknown-linux-gnu-install_only_stripped.tar.gz"],
        version = "3.15.2+20261110",
        python_version = "3.15",
        architecture = "riscv64",
    )

    python_versions_repo(
        name = "python_versions",
        versions = {
            "3.13_amd64": "3.13.18",
            "3.13_arm64": "3.13.18",
            "3.13_s390x": "3.13.18",
            "3.13_riscv64": "3.13.18",
            "3.14_amd64": "3.14.10",
            "3.14_arm64": "3.14.10",
            "3.14_s390x": "3.14.10",
            "3.14_riscv64": "3.14.10",
            "3.15_amd64": "3.15.2",
            "3.15_arm64": "3.15.2",
            "3.15_s390x": "3.15.2",
            "3.15_riscv64": "3.15.2",
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
            "python315_amd64",
            "python315_arm64",
            "python315_s390x",
            "python315_riscv64",
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
