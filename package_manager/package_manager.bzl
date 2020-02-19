load(":dpkg.bzl", _dpkg_list = "dpkg_list", _dpkg_src = "dpkg_src")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

dpkg_list = _dpkg_list
dpkg_src = _dpkg_src

def package_manager_repositories():
    http_file(
        name = "dpkg_parser",
        urls = [("https://storage.googleapis.com/distroless/package_manager_tools/0e7095cc1ac3e084a1d76f86c36f8ec38483eb24/dpkg_parser.par")],
        executable = True,
        sha256 = "02aa2a062de01ce216fa795f470fe6bf2c90a7898c89df2941ab160c65119fc4",
    )
