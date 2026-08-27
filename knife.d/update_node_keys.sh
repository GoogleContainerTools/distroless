#!/usr/bin/env bash
# Copyright 2026 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Regenerates knife.d/nodejs_keys.asc from nodejs/release-keys (active keys only).
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="${SCRIPT_DIR}/nodejs_keys.asc"
WORKDIR="$(mktemp -d)"; GNUPGHOME="$(mktemp -d)"; chmod 700 "${GNUPGHOME}"; export GNUPGHOME
trap 'rm -rf "${WORKDIR}" "${GNUPGHOME}"' EXIT
git clone --depth 1 https://github.com/nodejs/release-keys "${WORKDIR}/release-keys"
cp "${WORKDIR}/release-keys/gpg-only-active-keys/"* "${GNUPGHOME}/"
gpg --armor --export > "${OUT}"
echo "Wrote ${OUT}"
