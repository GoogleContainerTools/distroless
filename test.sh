#!/bin/bash

# Copyright 2017 Google Inc. All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o xtrace

# Linting
buildifier -mode=fix $(find . -name 'BUILD*' -o -name 'WORKSPACE*' -o -name '*.bzl' -type f)
find . -name "*.py" | xargs pylint --disable=R,C

# Make sure python points to python3
PYTHON_VERSION=$(python --version)
if [[ ! $PYTHON_VERSION == Python\ 3* ]];
then
  echo "python must point to a python3, currently points to $(readlink -f "$(which python)")"
  echo "maybe run: update-alternatives --install /usr/bin/python python /usr/bin/python3"
  exit 1
fi

# Bazel build and test
bazel clean --curses=no

bazel build --curses=no //...
# Run all tests not tagged as "manual"
bazel test --curses=no --test_output=errors --test_timeout=900 //...
# Run all tests tagged with "amd64"
bazel test --curses=no --test_output=errors --test_timeout=900 $(bazel query 'attr("tags", "amd64", "//...")')
