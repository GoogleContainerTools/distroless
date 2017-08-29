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
      "--architecture", repository_ctx.attr.architecture,
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
        "distro_type": attr.string(),
        "distro": attr.string(),
        "architecture": attr.string(),
        "packages": attr.string_dict(),
        "packages_sha256": attr.string_dict(),
        "mirrors": attr.string_list(),
        "_deb_file_loader": attr.label(
            executable = True,
            default = Label("@deb_file_loader//file:deb_file_loader.par"),
            cfg = "host",
        ),
    },
)

def deb_packages(**kwargs):
  _deb_packages(**kwargs)
