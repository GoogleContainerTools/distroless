# Documentation for `gcr.io/distroless/nodejs`

## Image Contents

These images contain a minimal Linux, Node.js-based runtime. The supported versions match the [Node.js LTS releases](https://nodejs.org/en/about/releases/).

Specifically, these images contain everything in the [base image](../../base/README.md), plus one of:

- Node.js v10 (`gcr.io/distroless/nodejs:10`) and its dependencies.
- Node.js v12 (`gcr.io/distroless/nodejs:12`) and its dependencies.
- Node.js v14 (`gcr.io/distroless/nodejs:14`) and its dependencies.

**Note:** the `latest` tag maps to Node.js v10 for backwards compatibility and is now deprecated. Once Node.js v10 reaches EOL on 2021-04-30, the `latest` tag will be removed to avoid confusion. Users of these images should explicitly set the LTS version tag they wish to use.

## Usage

The entrypoint of this image is set to "node", so this image expects users to supply a path to a .js file in the CMD.

See the Node.js [Hello World](../../examples/nodejs/) directory for an example.
