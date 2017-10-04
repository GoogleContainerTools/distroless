def _deb_packages_impl(repository_ctx):
  repository_ctx.file("debs/BUILD", """
package(default_visibility = ["//visibility:public"])
deb_files = glob(["*.deb"])
exports_files(deb_files + ["deb_packages.bzl"])
""")
  args = [
      repository_ctx.path(repository_ctx.attr._deb_file_loader),
      "--rule_name", repository_ctx.name,
      "--distro_type", repository_ctx.attr.distro_type,
      "--distro", repository_ctx.attr.distro,
      "--arch", repository_ctx.attr.arch,
      # This is probably the ugliest JSON encoder out there... :-/
      "--packages_dict", '{"' + '","'.join(['{}":"{}'.format(key, value) for key, value in repository_ctx.attr.packages.items()]) + '"}',
      "--packages_sha256_dict", '{"' + '","'.join(['{}":"{}'.format(key, value) for key, value in repository_ctx.attr.packages_sha256.items()]) + '"}',
      "--mirrors_list", '["' + '","'.join(repository_ctx.attr.mirrors) + '"]',
  ]
  result = repository_ctx.execute(args)
  if result.return_code:
    fail("deb_file_loader command failed: %s (%s)" % (result.stderr, " ".join(args)))

_deb_packages = repository_rule(
    _deb_packages_impl,
    attrs = {
        "distro_type": attr.string(
            doc = "the name of the distribution type, required - e.g. debian or ubuntu",
        ),
        "distro": attr.string(
            doc = "the name of the distribution, required - e.g. wheezy or jessie-backports",
        ),
        "arch": attr.string(
            doc = "the target package architecture, required - e.g. arm64 or amd64",
        ),
        "packages": attr.string_dict(
            doc = "a dictionary mapping packagename to package_path, required - e.g. {\"foo\":\"pool/main/f/foo/foo_1.2.3-0_amd64.deb\"}",
        ),
        "packages_sha256": attr.string_dict(
            doc = "a dictionary mapping packagename to package_hash, required - e.g. {\"foo\":\"1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef\"}",
        ),
        "mirrors": attr.string_list(
            doc = "a list of full URLs of the package repository, required - e.g. http://deb.debian.org/debian",
        ),
        "pgp_key": attr.string(
            doc = "the name of the http_file rule that contains the pgp key that signed the Release file at <mirrorURL>/dists/<distro>/Release, required",
        ),
        "_deb_file_loader": attr.label(
            executable = True,
            default = Label("@deb_file_loader//file:deb_file_loader.par"),
            allow_single_file = True,
            cfg = "host",
        ),
    },
)

def deb_packages(**kwargs):
  _deb_packages(**kwargs)
