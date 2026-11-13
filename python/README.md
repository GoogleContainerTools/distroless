# Documentation for `python/` (python-build-standalone)

## Image Contents

These images contain a minimal Linux, Python-based runtime built from a
[python-build-standalone](https://github.com/astral-sh/python-build-standalone)
prebuilt tarball instead of the Debian Python package.

Supported versions:

- Python 3.13 (`python3.13-debian13`)
- Python 3.14 (`python3.14-debian13`)

Each image contains everything in the [C/C++ base image](../cc/README.md),
plus a standalone CPython install under `/python`:

- `/python/bin/python3.X` (with `/python/bin/python` and `/python/bin/python3` symlinks)
- `/python/lib/python3.X/` (standard library)

Normal images contain no shell, include files, pip, ensurepip, or Tk GUI modules.
Debug variants inherit BusyBox from the base image. Install dependencies in a
builder stage and copy them into the runtime image.
Creating a virtual environment in the runtime image requires `venv --without-pip`.

python-build-standalone builds are relocatable, dynamically link only to glibc,
and include selected Debian runtime files from the base image.

## Usage

The entrypoint of these images is set to `python3.X`, so they expect users to
supply a path to a .py file in the CMD.

See the Python [Hello World](../examples/python3/) directory for an example.

### Compatibility

When using these images in a multi-stage build, use a build image with the same
Python version to avoid ABI-related errors. For example, when targeting
`python3.14-debian13`, use a `python:3.14-slim-trixie` (or python-build-standalone)
build stage.

When building virtual environments, note that the distroless Python path is
`/python/bin/python3.14`. To ensure your virtual environment's internal links
are correct, your build environment should match this path. If your build image
uses a different path, create a symlink during the build stage, e.g.:

```Dockerfile
RUN mkdir -p /python/bin && ln -s /usr/local/bin/python3.14 /python/bin/python3.14
```

### Shared libraries

PBS embeds many native libraries into Python. Their standard-library modules
work without separate shared objects. `ctypes.util.find_library()` cannot discover
these embedded libraries. Use a shared library's explicit path or soname when
loading a library with `ctypes.CDLL`.

## Provenance

Python comes from a [python-build-standalone](https://github.com/astral-sh/python-build-standalone)
prebuilt tarball (`cpython-3.X.Y+<release>-<triple>-unknown-linux-gnu-install_only_stripped.tar.gz`).
The exact release, versions, and SHA-256 digests are pinned in the extension
definition and updated via `knife update-python-archives`.
The image SBOM includes package metadata for the PBS archive. It does not inventory
native libraries embedded in that archive.

## Update contracts

Run `./knife update-python-archives` from the repository root. `--verbose` explains
pin changes; `--dry-run` checks release metadata without writing tracked files.
Python 3, jq, curl, and version-aware `sort` are required; Buildifier validates
generated Starlark when installed.

- The matrix in `config.bzl` defines required minors and architectures. Every
  architecture for a minor must have the same CPython version. Missing assets,
  invalid or duplicate digests fail before files are replaced. Bazel verifies
  archive checksums when downloading them.
- New stable minors above the oldest configured minor are added automatically,
  inheriting the highest configured minor's architectures. Beta/RC releases require
  an explicit matrix entry. Finals outrank their own RCs and betas. Removing a minor
  opts out of its prereleases; stable releases can add it again. Required minors
  are never silently removed when PBS stops publishing them.
- A release-tag change updates the pins even when CPython's patch version is unchanged.
  The updater also repairs changed checksum pins and repository visibility.
  A second successful run returns no changes.
- Archive pins, the matrix, and repository visibility are validated before
  replacement. Version testdata is updated afterward. Filesystem failures during
  replacement or testdata updates can leave a partial update; restore the affected
  files before retrying. Refresh and commit `MODULE.bazel.lock` with
  `bazel mod deps --lockfile_mode=update` after changing the extension.

The offline updater contracts run with `bazel test //python:all`.
Container structure tests are tagged `manual` and require Docker;
run the architecture-specific tests through `./knife test` or the CI workflow.
