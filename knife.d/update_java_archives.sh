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

function get_java_version() {
  grep "#VERSION " "./private/repos/java_temurin/java_21.MODULE.bazel" | cut -d" " -f2
}

function underscore_encode() {
  echo "${1/\+/_}"
}

function generate_java_archives() {
  : "${1:?Error: java major version required}"
  local releases latest_release release_name version plain_version archs archs_deb variants

  local major_version=$1

  releases=$(curl -sSL "https://api.github.com/repos/adoptium/temurin${major_version}-binaries/releases")
  latest_release=$(echo "$releases" | jq -r 'map(select(.name | test("jdk-([0-9.]+)(\\+([0-9]+))?"))) | sort_by(.published_at) | last')
  release_name=$(echo "$latest_release" | jq -r '.name')
  version=${release_name#jdk-}
  plain_version=$([[ $version =~ ^[0-9]+\.[0-9]+\.[0-9]+ ]] && echo "${BASH_REMATCH[0]}")
  archs=("x64" "aarch64" "s390x" "ppc64le")
  archs_deb=("amd64" "arm64" "s390x" "ppc64le")
  variants=("jre" "jdk")

cat << EOM
"repositories for java ${major_version}"

#VERSION ${plain_version}

java = use_extension("//private/extensions:java.bzl", "java")
EOM

  for arch_index in "${!archs[@]}"; do
    for variant in "${variants[@]}"; do
      local arch arch_deb name archive_url sha256_name sha256_url sha256 strip_prefix_suffix

      arch=${archs[arch_index]}
      arch_deb=${archs_deb[arch_index]}
      name="OpenJDK${major_version}U-${variant}_${arch}_linux_hotspot_$(underscore_encode "${version}").tar.gz"
      archive_url=$(echo "$latest_release" | jq -r --arg NAME "$name" '.assets | .[] | select(.name==$NAME) | .browser_download_url')
      : ${archive_url:?"no url found for '${name}'"}
      sha256_name="${name}.sha256.txt"
      sha256_url=$(echo "$latest_release" | jq -r --arg NAME "$sha256_name" '.assets | .[] | select(.name==$NAME) | .browser_download_url')
      : ${sha256_url:?"no url found for '${sha256_name}'"}
      sha256=$(curl -sSL "$sha256_url" | cut -d' '  -f1)
      : ${sha256?:"no sha256 downloaded for ${name}"}

      strip_prefix_suffix="-jre"
      if [[ ${variant} == "jdk" ]]; then
        strip_prefix_suffix=""
      fi

cat << EOM
java.archive(
    name = "temurin${major_version}_${variant}_${arch_deb}",
    architecture = "${arch_deb}",
    plain_version = "${plain_version}",
    sha256 = "${sha256}",
    strip_prefix = "${release_name}${strip_prefix_suffix}",
    urls = ["${archive_url}"],
    version = "${version}",
)
EOM

    done
  done
}

function update_test_versions_java21_debian12() {
  local new_version=$(get_java_version)
  sed -i -r -e "s/21\\.[0-9]+\\.[0-9]+/${new_version}/g" java/testdata/java21*debian12.yaml
}
