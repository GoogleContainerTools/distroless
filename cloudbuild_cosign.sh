#!/bin/sh

set -o errexit
set -o xtrace


export KMS_VAL=gcpkms://projects/$PROJECT_ID/locations/global/keyRings/cosign/cryptoKeys/cosign
# TODO (priyawadhwa@): Store signatures in distroless repo once we are confident this works
export COSIGN_REPOSITORY=gcr.io/priya-wadhwa/test


# Sign images with cosign
for distro_suffix in "" -debian9 -debian10; do
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/static${distro_suffix}:nonroot
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/static${distro_suffix}:latest

  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/base${distro_suffix}:nonroot
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/base${distro_suffix}:latest
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/base${distro_suffix}:debug-nonroot
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/base${distro_suffix}:debug

  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/cc${distro_suffix}:nonroot
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/cc${distro_suffix}:latest
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/cc${distro_suffix}:debug-nonroot
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/cc${distro_suffix}:debug

  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/python2.7${distro_suffix}:latest
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/python2.7${distro_suffix}:debug

  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/python3${distro_suffix}:nonroot
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/python3${distro_suffix}:latest
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/python3${distro_suffix}:debug-nonroot
  cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/python3${distro_suffix}:debug
done

cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/nodejs:latest
cosign sign -kms $KMS_VAL -a commit=$COMMIT_SHA gcr.io/$PROJECT_ID/nodejs:debug
