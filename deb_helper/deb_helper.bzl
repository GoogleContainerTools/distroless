load(":deb_packages.bzl", "deb_packages")

def deb_loader():
  # py_binary can't be used here, so use an external artifact storage for now
  native.http_file(
      name = "deb_file_loader",
      url = ("http://localhost/deb_file_loader.par"),
      executable = True,
      sha256 = "c5fefa95f14d20ba96e62a9490905d6fd05d0b1119e9368789afc35139e6133f",
  )
