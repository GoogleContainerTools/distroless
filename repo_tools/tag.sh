#!/usr/bin/env bash
set -euo pipefail

trap 'echo "Ctrl+C caught, exiting..."; exit 130' INT

function exec_tag() {
  local image=$1
  local tag_prefix=$2
  local -n hashes=$3
  local count=0
  local total="${#hashes[@]}"
  for h in "${hashes[@]}"; do
    local sha256="${h#sha256:}"
    local img_path="${image}@${h}"
    local tag="${tag_prefix}${sha256}"
    echo -n "tagging $img_path with $tag "
    if [[ ${dry_run} == false ]]; then
      gcrane tag "$img_path" "$tag" && echo "SUCCESS $((++count))/$total" || { echo "FAILED"; exit 1; }
    else
      echo "DRY_RUN"
    fi
  done
}

function tag_update() {
  local tag_prefix="update-available-"
  local image="$1"

  local NOW
  local images_json

  NOW=$(date +%s000)
  images_json=$(gcrane ls "$image" --json)

  # get all hashes for images that have no tags (or just the commit hash tag)
  # jq behavior for all(test(pattern)) matches the empty list []
  # or are older than 2 days (we don't want to accidentally mess with any
  # ongoing builds)
  readarray -t targets < <(echo "$images_json" | jq -er --arg now "$NOW" '
    .manifest | to_entries | sort_by(.value.timeUploadedMs|tonumber) | .[] | select(
      (.value.tag // [] | all(test(".*-[a-f0-9]{40}$|^[a-f0-9]{40}$")))
      and
      (($now | tonumber) - (.value.timeUploadedMs | tonumber) > 172800000)
    ) | .key
  ');

  echo "tagging ${#targets[@]} images of $image"

  exec_tag "$image" "$tag_prefix" targets
}

function tag_deprecate() {
  local targets
  local tag_prefix="deprecated-public-image-"
  local image=$1

  local images_json
  images_json=$(gcrane ls "$image" --json)

  # get all hashes for all images don't have the deprecated tag
  readarray -t targets < <(echo "$images_json" | jq -er '
    .manifest | to_entries | sort_by(.value.timeUploadedMs|tonumber) | .[] | select(
      .value.tag // [] | all(test("deprecated-public-image-[a-f0-9]{64}$") | not)
    ) | .key
  ');

  echo "tagging ${#targets[@]} images of $image"
  echo "disabled for now, edit out comment"
  # exec_tag "$image" "$tag_prefix" targets
}

dry_run=${DRY_RUN:-true}
if [[ "${dry_run}" != "true" && "${dry_run}" != "false" ]]; then
  echo "Error: DRY_RUN needs to have value (true|false)."
  exit 1
fi

function tag() {
  local tag_mode=$1
  local image=$2
  case "$tag_mode" in
    update)
      tag_update "$image"
      ;;
    deprecate)
      tag_deprecate "$image"
      ;;
    *)
      echo "wtf?"
      exit 1
  esac
}

function usage() {
  echo "USAGE: $1 [deprecate|update] <image>" >&2
  exit 1
}

case "${1:-"~~nocmd"}" in
  update | deprecate)
    if [[ "$#" -ne 2 ]]; then
      usage "$0"
    fi
    tag "$@"
    ;;
  ~~nocmd | *)
    usage "$0"
    ;;
esac
