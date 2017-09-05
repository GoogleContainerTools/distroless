load(":deb_packages.bzl", "deb_packages")

def deb_repositories():
  # py_binary can't be used here, so use an external artifact storage for now
  native.http_file(
      name = "deb_file_loader",
      url = ("http://localhost/deb_file_loader.par"),
      executable = True,
      sha256 = "41654c558cdaa38bddc6acc9ac4dc5aac050471ae563b8ecff5d35bb73b54891",
  )
