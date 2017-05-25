# Documentation for `gcr.io/distroless/cc`

## Image Contents

This image contains a minimal Linux, glibc runtime for "mostly-statically compiled" languages like Rust and D.

Specifically, the image contains everything in the [base image](../base/README.md), plus:

* libgcc1 and its dependencies.

## Usage

Users are expected to include their compiled application and set the correct CMD in their image.
