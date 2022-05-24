#!/bin/sh

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
  _image=$1
  _archs=$2
  _from_images=""

  for arch in $_archs; do
    _from_images="$_from_images $_image-$arch"
  done

  docker manifest create $_image $_from_images
  docker manifest push $_image
}

for distro_suffix in "" -debian10 -debian11; do
  docker_manifest gcr.io/$PROJECT_ID/static${distro_suffix}:nonroot "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/static${distro_suffix}:latest "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/static${distro_suffix}:debug-nonroot "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/static${distro_suffix}:debug "amd64 arm arm64 s390x ppc64le"

  docker_manifest gcr.io/$PROJECT_ID/base${distro_suffix}:nonroot "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/base${distro_suffix}:latest "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/base${distro_suffix}:debug-nonroot "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/base${distro_suffix}:debug "amd64 arm arm64 s390x ppc64le"

  docker_manifest gcr.io/$PROJECT_ID/cc${distro_suffix}:nonroot "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/cc${distro_suffix}:latest "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/cc${distro_suffix}:debug-nonroot "amd64 arm arm64 s390x ppc64le"
  docker_manifest gcr.io/$PROJECT_ID/cc${distro_suffix}:debug "amd64 arm arm64 s390x ppc64le"
done

# python node and java are debian11 only

for distro_suffix in "" -debian11; do
  docker_manifest gcr.io/$PROJECT_ID/python3${distro_suffix}:nonroot "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/python3${distro_suffix}:latest "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/python3${distro_suffix}:debug-nonroot "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/python3${distro_suffix}:debug "amd64 arm64"
done

for java_version in -base 11 17; do
  docker_manifest gcr.io/$PROJECT_ID/java${java_version}-debian11:latest "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/java${java_version}-debian11:nonroot "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/java${java_version}-debian11:debug "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/java${java_version}-debian11:debug-nonroot "amd64 arm64"
done

for distro_suffix in "" -debian11; do
  docker_manifest gcr.io/$PROJECT_ID/nodejs${distro_suffix}:latest "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/nodejs${distro_suffix}:debug "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/nodejs${distro_suffix}:18 "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/nodejs${distro_suffix}:18-debug "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/nodejs${distro_suffix}:16 "amd64 arm64"
  docker_manifest gcr.io/$PROJECT_ID/nodejs${distro_suffix}:16-debug "amd64 arm64"
done
