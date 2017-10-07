#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [ -z "${PROJECT_ID:-}" ]; then
  PROJECT_ID="$(gcloud config get-value core/project)"
fi

cat <<EOF
PROJECT_ID ${PROJECT_ID}
EOF
