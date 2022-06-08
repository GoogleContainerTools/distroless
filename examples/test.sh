#!/usr/bin/env bash

set -euxo pipefail

for d in examples/*; do
	# Skip non-directories.
	if [[ ! -d "$d" ]]; then continue; fi

	# Build the Dockerfile and run the image, or fail.
	$(docker build -t $d $d/ && docker run $d) || $(echo "$d failed" && exit 1)
done
