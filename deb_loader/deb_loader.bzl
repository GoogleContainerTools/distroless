load(":deb_packages.bzl", "deb_packages")

def deb_repositories():
  # py_binary can't be used here, so use an external artifact storage for now
  native.http_file(
      name = "deb_file_loader",
      urls = ["https://storage.googleapis.com/bazel-distroless-tools/v0.1/deb_file_loader.par"],
      executable = True,
      sha256 = "6a2a7073d577767b62390855561a9129ada60048d9ef70f0eb6e24282f5801ef",
  )
