# Documentation for `gcr.io/distroless/python3`

## Image Contents

This image contains a minimal Linux, Python-based runtime.

Specifically, the image contains everything in the [base image](../base/README.md), plus:

* Python 3 and its dependencies.
* No shell and no support for ctypes

## Usage

The entrypoint of this image is set to "python", so this image expects users to supply a path to a .py file in the CMD.

See the Python [Hello World](../examples/python3/) directory for an example.
