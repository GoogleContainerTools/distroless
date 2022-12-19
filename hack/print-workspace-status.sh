#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail


cat <<EOF
COMMIT_SHA ${COMMIT_SHA:-no-commit-sha}
EOF
