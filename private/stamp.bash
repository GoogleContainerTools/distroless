#!/usr/bin/env bash
set -o pipefail -o errexit -o nounset

# Do not error if the user doesn't have gcloud installed.
if [ -z "${PROJECT_ID:-}" ]; then
  if which gcloud > /dev/null; then
    PROJECT_ID="$(gcloud config get-value core/project)"
  else
    # some registries don't allow uppercase chars. we'll use lowercase ones to get meaningful error messages.
    PROJECT_ID="no-project"
  fi
fi

echo "PROJECT_ID ${PROJECT_ID}"
echo "COMMIT_SHA ${COMMIT_SHA:-no-commit-sha}"
echo "REGISTRY ${REGISTRY:-gcr.io}"