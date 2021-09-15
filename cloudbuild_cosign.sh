#!/busybox/sh

set -o errexit
set -o xtrace


cosign version

# Sign all images from 'images' file

cosign sign "$@" $(cat images)

# Sign 'latest' images with cosign
for distro_suffix in "" -debian10 -debian11; do
  cosign sign "$@" gcr.io/$PROJECT_ID/static${distro_suffix}:nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/static${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/static${distro_suffix}:debug-nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/static${distro_suffix}:debug

  cosign sign "$@" gcr.io/$PROJECT_ID/base${distro_suffix}:nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/base${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/base${distro_suffix}:debug-nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/base${distro_suffix}:debug
done

for distro_suffix in "" -debian10; do
  cosign sign "$@" gcr.io/$PROJECT_ID/cc${distro_suffix}:nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/cc${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/cc${distro_suffix}:debug-nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/cc${distro_suffix}:debug

  cosign sign "$@" gcr.io/$PROJECT_ID/python2.7${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/python2.7${distro_suffix}:debug

  cosign sign "$@" gcr.io/$PROJECT_ID/python3${distro_suffix}:nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/python3${distro_suffix}:latest
  cosign sign "$@" gcr.io/$PROJECT_ID/python3${distro_suffix}:debug-nonroot
  cosign sign "$@" gcr.io/$PROJECT_ID/python3${distro_suffix}:debug
done

cosign sign "$@" gcr.io/$PROJECT_ID/nodejs:latest
cosign sign "$@" gcr.io/$PROJECT_ID/nodejs:debug
