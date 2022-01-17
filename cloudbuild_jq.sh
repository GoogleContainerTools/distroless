#!/bin/sh

set -o errexit
set -o xtrace

apt-get update
apt-get install -y jq

cd bazel-bin
tar -xvf all.tar
cd ..

# Get a list of all images
cat bazel-bin/manifest.json | jq -r [".[] | .RepoTags"] | jq 'flatten' | jq  .[] | sed 's/\"//g' > images
cat images
