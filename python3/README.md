# Documentation for `gcr.io/distroless/python3`

## Image Contents

This image contains a minimal Linux, Python-based runtime.

Specifically, the image contains everything in the [base image](../base/README.md), plus:

* Python 3.13 and its dependencies.
* No shell

## ldconfig and ctypes

We include a pre-generated `ld.so.cache` to support user/framework calls to `ctypes.util.find_library()`. If a
user modifies the image by adding a new library, it will not be found in the cache without calling ldconfig to
refresh the cache.

## Usage

The entrypoint of this image is set to "python", so this image expects users to supply a path to a .py file in the CMD.

See the Python [Hello World](../examples/python3/) directory for an example.

### Compatibility

If you are using distroless Python images in a multi-stage build, it is recommended that you use a compatible build
image to prevent ABI-related errors. For example, when targeting `python3-debian13`, you should use `python:3.13-slim-trixie`
for your build stage.

When building virtual environments, note that the distroless Python path is `/usr/bin/python`. To ensure that your
virtual environment's internal links are correct, your build environment should match this path. If your build image
uses a different path (like `/usr/local/bin/python`), you can create a symlink during the build stage as shown
in [this example](../examples/python3-requirements/Dockerfile).
