load(":dpkg.bzl", _dpkg_list = "dpkg_list", _dpkg_src = "dpkg_src")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

dpkg_list = _dpkg_list
dpkg_src = _dpkg_src

def package_manager_repositories():
    http_file(
        name = "dpkg_parser",
        urls = [("https://storage.googleapis.com/distroless/package_manager_tools/0e7095cc1ac3e084a1d76f86c36f8ec38483eb24/dpkg_parser.par")],
        executable = True,
        sha256 = "4511b371e181d9b2b8479c180a751c1975a1ca7d329f7b6353d48c099a779c5a",
    )
