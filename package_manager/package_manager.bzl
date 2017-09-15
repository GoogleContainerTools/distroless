load(":dpkg.bzl", "dpkg_list", "dpkg_src")

def package_manager_repositories():
  native.http_file(
      name = "dpkg_parser",
      url = ('https://storage.googleapis.com/distroless/package_manager_tools/v0.5/dpkg_parser.par'),
      executable = True,
      sha256 = "e008f56117eaf12c6a7e60c47901419fa84a458e4732387f04d2101bae5c7c95",
  )
