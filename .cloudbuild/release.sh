#!/usr/bin/env bash
set -o errexit -o xtrace -o pipefail

# setup remote cache
curl -fsSL https://github.com/buchgr/bazel-remote/releases/download/v2.4.0/bazel-remote-2.4.0-linux-x86_64 -o bazel-remote
echo '717a44dd526c574b0a0edda1159f5795cc1b2257db1d519280a3d7a9c5addde5 bazel-remote' | sha256sum --check
chmod +x bazel-remote
mkdir .logs
./bazel-remote --max_size 8 --dir ~/.cache/bazel-remote --experimental_remote_asset_api --grpc_address 0.0.0.0:4700 --gcs_proxy.bucket $REMOTE_CACHE_GCS --gcs_proxy.use_default_credentials > .logs/bazel-remote.log 2>&1 &

# install bazelisk (TODO: there's probably a better way to do this)
curl -fsSL https://github.com/bazelbuild/bazelisk/releases/download/v1.21.0/bazelisk-linux-amd64 -o bazelisk
echo '655a5c675dacf3b7ef4970688b6a54598aa30cbaa0b9e717cd1412c1ef9ec5a7 bazelisk' | sha256sum --check
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
