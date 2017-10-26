load(":dpkg.bzl", "dpkg_list", "dpkg_src")

def package_manager_repositories():
  native.http_file(
      name = "dpkg_parser",
      url = ('https://storage.googleapis.com/distroless/package_manager_tools/872f43c0f9b0f3d0d0c4d832edc59a1e4bd63e99/dpkg_parser.par'),
      executable = True,
      sha256 = "ec12a77e02b1358434e15e1ce68b08501675350858a8e79599fb9e1064b051c0",
  )
