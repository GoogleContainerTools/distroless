
load(":java_image.bzl", _java_image = "java_image")
load(":cc_image.bzl", _cc_image = "cc_image")
load(":rust_image.bzl", _rust_image = "rust_image")

java_image = _java_image
cc_image = _cc_image
rust_image = _rust_image