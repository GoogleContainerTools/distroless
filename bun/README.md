# Documentation for `gcr.io/distroless/nodejs`

## Image Contents

These images contain a minimal Linux, Bun-based runtime. The supported versions match the [Bun releases](https://github.com/oven-sh/bun/releases).

Specifically, these images contain everything in the [base image](../base/README.md), plus one of:

- Bun v1 (`gcr.io/distroless/bun-debian12`) and its dependencies.

## Usage

The entrypoint of this image is set to "bun", so this image expects users to supply a path to a .js or .ts file in the CMD.

See the Bun [Hello World](../examples/bun/) directory for an example.
