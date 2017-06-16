def _dpkg_impl(repository_ctx):
  repository_ctx.file("file/BUILD", """
package(default_visibility = ["//visibility:public"])
exports_files(["pkg.deb"])
""")

  args = [
      repository_ctx.path(repository_ctx.attr._dpkg_parser),
      "--packages-file", repository_ctx.path(repository_ctx.attr.source),
      "--package-name", repository_ctx.name
  ]

  result = repository_ctx.execute(args)
  if result.return_code:
    fail("dpkg_parser command failed: %s (%s)" % (result.stderr, " ".join(args)))

_dpkg = repository_rule(
    _dpkg_impl,
    attrs = {
        "source": attr.label(
            allow_single_file = True,
        ),
        "_dpkg_parser": attr.label(
            executable = True,
            default = Label("@dpkg_parser//file:dpkg_parser.par"),
            cfg = "host",
        ),
    },
)

def _dpkg_src_impl(repository_ctx):
  repository_ctx.file("file/BUILD", """
package(default_visibility = ["//visibility:public"])
exports_files(["Packages.json"])
""")
  args = [
      repository_ctx.path(repository_ctx.attr._dpkg_parser),
      "--download-and-extract-only=True",
      "--mirror-url=" + repository_ctx.attr.url,
      "--arch=" + repository_ctx.attr.arch, 
      "--distro=" + repository_ctx.attr.distro
  ]
  result = repository_ctx.execute(args)
  if result.return_code:
    fail("dpkg_parser command failed: %s (%s)" % (result.stderr, " ".join(args)))

_dpkg_src = repository_rule(
    _dpkg_src_impl,
    attrs = {
        "url": attr.string(),
        "arch": attr.string(),
        "distro": attr.string(),
        "_dpkg_parser": attr.label(
            executable = True,
            default = Label("@dpkg_parser//file:dpkg_parser.par"),
            cfg = "host",
        ),
    },
)

def dpkg(**kwargs):
  _dpkg(**kwargs)

def dpkg_src(**kwargs):
  _dpkg_src(**kwargs)
