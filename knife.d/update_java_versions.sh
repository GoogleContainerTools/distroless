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
    local version=$(jq -r --arg jv "temurin-${java_version}-jre" '.packages.[] | select((.arch=="amd64") and (.name==$jv)) | .version | split(".") | .[0:3] | join(".")' private/repos/deb/trixie_adoptium.lock.json)
    local major_version=$(echo "$version" | cut -d. -f 1)
    sed -i -r -e "s/${major_version}\\.[0-9]+\\.[0-9]+/${version}/g" java/testdata/java${major_version}*debian13.yaml
  done
}
