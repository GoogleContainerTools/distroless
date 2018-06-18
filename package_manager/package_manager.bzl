load(":dpkg.bzl", "dpkg_list", "dpkg_src")

def package_manager_repositories():
  native.http_file(
      name = "dpkg_parser",
      url = ('https://storage.googleapis.com/distroless/package_manager_tools/ac8068579db811014780cb80105fc999fc25a730/dpkg_parser.par'),
      executable = True,
      sha256 = "08b965c60bef53ca58d26a9c35982137abc7f780a3d35d9bc5bedafea6bb8d9f",
  )
