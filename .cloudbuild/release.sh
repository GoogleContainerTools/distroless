#!/usr/bin/env bash
set -o errexit -o xtrace -o pipefail

BAZEL_REMOTE_VERSION="2.6.1"
BAZEL_REMOTE_SHA256="025d53aeb03a7fdd4a0e76262a5ae9eeee9f64d53ca510deff1c84cf3f276784"
BAZELISK_VERSION="1.27.0"
BAZELISK_SHA256="e1508323f347ad1465a887bc5d2bfb91cffc232d11e8e997b623227c6b32fb76"

# setup remote cache
curl -fsSL "https://github.com/buchgr/bazel-remote/releases/download/v${BAZEL_REMOTE_VERSION}/bazel-remote-${BAZEL_REMOTE_VERSION}-linux-amd64" -o bazel-remote
echo "${BAZEL_REMOTE_SHA256} bazel-remote" | sha256sum --check
chmod +x bazel-remote
mkdir .logs
./bazel-remote --max_size 8 --dir ~/.cache/bazel-remote --experimental_remote_asset_api --grpc_address 0.0.0.0:4700 --gcs_proxy.bucket $REMOTE_CACHE_GCS --gcs_proxy.use_default_credentials > .logs/bazel-remote.log 2>&1 &

# install bazelisk (TODO: there's probably a better way to do this)
curl -fsSL "https://github.com/bazelbuild/bazelisk/releases/download/v${BAZELISK_VERSION}/bazelisk-linux-amd64" -o bazelisk
echo "${BAZELISK_SHA256} bazelisk" | sha256sum --check
chmod a+x bazelisk

# setup remote caching and remote asset API.
echo "common --remote_cache=grpc://0.0.0.0:4700" >> ~/.bazelrc
echo "common --experimental_remote_downloader=grpc://0.0.0.0:4700" >> ~/.bazelrc
echo "common --google_default_credentials" >> ~/.bazelrc
echo "common --announce_rc" >> ~/.bazelrc

for i in $(seq 5); do 
    ./bazelisk cquery 'kind(merge_providers, deps(kind(oci_image, ...)))' --output=label --config=release && break || sleep 20;
done
./bazelisk run :sign_and_push --config=release -- --keyless $KEYLESS
