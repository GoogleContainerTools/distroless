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

docker manifest create gcr.io/$PROJECT_ID/static:nonroot \
   gcr.io/$PROJECT_ID/static:nonroot-amd64 \
   gcr.io/$PROJECT_ID/static:nonroot-arm64 \
   gcr.io/$PROJECT_ID/static:nonroot-s390x \
   gcr.io/$PROJECT_ID/static:nonroot-ppc64le
docker manifest push gcr.io/$PROJECT_ID/static:nonroot

docker manifest create gcr.io/$PROJECT_ID/static:latest \
   gcr.io/$PROJECT_ID/static:latest-amd64 \
   gcr.io/$PROJECT_ID/static:latest-arm64 \
   gcr.io/$PROJECT_ID/static:latest-s390x \
   gcr.io/$PROJECT_ID/static:latest-ppc64le
docker manifest push gcr.io/$PROJECT_ID/static:latest

docker manifest create gcr.io/$PROJECT_ID/base:nonroot \
   gcr.io/$PROJECT_ID/base:nonroot-amd64 \
   gcr.io/$PROJECT_ID/base:nonroot-arm64 \
   gcr.io/$PROJECT_ID/base:nonroot-s390x \
   gcr.io/$PROJECT_ID/base:nonroot-ppc64le
docker manifest push gcr.io/$PROJECT_ID/base:nonroot

docker manifest create gcr.io/$PROJECT_ID/base:latest \
   gcr.io/$PROJECT_ID/base:latest-amd64 \
   gcr.io/$PROJECT_ID/base:latest-arm64 \
   gcr.io/$PROJECT_ID/base:latest-s390x \
   gcr.io/$PROJECT_ID/base:latest-ppc64le
docker manifest push gcr.io/$PROJECT_ID/base:latest

docker manifest create gcr.io/$PROJECT_ID/base:debug-nonroot \
   gcr.io/$PROJECT_ID/base:debug-nonroot-amd64 \
   gcr.io/$PROJECT_ID/base:debug-nonroot-arm64 \
   gcr.io/$PROJECT_ID/base:debug-nonroot-s390x \
   gcr.io/$PROJECT_ID/base:debug-nonroot-ppc64le
docker manifest push gcr.io/$PROJECT_ID/base:debug-nonroot

docker manifest create gcr.io/$PROJECT_ID/base:debug \
   gcr.io/$PROJECT_ID/base:debug-amd64 \
   gcr.io/$PROJECT_ID/base:debug-arm64 \
   gcr.io/$PROJECT_ID/base:debug-s390x \
   gcr.io/$PROJECT_ID/base:debug-ppc64le
docker manifest push gcr.io/$PROJECT_ID/base:debug

docker manifest create gcr.io/$PROJECT_ID/cc:latest \
   gcr.io/$PROJECT_ID/cc:latest-amd64 \
   gcr.io/$PROJECT_ID/cc:latest-arm64
docker manifest push gcr.io/$PROJECT_ID/cc:latest

docker manifest create gcr.io/$PROJECT_ID/cc:debug \
   gcr.io/$PROJECT_ID/cc:debug-amd64 \
   gcr.io/$PROJECT_ID/cc:debug-arm64
docker manifest push gcr.io/$PROJECT_ID/cc:debug


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
