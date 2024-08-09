"generates version information from lockfiles"

# buildifier: disable=bzl-visibility
load("@rules_distroless//apt/private:version.bzl", _version = "version")

_VERSIONS_TMPL = """\
"versions repo"

# AUTO GENERATED. DO NOT EDIT.
_versions = {}

# buildifier: disable=function-docstring
def version(dist, arch, name):
    if dist not in _versions:
        fail("unknown dist {{}}".format(dist))
    if name not in _versions[dist]:
        fail("unknown package {{}}".format(name))
    if arch not in _versions[dist][name]:
        fail("unknown arch {{}}".format(arch))
    return struct(**_versions[dist][name][arch])
"""

def _parse_version(raw):
    (epoch, upstream, revision) = _version.parse(raw)

    return struct(raw = raw, epoch = epoch, upstream = upstream, revision = revision)

def _version_repo_impl(rctx):
    rctx.file("versions.bzl", _VERSIONS_TMPL.format(json.decode(rctx.attr.versions)))
    rctx.file("BUILD.bazel", "exports_files(['versions.bzl'])")

version_repo = repository_rule(
    implementation = _version_repo_impl,
    attrs = {
        "versions": attr.string(),
    },
)

def _version_impl(module_ctx):
    versions = dict()

    for mod in module_ctx.modules:
        for from_lock in mod.tags.from_lock:
            lock = json.decode(module_ctx.read(from_lock.lock))
            repo = from_lock.repo_name

            if lock["version"] != 1:
                fail("unknown lock version")

            if repo not in versions:
                versions[repo] = dict()

            for pkg in lock["packages"]:
                if pkg["name"] not in versions[repo]:
                    versions[repo][pkg["name"]] = dict()

                versions[repo][pkg["name"]][pkg["arch"]] = _parse_version(pkg["version"])

    version_repo(
        name = "versions",
        versions = json.encode(versions),
    )

    return module_ctx.extension_metadata(
        root_module_direct_deps = ["versions"],
        root_module_direct_dev_deps = [],
    )

_from_lock = tag_class(attrs = {
    "repo_name": attr.string(mandatory = True),
    "lock": attr.label(mandatory = True),
})

version = module_extension(
    implementation = _version_impl,
    tag_classes = {
        "from_lock": _from_lock,
    },
)
