#!/usr/bin/env bash

set -euxo pipefail

# bazel clean --curses=no

bazel build \
  --curses=no \
  //experimental/dotnet/test-binaries/...

bazel build \
  --curses=no \
  //experimental/dotnet/...
