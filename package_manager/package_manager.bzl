load(":dpkg.bzl", "dpkg", "dpkg_src")

def package_manager_repositories():
  native.http_file(
      name = "dpkg_parser",
      url = ('https://storage.googleapis.com/distroless/package_manager_tools/0.1/dpkg_parser.par'),
      executable = True,
      sha256 = "5fc18fbd571996010409162fe0124cd308b85a9610f1ceb4f8b3048f312b9cd0",
  )
