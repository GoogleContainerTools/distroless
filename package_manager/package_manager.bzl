load(":dpkg.bzl", "dpkg_list", "dpkg_src")

def package_manager_repositories():
  native.http_file(
      name = "dpkg_parser",
      url = ('https://storage.googleapis.com/distroless/package_manager_tools/b35d94bc3d9690d7fcb455a0e06d0e29fa39484b/dpkg_parser.par'),
      executable = True,
      sha256 = "f3bf992f0deba05881599391bd851f90e82cbc4748150247b466863fe3639567",
  )
