load(":dpkg.bzl", "dpkg_list", "dpkg_src")

def package_manager_repositories():
  native.http_file(
      name = "dpkg_parser",
      url = ('https://storage.googleapis.com/distroless/package_manager_tools/v0.3/dpkg_parser.par'),
      executable = True,
      sha256 = "41683aa3e3202e3ca2a5d13e84e03853414f7eaa1a87f9313d55ec4b35f8c31c",
  )
