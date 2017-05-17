#!/bin/bash

files=$(buildifier -mode=check $(find . -name 'BUILD*' -o -name '*.bzl' -type f))
if [ $? -ne 0 ]; then
  exit 1
fi

if [[ $files ]]; then
  echo "Run 'buildifier -mode fix \$(find . -name BUILD -o -name '*.bzl' -type f)' to fix formatting"
  exit 1
fi
