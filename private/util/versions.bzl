"generates version information from lockfiles"

# buildifier: disable=bzl-visibility
load("@rules_distroless//apt/private:version.bzl", "version")

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
    return _versions[dist][name][arch]
"""

def _parse_version(raw):
    (epoch, upstream, revision) = version.parse(raw)
    return struct(raw = raw, epoch = epoch, upstream = upstream, revision = revision)

def _versions_impl(rctx):
    versions = dict()

    for (lockpath, repo) in rctx.attr.locks.items():
        lock = json.decode(rctx.read(lockpath))

        if lock["version"] != 1:
            fail("unknown lock version")

        if repo not in versions:
            versions[repo] = dict()

        for pkg in lock["packages"]:
            if pkg["name"] not in versions[repo]:
                versions[repo][pkg["name"]] = dict()

            versions[repo][pkg["name"]][pkg["arch"]] = _parse_version(pkg["version"])

    rctx.file("versions.bzl", _VERSIONS_TMPL.format(versions))
    rctx.file("BUILD.bazel", "exports_files(['versions.bzl'])")

versions = repository_rule(
    implementation = _versions_impl,
    attrs = {
        "locks": attr.label_keyed_string_dict(mandatory = True),
    },
)
