load(":dpkg.bzl", "dpkg_list", "dpkg_src")

def package_manager_repositories():
  native.http_file(
      name = "dpkg_parser",
      url = ('https://storage.googleapis.com/distroless/package_manager_tools/v0.4/dpkg_parser.par'),
      executable = True,
      sha256 = "45fac43b00173621f4fc6e65c923a2d33e798c9e94a248ec43fafcdf0b014f15",
  )
