def _deb_packages_impl(repository_ctx):
  # check that keys in "packages" and "packages_sha256" are the same
  for package in repository_ctx.attr.packages:
    if package not in repository_ctx.attr.packages_sha256:
      fail("Package named \"%s\" was not found in packages_sha256 of rule %s" % (package, repository_ctx.name))

  # download each package
  package_rule_dict = {}
  for package in repository_ctx.attr.packages:
    urllist = []
    for mirror in repository_ctx.attr.mirrors:
      # allow mirror URLs that don't end in /
      if mirror.endswith("/"):
        urllist.append(mirror + repository_ctx.attr.packages[package])
      else:
        urllist.append(mirror + "/" + repository_ctx.attr.packages[package])
    repository_ctx.download(
        urllist,
        output="debs/" + repository_ctx.attr.packages_sha256[package] + ".deb",
        sha256=repository_ctx.attr.packages_sha256[package],
        executable=False)
    package_rule_dict[package] = "@" + repository_ctx.name + "//debs:" + repository_ctx.attr.packages_sha256[package] + ".deb"

  # create the deb_packages.bzl file that contains the package name : filename mapping
  repository_ctx.file("debs/deb_packages.bzl", repository_ctx.name + " = " + struct(**package_rule_dict).to_json())

  # create the BUILD file that globs all the deb files
  repository_ctx.file("debs/BUILD", """
package(default_visibility = ["//visibility:public"])
deb_files = glob(["*.deb"])
exports_files(deb_files + ["deb_packages.bzl"])
""")

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
    },
)

def deb_packages(**kwargs):
  _deb_packages(**kwargs)
