exports_files(["validate_usr_symlinks.awk"])

sh_test(
    name = "validate_usr_symlinks_test",
    srcs = ["validate_usr_symlinks_test.sh"],
    data = [
        "validate_usr_symlinks.awk",
        "@bazel_tools//tools/bash/runfiles",
        "@gawk",
    ],
)
