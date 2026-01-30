# Documentation for `gcr.io/distroless/python3`

## Image Contents

This image contains a minimal Linux, Python-based runtime.

Specifically, the image contains everything in the [base image](../base/README.md), plus:

* Python 3 and its dependencies.
    * 3.11 on debian 12
    * 3.13 on debian 13
* No shell
* No support for ldconfig based functions like `ctypes.util.find_library()` (potential [workaround](../../../issues/1854))


## Usage

The entrypoint of this image is set to "python", so this image expects users to supply a path to a .py file in the CMD.

See the Python [Hello World](../examples/python3/) directory for an example.
