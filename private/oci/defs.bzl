load(":java_image.bzl", _java_image = "java_image")
load(":cc_image.bzl", _cc_image = "cc_image")
load(":rust_image.bzl", _rust_image = "rust_image")
load(":go_image.bzl", _go_image = "go_image")
load(":sign_and_push.bzl", _sign_and_push_all = "sign_and_push_all")

java_image = _java_image
cc_image = _cc_image
rust_image = _rust_image
go_image = _go_image
sign_and_push_all = _sign_and_push_all
