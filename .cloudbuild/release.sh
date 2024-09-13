#!/usr/bin/env bash
set -o errexit -o xtrace -o pipefail

# setup remote cache
curl -fsSL https://github.com/buchgr/bazel-remote/releases/download/v2.4.0/bazel-remote-2.4.0-linux-x86_64 -o bazel-remote
echo '717a44dd526c574b0a0edda1159f5795cc1b2257db1d519280a3d7a9c5addde5 bazel-remote' | sha256sum --check
chmod +x bazel-remote
mkdir .logs
./bazel-remote --max_size 8 --dir ~/.cache/bazel-remote --experimental_remote_asset_api --grpc_address 0.0.0.0:4700 --gcs_proxy.bucket $REMOTE_CACHE_GCS --gcs_proxy.use_default_credentials > .logs/bazel-remote.log 2>&1 &

# install bazel
VERSION=$(cat .bazelversion)
apt-get install "bazel-${VERSION}"
ln -sf "/usr/bin/bazel-${VERSION}" /usr/bin/bazel

# setup remote caching and remote asset API.
echo "common --remote_cache=grpc://0.0.0.0:4700" >> ~/.bazelrc
echo "common --experimental_remote_downloader=grpc://0.0.0.0:4700" >> ~/.bazelrc
echo "common --google_default_credentials" >> ~/.bazelrc
echo "common --announce_rc" >> ~/.bazelrc

for i in $(seq 5); do 
    bazel cquery 'kind(merge_providers, deps(kind(oci_image, ...)))' --output=label --config=release && break || sleep 20;
done
bazel run :sign_and_push --config=release -- --keyless $KEYLESS
