set -o pipefail -o errexit -o nounset

# Copyright 2024 Google Inc. All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# a collection of functions to use when updating java archives from the knife utility


function update_java_versions_debian13() {
  local java_versions=("17" "21" "25")

  for java_version in "${java_versions[@]}"; do
    local jre_version=$(jq -r --arg jv "temurin-${java_version}-jre" '.packages.[] | select((.arch=="amd64") and (.name==$jv)) | .version | split(".") | .[0:3] | join(".")' private/repos/deb/trixie_adoptium.lock.json)
    if [[ -n "$jre_version" && "$jre_version" != "null" ]]; then
      sed -i -r -e "s/${java_version}\\.[0-9]+\\.[0-9]+/${jre_version}/g" "java/testdata/java${java_version}_debian13.yaml"
    fi

    local jdk_version=$(jq -r --arg jv "temurin-${java_version}-jdk" '.packages.[] | select((.arch=="amd64") and (.name==$jv)) | .version | split(".") | .[0:3] | join(".")' private/repos/deb/trixie_adoptium.lock.json)
    if [[ -n "$jdk_version" && "$jdk_version" != "null" ]]; then
      sed -i -r -e "s/${java_version}\\.[0-9]+\\.[0-9]+/${jdk_version}/g" "java/testdata/java${java_version}_debug_debian13.yaml"
    fi
  done
}
