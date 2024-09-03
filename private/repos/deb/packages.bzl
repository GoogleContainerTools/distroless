"install debian packages"

load("@bookworm//:packages.bzl", "bookworm_packages")
load("@bookworm_java//:packages.bzl", "bookworm_java_packages")
load("@bookworm_python//:packages.bzl", "bookworm_python_packages")

def packages():
    "install debian packages"
    bookworm_packages()
    bookworm_java_packages()
    bookworm_python_packages()
