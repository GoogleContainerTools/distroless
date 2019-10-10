load(":dpkg.bzl", _dpkg_list = "dpkg_list", _dpkg_src = "dpkg_src")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

dpkg_list = _dpkg_list
dpkg_src = _dpkg_src

def package_manager_repositories():
    http_file(
        name = "dpkg_parser",
        urls = [("https://storage.googleapis.com/distroless/package_manager_tools/548be30ea343ebf1e3729e1334b8adca8957e0c1/dpkg_parser.par")],
        executable = True,
        sha256 = "2ca62e67ce4d79a3f4072908559beef9f9c15e1a0f8dbc72a92c046f7c0c9df6",
    )
