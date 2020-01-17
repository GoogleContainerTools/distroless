# Documentation for `gcr.io/distroless/nodejs`

## Image Contents

This image contains a minimal Linux, Node.js-based runtime.

Specifically, the image contains everything in the [base image](../../base/README.md), plus:

- Node.js v10.16.3 and its dependencies.

## Usage

The entrypoint of this image is set to "node", so this image expects users to supply a path to a .js file in the CMD.

See the Node.js [Hello World](../../examples/nodejs/) directory for an example.
