#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# Do not error if the user doesn't have gcloud installed.
if [ -z "${PROJECT_ID:-}" ]; then
  if which gcloud > /dev/null; then
    PROJECT_ID="$(gcloud config get-value core/project)"
  else
    PROJECT_ID="NO-PROJECT"
  fi
fi

cat <<EOF
PROJECT_ID ${PROJECT_ID}
COMMIT_SHA ${COMMIT_SHA:-no-commit-sha}
REGISTRY ${REGISTRY:-gcr.io}
EOF
