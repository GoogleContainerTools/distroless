#!/bin/sh

set -o errexit
set -o xtrace


export KMS_VAL=gcpkms://projects/$PROJECT_ID/locations/global/keyRings/cosign/cryptoKeys/cosign

cosign version

# Get all images from 'images' file

while IFS= read -r line; do
  cosign sign -key $KMS_VAL $line
done < images

