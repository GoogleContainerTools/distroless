#!/usr/bin/env bash

set -euxo pipefail

echo "REGISTRY: ${REGISTRY:=localhost:5000}"
echo "PROJECT_ID: ${PROJECT_ID:=jasper-d}"

export
export COSIGN_EXPERIMENTAL=1


bazel run --stamp //:publish

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

docker image ls

for dotnet_version in 6.0 7.0; do
  for image in ${multiArchImages[@]}; do
    echo "Image is $image"
    image=${image/REGISTRY/$REGISTRY}
    image=${image/PROJECT_ID/$PROJECT_ID}
    image=${image/DOTNET_VERSION/$dotnet_version}
    docker_manifest $image "amd64 arm64"
  done
done

docker image ls

cosign version


for dotnet_version in 6.0 7.0; do

  for image in ${multiArchImages[@]}; do
    echo "Image is $image"
    image=${image/REGISTRY/$REGISTRY}
    image=${image/PROJECT_ID/$PROJECT_ID}
    image=${image/DOTNET_VERSION/$dotnet_version}
    cosign sign --upload=false --verbose --recursive $image

    #cosign verify $image
    #cosign verify "$image-amd64"
    #cosign verify "$image-arm64"
  done
done
