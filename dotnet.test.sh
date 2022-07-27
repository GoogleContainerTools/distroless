#!/usr/bin/env bash

set -euxo pipefail

bazel test \
  --curses=no \
  --test_output=all \
  --test_timeout=900 \
   $(bazel query 'attr("tags", "manual", "//base/...")') 

bazel test \
  --curses=no \
  --test_output=errors \
  --test_timeout=900 \
  //experimental/dotnet/...

bazel test \
  --curses=no \
  --test_output=errors \
  --test_timeout=900 \
  --discard_analysis_cache \
  $(bazel query 'attr("tags", "amd64", "//experimental/dotnet/...")')

# These run with QEMU emulation, we limit them to 1 at a time
bazel test \
  --curses=no \
  --test_output=errors \
  --test_timeout=900 \
  --jobs=6 \
  $(bazel query 'attr("tags", "arm64", "//experimental/dotnet/...")')
