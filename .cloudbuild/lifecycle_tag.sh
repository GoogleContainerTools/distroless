#!/usr/bin/env bash
set -o errexit -o nounset -o xtrace -o pipefail

BAZELISK_VERSION="1.27.0"
BAZELISK_SHA256="e1508323f347ad1465a887bc5d2bfb91cffc232d11e8e997b623227c6b32fb76"

GGCR_VERSION="0.20.7"
GGCR_SHA256="8ef3564d264e6b5ca93f7b7f5652704c4dd29d33935aff6947dd5adefd05953e"

# install gcrane
curl -fsSL "https://github.com/google/go-containerregistry/releases/download/v${GGCR_VERSION}/go-containerregistry_Linux_x86_64.tar.gz" -o ggcr.tar.gz
echo "${GGCR_SHA256} ggcr.tar.gz" | sha256sum --check
tar -xzf ggcr.tar.gz gcrane
chmod a+x gcrane
mv gcrane /usr/bin/gcrane # needs to be on path

# we need jq too
apt-get update
apt-get -y install jq

# install bazelisk (TODO: there's probably a better way to do this)
curl -fsSL "https://github.com/bazelbuild/bazelisk/releases/download/v${BAZELISK_VERSION}/bazelisk-linux-amd64" -o bazelisk
echo "${BAZELISK_SHA256} bazelisk" | sha256sum --check
chmod a+x bazelisk

echo "common --google_default_credentials" >> ~/.bazelrc
echo "common --announce_rc" >> ~/.bazelrc

./bazelisk run :attach_lifecycle_tags --config=release
