"node"

BUILD_TMPL = """\
# GENERATED BY node_archive.bzl
load("@distroless//private/pkg:debian_spdx.bzl", "debian_spdx")
load("@distroless//private/util:merge_providers.bzl", "merge_providers")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

pkg_tar(
    name = "data",
    srcs = glob(
        [
            "output/bin/node",
            "output/LICENSE",
        ],
    ),
    package_dir = "/nodejs",
    strip_prefix = "external/{canonical_name}/output"
)

pkg_tar(
    name = "_control",
    srcs = ["control"]
)

debian_spdx(
    name = "spdx",
    control = ":_control.tar",
    data = ":data.tar",
    package_name = "{package_name}",
    spdx_id = "{spdx_id}",
    sha256 = "{sha256}",
    urls = [{urls}]
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
    rctx.template(
        "control",
        rctx.attr.control,
        substitutions = {
            "{{VERSION}}": rctx.attr.version,
            "{{ARCHITECTURE}}": rctx.attr.architecture,
            "{{SHA256}}": rctx.attr.sha256,
        },
    )
    rctx.file(
        "BUILD.bazel",
        content = BUILD_TMPL.format(
            canonical_name = rctx.attr.name,
            name = rctx.attr.name.split("~")[-1],
            package_name = rctx.attr.package_name,
            spdx_id = rctx.attr.name,
            urls = ",".join(['"%s"' % url for url in rctx.attr.urls]),
            sha256 = rctx.attr.sha256,
        ),
    )

node_archive = repository_rule(
    implementation = _impl,
    attrs = {
        "urls": attr.string_list(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "type": attr.string(default = ".tar.gz"),
        "strip_prefix": attr.string(),
        "package_name": attr.string(default = "nodejs"),
        "version": attr.string(mandatory = True),
        "architecture": attr.string(mandatory = True),
        # control is only used to populate the sbom, see https://github.com/GoogleContainerTools/distroless/issues/1373
        # for why writing debian control files to the image is incompatible with scanners.
        "control": attr.label(),
    },
)

def _node_impl(module_ctx):
    mod = module_ctx.modules[0]

    if len(module_ctx.modules) > 1:
        fail("node.archive should be called only once")
    if not mod.is_root:
        fail("node.archive should be called from root module only.")

    # Node (https://nodejs.org/en/about/releases/)
    # Follow Node's maintainence schedule and support all LTS versions that are not end of life

    node_archive(
        name = "nodejs20_amd64",
        sha256 = "d80a33707605ced9a31b8f543cea9ab512bc3d2fef2c148f31a50e939ff07560",
        strip_prefix = "node-v20.19.4-linux-x64/",
        urls = ["https://nodejs.org/dist/v20.19.4/node-v20.19.4-linux-x64.tar.gz"],
        version = "20.19.4",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm64",
        sha256 = "d200798332b7a56d355888ce58e6a639fac7939a4833e5bc8780c66888e1ce4d",
        strip_prefix = "node-v20.19.4-linux-arm64/",
        urls = ["https://nodejs.org/dist/v20.19.4/node-v20.19.4-linux-arm64.tar.gz"],
        version = "20.19.4",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_arm",
        sha256 = "bdff86d5ff91214c6d6c421b42b35442daebcf42f85bbfb6643e7a950a093c3b",
        strip_prefix = "node-v20.19.4-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v20.19.4/node-v20.19.4-linux-armv7l.tar.gz"],
        version = "20.19.4",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_ppc64le",
        sha256 = "572e3a4cc5371680b763eddda3df45704e3478d3c2d3c774927186184fba3ac9",
        strip_prefix = "node-v20.19.4-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v20.19.4/node-v20.19.4-linux-ppc64le.tar.gz"],
        version = "20.19.4",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs20_s390x",
        sha256 = "17a95c4591478bf3ccd8919ff74810feb46d320c73e90430ac8ef0fb724705ae",
        strip_prefix = "node-v20.19.4-linux-s390x/",
        urls = ["https://nodejs.org/dist/v20.19.4/node-v20.19.4-linux-s390x.tar.gz"],
        version = "20.19.4",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_amd64",
        sha256 = "a2e703725d8683be86bb5da967bf8272f4518bdaf10f21389e2b2c9eaeae8c8a",
        strip_prefix = "node-v22.18.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v22.18.0/node-v22.18.0-linux-x64.tar.gz"],
        version = "22.18.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm64",
        sha256 = "d415eeea90a2fdb60c66dd386b258acbfc4d1fa4720a8df5dea7369fbdbcddee",
        strip_prefix = "node-v22.18.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v22.18.0/node-v22.18.0-linux-arm64.tar.gz"],
        version = "22.18.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_arm",
        sha256 = "57830914581dc3640e8d95378b76c6910860f42531959e4e88eb445e0cd982b0",
        strip_prefix = "node-v22.18.0-linux-armv7l/",
        urls = ["https://nodejs.org/dist/v22.18.0/node-v22.18.0-linux-armv7l.tar.gz"],
        version = "22.18.0",
        architecture = "arm",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_ppc64le",
        sha256 = "38f965cbaa5e730dbd3b1afe895cfdb86da96371474827d05d847d338a0c9c97",
        strip_prefix = "node-v22.18.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v22.18.0/node-v22.18.0-linux-ppc64le.tar.gz"],
        version = "22.18.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs22_s390x",
        sha256 = "f3578b0e7cdf247045f6eeb766febd74942954352161102cb6040a4d4c3b4c3c",
        strip_prefix = "node-v22.18.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v22.18.0/node-v22.18.0-linux-s390x.tar.gz"],
        version = "22.18.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs24_amd64",
        sha256 = "369f2a3668dde7e324697040fafdcf442fd198b8c102317145417b3c83a9794a",
        strip_prefix = "node-v24.5.0-linux-x64/",
        urls = ["https://nodejs.org/dist/v24.5.0/node-v24.5.0-linux-x64.tar.gz"],
        version = "24.5.0",
        architecture = "amd64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs24_arm64",
        sha256 = "c643c118d907c8db42a677a12789eb5d55ad6de4b8e2c11bab08dbd23852da2e",
        strip_prefix = "node-v24.5.0-linux-arm64/",
        urls = ["https://nodejs.org/dist/v24.5.0/node-v24.5.0-linux-arm64.tar.gz"],
        version = "24.5.0",
        architecture = "arm64",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs24_ppc64le",
        sha256 = "7f45e28aedae5a4077c04fa1934268c9e3620dcfb105624517c2410ca1deb00d",
        strip_prefix = "node-v24.5.0-linux-ppc64le/",
        urls = ["https://nodejs.org/dist/v24.5.0/node-v24.5.0-linux-ppc64le.tar.gz"],
        version = "24.5.0",
        architecture = "ppc64le",
        control = "//nodejs:control",
    )

    node_archive(
        name = "nodejs24_s390x",
        sha256 = "1d151244f5502ff7e72271e603889d789dec021f0cb28148d90f4a8ce89eaf30",
        strip_prefix = "node-v24.5.0-linux-s390x/",
        urls = ["https://nodejs.org/dist/v24.5.0/node-v24.5.0-linux-s390x.tar.gz"],
        version = "24.5.0",
        architecture = "s390x",
        control = "//nodejs:control",
    )

    return module_ctx.extension_metadata(
        root_module_direct_deps = [
            "nodejs20_amd64",
            "nodejs20_arm64",
            "nodejs20_arm",
            "nodejs20_ppc64le",
            "nodejs20_s390x",
            "nodejs22_amd64",
            "nodejs22_arm64",
            "nodejs22_arm",
            "nodejs22_ppc64le",
            "nodejs22_s390x",
            "nodejs24_amd64",
            "nodejs24_arm64",
            "nodejs24_ppc64le",
            "nodejs24_s390x",
        ],
        root_module_direct_dev_deps = [],
    )

_archive = tag_class(attrs = {})

node = module_extension(
    implementation = _node_impl,
    tag_classes = {
        "archive": _archive,
    },
)
