# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

# Rust
load("@io_bazel_rules_docker//rust:image.bzl", "rust_image")

# NOTE: Bazel Rust rules don't support cross-compilation yet,
# so at this time it's required that you build on the same platform as the image
rust_image(
    name = "rust_example",
    srcs = ["src/main.rs"],
    base = "//cc:cc_root_amd64_debian11",
    tags = [
        "amd64",
        "manual",
    ],
)
