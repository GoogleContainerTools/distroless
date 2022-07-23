#!/usr/bin/env bash

set -euxo pipefail

export PROJECT_ID=jasper-d
export REGISTRY=localhost:5000

#bazel run --stamp //:publish

#bazel build --stamp all.tar

sed -i 's/^{/{"experimental": "enabled",/g' ~/.docker/config.json

multiArchImages=(
    "REGISTRY/PROJECT_ID/distroless-dotnet-DOTNET_VERSION_slim:debug_nonroot"
    "REGISTRY/PROJECT_ID/distroless-dotnet-DOTNET_VERSION_full:debug_nonroot"
    "REGISTRY/PROJECT_ID/distroless-dotnet-DOTNET_VERSION_slim:nonroot"
    "REGISTRY/PROJECT_ID/distroless-dotnet-DOTNET_VERSION_full:nonroot"
    "REGISTRY/PROJECT_ID/distroless-dotnet-DOTNET_VERSION_slim:debug_root"
    "REGISTRY/PROJECT_ID/distroless-dotnet-DOTNET_VERSION_full:debug_root"
    "REGISTRY/PROJECT_ID/distroless-dotnet-DOTNET_VERSION_slim:root"
    "REGISTRY/PROJECT_ID/distroless-dotnet-DOTNET_VERSION_full:root"
)

docker_manifest() {
  _image=$1
  _archs=$2
  _from_images=""

  echo "Got image: $_image"
  for arch in $_archs; do
    # Remove existing stale manifest if any
    docker manifest rm $_image || true
    _from_images="$_from_images $_image-$arch"
  done
  
  docker manifest create --insecure $_image $_from_images
  docker manifest push --insecure $_image
}

for dotnet_version in 6.0 7.0; do
  docker image ls
  for image in ${multiArchImages[@]}; do
    echo "Image is $image"
    image=${image/REGISTRY/$REGISTRY}
    image=${image/PROJECT_ID/$PROJECT_ID}
    image=${image/DOTNET_VERSION/$dotnet_version}
    docker_manifest $image "amd64 arm64"
  done
done

cosign version

for dotnet_version in 6.0 7.0; do
  docker image ls
  export COSIGN_PASSWORD=""
  for image in ${multiArchImages[@]}; do
    echo "Image is $image"
    image=${image/REGISTRY/$REGISTRY}
    image=${image/PROJECT_ID/$PROJECT_ID}
    image=${image/DOTNET_VERSION/$dotnet_version}
    cosign sign --fulcio-url "" --key cosign.key --recursive $image

    cosign verify --enforce-sct --key cosign.pub $image
    cosign verify --enforce-sct --key cosign.pub "$image-amd64"
    cosign verify --enforce-sct --key cosign.pub "$image-arm64"
  done
done
