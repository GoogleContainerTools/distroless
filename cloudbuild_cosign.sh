#!/bin/sh

set -o errexit
set -o xtrace


export KMS_VAL=gcpkms://projects/$PROJECT_ID/locations/global/keyRings/cosign/cryptoKeys/cosign

cosign version

# Get all images from 'images' file

while IFS= read -r line; do
  cosign sign -key $KMS_VAL $line
done < images

# Sign 'latest' images with cosign
for distro_suffix in "" -debian10 -debian11; do
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/static${distro_suffix}:nonroot
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/static${distro_suffix}:latest
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/static${distro_suffix}:debug-nonroot
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/static${distro_suffix}:debug

  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/base${distro_suffix}:nonroot
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/base${distro_suffix}:latest
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/base${distro_suffix}:debug-nonroot
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/base${distro_suffix}:debug
done

for distro_suffix in "" -debian10; do
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/cc${distro_suffix}:nonroot
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/cc${distro_suffix}:latest
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/cc${distro_suffix}:debug-nonroot
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/cc${distro_suffix}:debug

  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/python2.7${distro_suffix}:latest
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/python2.7${distro_suffix}:debug

  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/python3${distro_suffix}:nonroot
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/python3${distro_suffix}:latest
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/python3${distro_suffix}:debug-nonroot
  cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/python3${distro_suffix}:debug
done

cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/nodejs:latest
cosign sign -key $KMS_VAL gcr.io/$PROJECT_ID/nodejs:debug
