# Documentation for `gcr.io/distroless/base` and `gcr.io/distroless/static`

## Image Contents

This image contains a minimal Linux, glibc-based system. It contains:

* ca-certificates
* A /etc/passwd entry for a root user
* A /tmp directory
* tzdata
* glibc
* libssl
* openssl

## Usage

Users are expected to include their compiled application and set the correct cmd in their image.
