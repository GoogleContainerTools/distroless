#!/bin/bash

set -o errexit
set -o xtrace

# Publish manifest lists second, after all of the binary material
# has been uploaded, so that it is fast.  We want fast because enabling
# the experimental features in docker changes ~/.docker/config.json, which
# GCB periodically tramples.
#
# Enable support for 'docker manifest create'
# https://docs.docker.com/engine/reference/commandline/manifest_create/
sed -i 's/^{/{"experimental": "enabled",/g' ~/.docker/config.json

docker_manifest() {
  local image=$1
  local archs=$2
  local from_images=""

  for arch in $archs; do
    from_images="$from_images $image-$arch"
  done

  docker manifest create $image $from_images
  docker manifest push $image
}

for distro_suffix in "" -debian9 -debian10; do
  docker_manifest gcr.io/$PROJECT_ID/static${distro_suffix}:nonroot "amd64 arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/static${distro_suffix}:latest "amd64 arm64 s390x ppc64le"

  docker_manifest gcr.io/$PROJECT_ID/base${distro_suffix}:nonroot "amd64 arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/base${distro_suffix}:latest "amd64 arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/base${distro_suffix}:debug-nonroot "amd64 arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/base${distro_suffix}:debug "amd64 arm64 s390x ppc64le"

  docker_manifest gcr.io/$PROJECT_ID/cc${distro_suffix}:latest "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/cc${distro_suffix}:debug "amd64 arm64"
done

docker manifest create gcr.io/$PROJECT_ID/python3:nonroot \
   gcr.io/$PROJECT_ID/python3:nonroot-amd64 \
   gcr.io/$PROJECT_ID/python3:nonroot-arm64
docker manifest push gcr.io/$PROJECT_ID/python3:nonroot

docker manifest create gcr.io/$PROJECT_ID/python3:latest \
   gcr.io/$PROJECT_ID/python3:latest-amd64 \
   gcr.io/$PROJECT_ID/python3:latest-arm64
docker manifest push gcr.io/$PROJECT_ID/python3:latest

docker manifest create gcr.io/$PROJECT_ID/python3:debug-nonroot \
   gcr.io/$PROJECT_ID/python3:debug-nonroot-amd64 \
   gcr.io/$PROJECT_ID/python3:debug-nonroot-arm64
docker manifest push gcr.io/$PROJECT_ID/python3:debug-nonroot

docker manifest create gcr.io/$PROJECT_ID/python3:debug \
   gcr.io/$PROJECT_ID/python3:debug-amd64 \
   gcr.io/$PROJECT_ID/python3:debug-arm64
docker manifest push gcr.io/$PROJECT_ID/python3:debug

docker manifest create gcr.io/$PROJECT_ID/python2.7:latest \
   gcr.io/$PROJECT_ID/python2.7:latest-amd64 \
   gcr.io/$PROJECT_ID/python2.7:latest-arm64
docker manifest push gcr.io/$PROJECT_ID/python2.7:latest

docker manifest create gcr.io/$PROJECT_ID/python2.7:debug \
   gcr.io/$PROJECT_ID/python2.7:debug-amd64 \
   gcr.io/$PROJECT_ID/python2.7:debug-arm64
docker manifest push gcr.io/$PROJECT_ID/python2.7:debug

docker manifest create gcr.io/$PROJECT_ID/nodejs:latest \
   gcr.io/$PROJECT_ID/nodejs:latest-amd64 \
   gcr.io/$PROJECT_ID/nodejs:latest-arm64
docker manifest push gcr.io/$PROJECT_ID/nodejs:latest

docker manifest create gcr.io/$PROJECT_ID/nodejs:debug \
   gcr.io/$PROJECT_ID/nodejs:debug-amd64 \
   gcr.io/$PROJECT_ID/nodejs:debug-arm64
docker manifest push gcr.io/$PROJECT_ID/nodejs:debug
