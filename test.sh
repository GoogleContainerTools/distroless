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

# Bazel build and test
bazel clean --curses=no
bazel build --curses=no //...
bazel test --curses=no --test_output=errors --test_timeout=900 //...
