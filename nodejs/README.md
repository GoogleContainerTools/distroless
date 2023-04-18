# Documentation for `gcr.io/distroless/nodejs`

## Image Contents

These images contain a minimal Linux, Node.js-based runtime. The supported versions match the [Node.js LTS releases](https://nodejs.org/en/about/releases/).

Specifically, these images contain everything in the [base image](../base/README.md), plus one of:

- Node.js v16 (`gcr.io/distroless/nodejs16-debian11`) and its dependencies.
- Node.js v18 (`gcr.io/distroless/nodejs18-debian11`) and its dependencies.
- Node.js v20 (`gcr.io/distroless/nodejs20-debian11`) and its dependencies.

## Usage

The entrypoint of this image is set to "node", so this image expects users to supply a path to a .js file in the CMD.

See the Node.js [Hello World](../examples/nodejs/) directory for an example.
