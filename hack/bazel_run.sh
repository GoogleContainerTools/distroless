#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

LANG=${LANG:-"base"}
TOPICS=${TOPICS:-"base debug"}
USERS=${TARGETS:-"root nonroot"}
ARCHS=${ARCHS:-"amd64 arm64 s390x"}
DISTROS=${DISTROS:-"debian9 debian10"}

for topic in ${TOPICS}; do
  for user in ${USERS}; do
    for distro in ${DISTROS}; do
      for arch in ${ARCHS}; do
        bazel run --host_force_python=PY2 //${LANG}:${topic}_${user}_${arch}_${distro}
      done
    done
  done
done