load("//private/util:tar.bzl", "tar")
load(":config.bzl", "PYTHON_ARCHITECTURES", "PYTHON_DISTROS", "PYTHON_MAJOR_VERSIONS", "PYTHON_PACKAGES")
load(":ldconfig.bzl", "python_ldconfig")
load(":python.bzl", "python_image", "python_image_index")

package(default_visibility = ["//visibility:public"])

sh_test(
    name = "pbs_metadata_test",
    srcs = ["pbs_metadata_test.py"],
    data = [
        "ldconfig/ldconfig.sh",
        ":gen_pbs_sbom.py",
        ":pbs_embedded_versions.py",
    ],
)

sh_test(
    name = "update_python_archives_test",
    srcs = ["update_python_archives_test.sh"],
    data = [
        ":config.bzl",
        "//:MODULE.bazel",
        "//knife.d:update_python_archives.sh",
        "//private/extensions:python.bzl",
    ],
)

# Offline contract test for a complete PBS release update.
sh_test(
    name = "update_python_archives_contract_test",
    srcs = ["update_python_archives_contract_test.sh"],
    data = [
        "testdata/python3.13.yaml",
        "testdata/python3.14.yaml",
        ":config.bzl",
        ":gen_pbs_sbom.py",
        ":pbs_embedded_versions.py",
        ":update_python_archives_test.sh",
        "//:MODULE.bazel",
        "//:knife",
        "//knife.d:update_java_versions.sh",
        "//knife.d:update_python_archives.sh",
        "//private/extensions:python.bzl",
    ],
)

[
    python_image(
        arch = arch,
        distro = distro,
        major_version = major_version,
        packages = PYTHON_PACKAGES[distro],
    )
    for distro in PYTHON_DISTROS
    for major_version in PYTHON_MAJOR_VERSIONS
    for arch in PYTHON_ARCHITECTURES[distro][major_version]
]

[
    python_image_index(
        architectures = PYTHON_ARCHITECTURES[distro][major_version],
        distro = distro,
        major_version = major_version,
    )
    for distro in PYTHON_DISTROS
    for major_version in PYTHON_MAJOR_VERSIONS
]

# Ship an ld.so.cache per architecture so ctypes.util.find_library() works.
# Generate it by running ldconfig inside the image.
LDCONFIG_IMAGES = {
    arch: "python{}_root_{}_debian13".format(
        version.replace(".", ""),
        arch,
    )
    for version in PYTHON_MAJOR_VERSIONS
    for arch in PYTHON_ARCHITECTURES["debian13"][version]
}

[
    tar(
        name = "ldconfig_cache_{}".format(arch),
        srcs = ["ldconfig/ld.so.cache.{}".format(arch)],
        args = [
            "--format",
            "gnutar",
        ],
        extension = "tar.gz",
        mtree = ["etc/ld.so.cache uid=0 gid=0 uname=root gname=root mode=0644 time=0 type=file content=$(location ldconfig/ld.so.cache.{})".format(arch)],
    )
    for arch in LDCONFIG_IMAGES
]

python_ldconfig(
    images = LDCONFIG_IMAGES,
)
