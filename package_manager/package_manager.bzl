load(":dpkg.bzl", _dpkg_list = "dpkg_list", _dpkg_src = "dpkg_src")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

dpkg_list = _dpkg_list
dpkg_src = _dpkg_src

def package_manager_repositories():
    http_file(
        name = "dpkg_parser",
        urls = [("https://storage.googleapis.com/distroless/package_manager_tools/1b8448ea6f55db64ea3c1956d4dd1b9c47166a8c/dpkg_parser.par")],
        executable = True,
        sha256 = "02aa2a062de01ce216fa795f470fe6bf2c90a7898c89df2941ab160c65119fc4",
    )
