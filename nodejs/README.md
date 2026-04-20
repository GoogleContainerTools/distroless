# Documentation for `gcr.io/distroless/nodejs`

## Image Contents

These images contain a minimal Linux, Node.js-based runtime. The supported versions match the [Node.js LTS releases](https://nodejs.org/en/about/previous-releases).

Specifically, these images contain everything in the [cc image](../cc/README.md), plus one of:

- Node.js v20 (`gcr.io/distroless/nodejs20-debian13`) and its dependencies.
- Node.js v22 (`gcr.io/distroless/nodejs22-debian13`) and its dependencies.
- Node.js v24 (`gcr.io/distroless/nodejs24-debian13`) and its dependencies.

## Usage

The entrypoint of this image is set to "node", so this image expects users to supply a path to a .js file in the CMD.

See the Node.js [Hello World](../examples/nodejs/) directory for an example.
