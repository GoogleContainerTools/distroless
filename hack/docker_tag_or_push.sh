#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

LANG=${LANG:-"base"}
TOPICS=${TOPICS:-"static base debug"}
USERS=${TARGETS:-"root nonroot"}
ARCHS=${ARCHS:-"amd64 arm64 s390x"}
DISTROS=${DISTROS:-"debian9 debian10"}

HUB=${HUB:-localhost:5000/distroless}

COMMIT_SHA=${COMMIT_SHA:-}

PUSH=${PUSH:-}
MANIFEST=${MANIFEST:-}

docker_tag_or_push() {
  bazel_image=$1
  image_name=$2
  image_tag=$3


  if [[ -n ${COMMIT_SHA} ]]; then
    docker tag ${bazel_image} ${HUB}/${image_name}:${COMMIT_SHA}-${image_tag}
  fi
  docker tag ${bazel_image} ${HUB}/${image_name}:${image_tag}

  if [[ -n ${PUSH} ]]; then
      if [[ -n ${COMMIT_SHA} ]]; then
        docker push ${HUB}/${image_name}:${COMMIT_SHA}-${image_tag}
      fi
      docker push ${HUB}/${image_name}:${image_tag}
  fi
}

get_image_base() {
    image_base=${LANG}

   if [[ ${topic} == "static" ]]; then
      image_base=static
   fi

   echo ${image_base}
}

get_tag_base() {
   tag_base=latest

  if [[ ${topic} != "static" ]]; then
    if [[ ${topic} != "${LANG}" ]]; then
      tag_base=${topic}
    fi
  fi

  if [[ ${user} != "root" ]]; then
     if [[ ${tag_base} != "latest" ]]; then
        tag_base=${tag_base}-${user}
     else
       tag_base=${user}
     fi
  fi

  echo ${tag_base}
}

docker_manifest() {
  image=$1
  tag=$2
  from_images=""

  for arch in ${ARCHS}; do
    from_images="${from_images} ${HUB}/${image}:${tag}-${arch}"
  done

  docker manifest create ${HUB}/${image}:${tag} ${from_images}
  docker manifest push ${HUB}/${image}:${tag}
}

docker_manifest_all() {
  image=$1
  tag=$2

  if [[ -n ${COMMIT_SHA} ]]; then
    docker_manifest ${image} ${COMMIT_SHA}-${tag}
  fi
  docker_manifest ${image} ${tag}
}

for topic in ${TOPICS}; do
  for user in ${USERS}; do
    for distro in ${DISTROS}; do
      image_base=$(get_image_base)
      tag_base=$(get_tag_base)

      for arch in ${ARCHS}; do
        bazel_image=bazel/${LANG}:${topic}_${user}_${arch}_${distro}

        if [[ ${distro} == "debian9" ]]; then
          docker_tag_or_push ${bazel_image} ${image_base} ${tag_base}-${arch}
        fi
        docker_tag_or_push ${bazel_image} ${image_base}-${distro} ${tag_base}-${arch}
      done

      if [[ ${distro} == "debian9" ]]; then
        docker_manifest_all ${image_base} ${tag_base}
      fi
      docker_manifest_all ${image_base}-${distro} ${tag_base}
    done
  done
done



