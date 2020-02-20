# Public notice: this file is for internal documentation, testing, and
# reference only. Note that repo maintainers can freely change any part of the
# repository code at any time.
package(default_visibility = ["//visibility:public"])

# Rust
load("@io_bazel_rules_docker//rust:image.bzl", "rust_image")

rust_image(
    name = "rust_example",
    srcs = ["src/main.rs"],
    base = "//cc:cc",
)
