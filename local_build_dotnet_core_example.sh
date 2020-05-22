#!/usr/bin/env bash

set -o errexit
set -o xtrace

# ----------------------------------------------------------------------

GIT_ROOT_DIR="$(git rev-parse --show-toplevel)"
echo "\${GIT_ROOT_DIR}: ${GIT_ROOT_DIR}"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "\${SCRIPT_DIR}: ${SCRIPT_DIR}"

IMAGE_TAG='distroless/examples/dotnet/core:latest'

# ----------------------------------------------------------------------

echo Option 1: Build Container Image Locally

cd ${GIT_ROOT_DIR}/examples/dotnet_core

docker build \
    --tag "${IMAGE_TAG}" \
    .

docker run \
    --rm \
    "${IMAGE_TAG}"

cd "${GIT_ROOT_DIR}"

# ----------------------------------------------------------------------

echo Option 2: Build Container Image Locally with Bazel

cd ${GIT_ROOT_DIR}/examples/dotnet_core/

# RID is short for Runtime IDentifier.
# RID values are used to identify target platforms where the application runs.
# https://docs.microsoft.com/en-us/dotnet/core/rid-catalog
# https://github.com/dotnet/runtime/blob/master/src/libraries/pkg/Microsoft.NETCore.Platforms/runtime.json

# dotnet restore \
#     --runtime osx-x64 \
#     && dotnet publish \
#     --configuration Release \
#     --runtime osx-x64

# dotnet restore \
#     --runtime ubuntu.14.04-x64 \
#     && dotnet publish \
#     --configuration Release \
#     --runtime ubuntu.14.04-x64

dotnet restore \
&& dotnet publish \
    --configuration Release

dotnet \
    bin/Release/netcoreapp3.1/Hello.dll

cd "${GIT_ROOT_DIR}"

bazel build \
    --curses=no \
    --host_force_python=PY2 \
    //examples/dotnet_core:hello

bazel run \
    --curses=no \
    --host_force_python=PY2 \
    //examples/dotnet_core:hello

bazel test \
    --curses=no \
    --host_force_python=PY2 \
    //examples/dotnet_core:hello_test
