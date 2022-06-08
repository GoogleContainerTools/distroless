#!/usr/bin/env bash

set -euo pipefail

for d in examples/*; do
	# Skip non-directories.
	if [[ ! -d "$d" ]]; then continue; fi

	# Skip if the directory doesn't have a Dockerfile.
	if [[ ! -f $d/Dockerfile ]]; then continue; fi

	# Skip these non-working examples.
	if [[ $d == "examples/cc" ]]; then continue; fi

	# Build the Dockerfile and run the image, or fail.
	echo ====================================
	echo = building $d
	echo ====================================
	docker build -t $d ./$d/
	docker run $d
done
