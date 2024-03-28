"install debian packages"

load("@bookworm//:packages.bzl", "bookworm_packages")
load("@bookworm_java//:packages.bzl", "bookworm_java_packages")
load("@bookworm_python//:packages.bzl", "bookworm_python_packages")
load("@bullseye//:packages.bzl", "bullseye_packages")
load("@bullseye_java//:packages.bzl", "bullseye_java_packages")
load("@bullseye_python//:packages.bzl", "bullseye_python_packages")

def packages():
    "install debian packages"
    bullseye_packages()
    bullseye_java_packages()
    bullseye_python_packages()
    bookworm_packages()
    bookworm_java_packages()
    bookworm_python_packages()
