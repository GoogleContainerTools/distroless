load(":dpkg.bzl", "dpkg_list", "dpkg_src")

def package_manager_repositories():
  native.http_file(
      name = "dpkg_parser",
      url = ('https://storage.googleapis.com/distroless/package_manager_tools/v0.3/dpkg_parser.par'),
      executable = True,
      sha256 = "89862b3622a0768f6871675cb3fc05a64ad960b3c318a047a81e9e8bb17ce1f8",
  )
