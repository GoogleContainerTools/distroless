set -o pipefail -o errexit -o nounset

# Copyright 2026 Google Inc. All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Functions for updating python-build-standalone archives from the knife utility.
#
# Reads the python matrix (minors + archs) from //python:config.bzl and the
# current versions from //private/extensions:python.bzl, queries the latest PBS
# release, then rewrites the archive/version data in the extension (plus
# config.bzl and testdata when versions move).
#
# An update triggers when the CPython patch moves OR when the PBS release tag
# moves under an unchanged patch (a tag-only bump means the release rebuilt its
# bundled native libraries, e.g. OpenSSL/expat, for the same CPython version).

PYTHON_TRIPLES=(
  "amd64=x86_64-unknown-linux-gnu"
  "arm64=aarch64-unknown-linux-gnu"
  "s390x=s390x-unknown-linux-gnu"
  "riscv64=riscv64-unknown-linux-gnu"
)

# portable in-place sed: BSD sed needs `-i ''`, GNU sed reads the '' as an
# empty file name and errors. Write to a sibling temp and rename instead.
sed_inplace() { # $1 = sed expression, $2 = file
  local tmp
  tmp="${2}.tmp.$$"
  sed -e "$1" "$2" > "$tmp" || { rm -f "$tmp"; return 1; }
  mv "$tmp" "$2"
}

# prints "<minor>_<arch> <version>" per matrix entry, one per line
function get_python_versions() {
  sed -n '/python_versions_repo(/,/^    )$/p' private/extensions/python.bzl \
    | grep -oE '"[0-9]+\.[0-9]+_[a-z0-9]+": "[0-9]+\.[0-9]+\.[0-9]+"' \
    | sed -E 's/"([^"]+)": "([0-9.]+)"/\1 \2/'
}

# prints the minors from the build matrix, one per line (e.g. 3.13, 3.14)
function get_python_minors() {
  sed -n 's/^PYTHON_MAJOR_VERSIONS = \[\(.*\)\]$/\1/p' python/config.bzl \
    | grep -oE '"[0-9]+\.[0-9]+"' | tr -d '"'
}

# prints archs for a minor from the build matrix, one per line
function get_python_archs() {
  local minor="$1"
  # a missing minor must yield an empty result (the caller falls back to the
  # previous minor's archs for a newly detected one), NOT kill the updater:
  # errexit+pipefail would otherwise abort on the failed grep.
  grep "\"${minor}\": \[" python/config.bzl \
    | grep -oE '"[a-z0-9]+"' | tr -d '"' || true
}

function triple_for_arch() {
  local entry
  for entry in "${PYTHON_TRIPLES[@]}"; do
    [[ "$entry" == "$1="* ]] && echo "${entry#*=}" && return 0
  done
  return 1
}

# prints the current version for a minor+arch from the extension, if any
function current_version() {
  get_python_versions | awk -v key="$1_$2" '$1 == key { print $2 }'
}

# prints the full pinned version (patch + PBS release tag, e.g. "3.13.15+20260814")
# for a minor+arch from the extension's python_archive blocks, if any.
# A tag-only bump (same patch, rebuilt native libs) must trigger an update.
function pinned_version() {
  local minor="$1" arch="$2" short
  short=$(echo "$minor" | tr -d '.')
  awk -v name="python${short}_${arch}" '
    $0 ~ ("name = \"" name "\"") { found = 1 }
    found && /version = / {
      sub(/.*version = "/, ""); sub(/".*/, ""); print; exit
    }
  ' private/extensions/python.bzl
}

# rewrites the _python_impl data section of the extension (archives + versions + metadata)
# and, when a new stable minor appeared, extends the matrix in config.bzl.
# prints the new release tag on success, or "NO_CHANGE" when everything is current.
function generate_python_archives() {
  local latest_release sha256sums
  local minors minor arch triple version sha python_short arch_anchor matrix_min published latest_minor
  PYTHON_MUTATED=0
  local -a archive_blocks versions_entries metadata_deps changes repos
  local changed=0 verbose=${VERBOSE:-0} dry_run=${DRY_RUN:-0} current

  # PBS release data source: hermetic tests inject local fixtures via PBS_RELEASE_FILE
  # + PBS_SHA256SUMS_FILE; otherwise the live latest-release.json / SHA256SUMS are used.
  if [ -n "${PBS_RELEASE_FILE:-}" ] && [ -n "${PBS_SHA256SUMS_FILE:-}" ]; then
    latest_release=$(sed -n 's/.*"tag"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$PBS_RELEASE_FILE" | head -1)
    sha256sums=$(cat "$PBS_SHA256SUMS_FILE")
  else
    # PBS publishes a machine-readable latest-release.json (avoids GitHub API rate limits);
    # fall back to the API when the raw file is unavailable.
    latest_release=$(curl -sSL https://raw.githubusercontent.com/astral-sh/python-build-standalone/latest-release/latest-release.json 2>/dev/null | jq -r '.tag')
    if [ -z "$latest_release" ] || [ "$latest_release" = "null" ]; then
      latest_release=$(curl -sSL https://api.github.com/repos/astral-sh/python-build-standalone/releases/latest 2>/dev/null | jq -r '.tag_name')
    fi
    sha256sums=$(curl -sSL "https://github.com/astral-sh/python-build-standalone/releases/download/${latest_release}/SHA256SUMS")
  fi
  [ -n "$latest_release" ] && [ "$latest_release" != "null" ] || { echo "no latest PBS release found" >&2; exit 1; }
  [ -n "$sha256sums" ] || { echo "no SHA256SUMS for ${latest_release}" >&2; exit 1; }

  local -a minors
  minors=()
  local minors_tmp archs_tmp
  minors_tmp=$(mktemp)
  get_python_minors > "$minors_tmp"
  while IFS= read -r minor; do minors+=("$minor"); done < "$minors_tmp"
  rm -f "$minors_tmp"
  [ ${#minors[@]} -gt 0 ] || { echo "no minors parsed from python/config.bzl" >&2; exit 1; }

  # sort + dedupe internally: config.bzl order/typos must not leak through
  minors=($(printf '%s\n' "${minors[@]}" | sort -uV))
  arch_anchor=${minors[${#minors[@]} - 1]}
  matrix_min=${minors[0]}

  # all stable minors published by PBS (on amd64), sorted; rc/a/b excluded by
  # requiring 3.X.Y. The matrix is a contiguous support window: the maintainer
  # drops the tail (oldest minor goes EOL); the updater fills every published
  # minor above the oldest one.
  published=$(echo "$sha256sums" \
    | grep -oE 'cpython-3\.[0-9]+\.[0-9]+\+[0-9]+-x86_64-unknown-linux-gnu-install_only\.tar\.gz' \
    | sed -E 's/cpython-(3\.[0-9]+)\.[0-9]+.*/\1/' | sort -uV)
  local fill fill_m
  fill=()
  for fill_m in $published; do
    if [[ "$fill_m" > "$matrix_min" ]] && [[ " ${minors[*]} " != *" $fill_m "* ]]; then
      fill+=("$fill_m")
    fi
  done
  if [ ${#fill[@]} -gt 0 ]; then
    echo "new stable minor(s) detected: ${fill[*]}" >&2
    for fill_m in "${fill[@]}"; do
      minors+=("$fill_m")
      changes+=("add minor ${fill_m}")
    done
    minors=($(printf '%s\n' "${minors[@]}" | sort -uV))
    # the matrix (config.bzl) is missing these minors; treat as a change even
    # when the extension still carries the version data (e.g. removed from the
    # matrix only, or a middle minor restored)
    changed=1
  fi
  latest_minor=$arch_anchor

  for minor in "${minors[@]}"; do
    python_short=$(echo "$minor" | tr -d '.')
    # a newly detected minor is not in config.bzl yet: reuse the previous minor's archs
    archs_tmp=$(mktemp)
    get_python_archs "$minor" > "$archs_tmp"
    if [ ! -s "$archs_tmp" ]; then
      get_python_archs "$latest_minor" > "$archs_tmp"
    fi
    [ -s "$archs_tmp" ] || { echo "no archs for ${minor} in python/config.bzl" >&2; exit 1; }
    while IFS= read -r arch; do
      triple=$(triple_for_arch "$arch") || { echo "no triple for ${arch}" >&2; exit 1; }
      # latest stable patch for this minor+arch (3.X.Y; excludes rc/a/b)
      version=$(echo "$sha256sums" \
        | grep -oE "cpython-${minor}\.[0-9]+\+${latest_release}-${triple}-install_only\.tar\.gz" \
        | sed -E "s/cpython-(${minor}\.[0-9]+)\+.*/\1/" | sort -V | tail -1)
      [ -n "$version" ] || { echo "no ${minor} ${triple} install_only asset in ${latest_release}" >&2; exit 1; }
      sha=$(echo "$sha256sums" | grep "cpython-${version}+${latest_release}-${triple}-install_only.tar.gz" | cut -d' ' -f1)
      [ -n "$sha" ] || { echo "no sha for ${version} ${triple}" >&2; exit 1; }

      current=$(current_version "$minor" "$arch")
      pinned=$(pinned_version "$minor" "$arch")
      new_full="${version}+${latest_release}"
      if [ "$verbose" = 1 ]; then
        if [ "$current" = "$version" ] && [ "$pinned" = "$new_full" ]; then
          echo "  ${minor} ${arch}: ${pinned} (unchanged)" >&2
        else
          echo "  ${minor} ${arch}: ${pinned:-<none>} -> ${new_full} (update)" >&2
        fi
      fi
      # an update is needed when the patch moves OR when the PBS release tag
      # moves under an unchanged patch (native library rebuild)
      if [ "$current" != "$version" ] || [ "$pinned" != "$new_full" ]; then
        changed=1
        changes+=("update ${minor} ${arch}: ${pinned:-<none>} -> ${new_full}")
      fi

      archive_blocks+=("    python_archive(
        name = \"python${python_short}_${arch}\",
        sha256 = \"${sha}\",
        strip_prefix = \"python/\",
        urls = [\"https://github.com/astral-sh/python-build-standalone/releases/download/${latest_release}/cpython-${version}+${latest_release}-${triple}-install_only.tar.gz\"],
        version = \"${version}+${latest_release}\",
        python_version = \"${minor}\",
        architecture = \"${arch}\",
        control = \"//python:control\",
    )")
      versions_entries+=("            \"${minor}_${arch}\": \"${version}\",")
      metadata_deps+=("            \"python${python_short}_${arch}\",")
      repos+=("python${python_short}_${arch}")
    done < "$archs_tmp"
    rm -f "$archs_tmp"
  done

  if [ "$dry_run" = 1 ]; then
    if [ "$changed" = 0 ]; then
      echo "NO_CHANGE"
    else
      printf 'would %s\n' "${changes[@]}" >&2
      echo "DRY_RUN"
    fi
    return 0
  fi

  if [ "$changed" = 0 ]; then
    echo "NO_CHANGE"
    return 0
  fi

  # PBS SBOM: regenerate python/pbs-sbom.spdx.json from the release's component
  # manifest (pythonbuild/downloads.py at the release tag); hermetic tests inject
  # a local copy via PBS_DOWNLOADS_FILE.
  local downloads_file sbom_tmp downloads_tmp
  if [ -n "${PBS_DOWNLOADS_FILE:-}" ]; then
    downloads_file="$PBS_DOWNLOADS_FILE"
  else
    downloads_tmp=$(mktemp)
    if ! curl -sSL "https://raw.githubusercontent.com/astral-sh/python-build-standalone/${latest_release}/pythonbuild/downloads.py" -o "$downloads_tmp"; then
      echo "no PBS downloads manifest for ${latest_release}" >&2
      rm -f "$downloads_tmp"
      exit 1
    fi
    downloads_file="$downloads_tmp"
  fi
  [ -s "$downloads_file" ] || { echo "empty PBS downloads manifest" >&2; exit 1; }
  sbom_tmp=$(mktemp)
  if ! python3 python/gen_pbs_sbom.py "$downloads_file" "$latest_release" "$sbom_tmp"; then
    echo "PBS SBOM generation failed" >&2
    rm -f "$sbom_tmp" "$downloads_tmp"
    exit 1
  fi
  grep -q "$latest_release" "$sbom_tmp" || { echo "PBS SBOM does not mention ${latest_release}" >&2; rm -f "$sbom_tmp" "$downloads_tmp"; exit 1; }
  [ -n "${PBS_DOWNLOADS_FILE:-}" ] || rm -f "$downloads_tmp"

  # PBS embedded native libraries: dissect libpython3*.so from the x86_64 install
  # tarball and verify the statically linked C libraries against the manifest.
  # A release can bump the embedded libs while the CPython versions stay the same
  # (maintainer-reported gap); this turns that drift into a hard error. The tarball
  # is sha-verified against SHA256SUMS. Hermetic tests inject a fake tarball via
  # PBS_TARBALL_FILE.
  local tarball tarball_tmp so_dir so_path
  if [ -n "${PBS_TARBALL_FILE:-}" ]; then
    tarball="$PBS_TARBALL_FILE"
  else
    tarball_tmp=$(mktemp)
    local fname tarball_sha
    fname=$(printf '%s\n' "$sha256sums" | awk '/x86_64-unknown-linux-gnu-install_only\.tar\.gz$/ {print $2; exit}')
    tarball_sha=$(printf '%s\n' "$sha256sums" | awk -v f="$fname" '$2 == f {print $1; exit}')
    if [ -z "$fname" ] || [ -z "$tarball_sha" ]; then
      echo "no x86_64 install tarball in SHA256SUMS" >&2
      rm -f "$tarball_tmp"
      exit 1
    fi
    if ! curl -sSL "https://github.com/astral-sh/python-build-standalone/releases/download/${latest_release}/${fname}" -o "$tarball_tmp"; then
      echo "cannot download ${fname}" >&2
      rm -f "$tarball_tmp"
      exit 1
    fi
    local got_sha
    got_sha=$(python3 -c "import hashlib,sys; print(hashlib.sha256(open(sys.argv[1],'rb').read()).hexdigest())" "$tarball_tmp")
    if [ "$got_sha" != "$tarball_sha" ]; then
      echo "sha256 mismatch for ${fname}: expected ${tarball_sha}, got ${got_sha}" >&2
      rm -f "$tarball_tmp"
      exit 1
    fi
    tarball="$tarball_tmp"
  fi
  so_dir=$(mktemp -d)
  if ! python3 - "$tarball" "$so_dir" <<'PYEOF'; then
import sys, tarfile
tar = tarfile.open(sys.argv[1])
for member in tar.getmembers():
    if "/lib/libpython3." in member.name and member.name.endswith(".so") and member.isfile():
        tar.extract(member, sys.argv[2])
        sys.exit(0)
sys.exit("no libpython3*.so in tarball")
PYEOF
    rm -rf "$so_dir" "$tarball_tmp"
    exit 1
  fi
  so_path=$(find "$so_dir" -name 'libpython3.*.so' | head -1)
  # stdout is the updater's machine contract (the release tag); diagnostics to stderr.
  if ! python3 python/pbs_embedded_versions.py "$so_path" "$downloads_file" >&2; then
    echo "PBS embedded native libraries drift detected" >&2
    rm -rf "$so_dir" "$tarball_tmp"
    exit 1
  fi
  rm -rf "$so_dir"
  [ -n "${PBS_TARBALL_FILE:-}" ] || rm -f "$tarball_tmp"

  # NVD CVE check: the pinned native libraries are invisible to trivy
  # (pkg:generic has no advisory feed), so query NVD CPE data for the exact
  # verified versions and RED on HIGH/CRITICAL. Hermetic tests inject fixtures
  # directly into pbs_cve_check.py and skip this block (no network).
  if [ -z "${PBS_TARBALL_FILE:-}" ] && [ -z "${PBS_SKIP_CVE_CHECK:-}" ]; then
    if ! python3 python/pbs_cve_check.py "$sbom_tmp"; then
      echo "PBS pinned native libraries have HIGH/CRITICAL CVEs; update blocked" >&2
      rm -f "$sbom_tmp"
      exit 1
    fi
  fi

  printf '%s\n' "${changes[@]}" >&2

  local start end section tmp
  start=$(grep -n '# Python from python-build-standalone' private/extensions/python.bzl | head -1 | cut -d: -f1)
  end=$(grep -n '^_archive = tag_class' private/extensions/python.bzl | head -1 | cut -d: -f1)
  local minors_list
  minors_list=$(echo "${minors[*]}" | sed 's/ /, /g')
  section="    # Python from python-build-standalone (https://github.com/astral-sh/python-build-standalone)
    # Release ${latest_release}. Linux targets only (distroless images).
    # Versions ${minors_list} (new minors added by update-python-archives when stable).
    # NOTE: armv7 is intentionally absent: PBS publishes soft-float gnueabi builds
    # (interpreter /lib/ld-linux.so.3) which cannot run on the distroless armhf base
    # (loader /usr/lib/ld-linux-armhf.so.3); ppc64le is not published by PBS.
$(printf '%s\n\n' "${archive_blocks[@]}")

    python_versions_repo(
        name = \"python_versions\",
        versions = {
$(printf '%s\n' "${versions_entries[@]}")
        },
    )

    return module_ctx.extension_metadata(
        root_module_direct_deps = [
            \"python_versions\",
$(printf '%s\n' "${metadata_deps[@]}")
        ],
        root_module_direct_dev_deps = [],
    )

"
  tmp=$(mktemp)
  head -n $((start - 1)) private/extensions/python.bzl > "$tmp"
  printf '%s' "$section" >> "$tmp"
  tail -n +"$end" private/extensions/python.bzl >> "$tmp"
  # pre-flight: the generated extension must be buildifier-clean BEFORE it replaces
  # the committed file; a broken generator aborts here with nothing mutated.
  if which buildifier >/dev/null 2>&1; then
    if ! buildifier -mode=fix "$tmp"; then
      echo "generated extension failed buildifier; aborting without changes" >&2
      rm -f "$tmp"
      return 1
    fi
  fi
  # config.bzl: apply the seds to a temp copy and verify it BEFORE any real
  # mutation, mirroring the extension; only verified content is mv'd in place.
  local config_tmp=""
  if [ ${#fill[@]} -gt 0 ]; then
    local arch_list fill_entries fill_m2
    grep -q '^PYTHON_MAJOR_VERSIONS = ' python/config.bzl \
      || { echo "PYTHON_MAJOR_VERSIONS line not found in python/config.bzl" >&2; rm -f "$tmp"; return 1; }
    grep -q "\"${latest_minor}\": \[" python/config.bzl \
      || { echo "arch map for ${latest_minor} not found in python/config.bzl" >&2; rm -f "$tmp"; return 1; }
    arch_list=$(get_python_archs "$latest_minor" | sed 's/^/"/; s/$/",/' | tr '\n' ' ' | sed 's/ $//')
    minors_quoted=$(printf '\"%s\", ' "${minors[@]}" | sed 's/, $//')
    fill_entries=""
    for fill_m2 in "${fill[@]}"; do
      fill_entries="${fill_entries}\n        \"${fill_m2}\": [${arch_list}],"
    done
    config_tmp=$(mktemp)
    cp python/config.bzl "$config_tmp"
    sed_inplace "s/^PYTHON_MAJOR_VERSIONS = .*/PYTHON_MAJOR_VERSIONS = [${minors_quoted}]/" "$config_tmp"
    sed_inplace "s|\"${latest_minor}\": \[[^]]*\],|\"${latest_minor}\": [${arch_list}],${fill_entries}|" "$config_tmp"
    for fill_m2 in "${fill[@]}"; do
      grep -qE "PYTHON_MAJOR_VERSIONS = .*\"${fill_m2}\"" "$config_tmp" \
        || { echo "config.bzl update for ${fill_m2} did not land (format drift?)" >&2; rm -f "$config_tmp" "$tmp"; return 1; }
      grep -q "\"${fill_m2}\": \[" "$config_tmp" \
        || { echo "config.bzl arch map for ${fill_m2} did not land" >&2; rm -f "$config_tmp" "$tmp"; return 1; }
    done
    # MODULE.bazel: the new minor's repos must be visible to the root module
    local module_tmp repos_sorted
    module_tmp=$(mktemp)
    cp MODULE.bazel "$module_tmp"
    repos_sorted=$(printf '"%s", ' $(printf '%s\n' "${repos[@]}" | sort) | sed 's/, $//')
    sed_inplace "s/^use_repo(py, .*/use_repo(py, ${repos_sorted}, \"python_versions\")/" "$module_tmp"
    for fill_m2 in "${fill[@]}"; do
      grep -q "\"python$(echo "$fill_m2" | tr -d '.').*_" "$module_tmp" \
        || { echo "use_repo update for ${fill_m2} did not land" >&2; rm -f "$config_tmp" "$tmp" "$module_tmp"; return 1; }
    done
  fi

  # both mutations are now verified content; apply them.
  PYTHON_MUTATED=1
  mv "$tmp" private/extensions/python.bzl || { echo "extension update failed" >&2; echo "MUTATED_PARTIAL"; return 1; }
  mv "$sbom_tmp" python/pbs-sbom.spdx.json || { echo "SBOM update failed" >&2; echo "MUTATED_PARTIAL"; return 1; }
  if [ -n "$config_tmp" ]; then
    mv "$config_tmp" python/config.bzl || { echo "config.bzl update failed" >&2; echo "MUTATED_PARTIAL"; return 1; }
    mv "$module_tmp" MODULE.bazel || { echo "MODULE.bazel update failed" >&2; echo "MUTATED_PARTIAL"; return 1; }
  fi

  # normalize formatting (repo convention; no-op when buildifier is missing).
  # This runs post-mutation, so a failure must be labeled mid-mutation.
  if which buildifier >/dev/null 2>&1; then
    if ! buildifier -mode=fix private/extensions/python.bzl python/config.bzl; then
      echo "buildifier failed on the updated files" >&2
      echo "MUTATED_PARTIAL"
      return 1
    fi
  fi

  echo "$latest_release"
}

# All fallible steps run against temp files and are verified before anything is
# replaced: a failed run mutates nothing (RED). A successful run leaves
# MODULE.bazel.lock stale until refreshed (bazel mod deps --lockfile_mode=update;
# CI enforces --lockfile_mode=error).

# bumps the version strings in the version-specific testdata yamls (python3.13.yaml etc.)
# and creates the yaml for a newly added minor. $1: a snapshot of get_python_versions
# taken before generate_python_archives.
function update_test_versions_python() {
  local old_snapshot minor file old new expected
  old_snapshot=$1
  # keep the hermetic smoke test's expected minors in sync with the matrix
  expected=$(get_python_minors | tr '\n' ' ')
  sed_inplace "s/\"\$minors\" = \"[^\"]*\"/\"\$minors\" = \"${expected}\"/" python/update_python_archives_test.sh
  for minor in $(get_python_minors); do
    file="python/testdata/python3.$(echo "$minor" | cut -d. -f2).yaml"
    new=$(current_version "$minor" "amd64")
    if [ ! -f "$file" ]; then
      [ -n "$new" ] || continue
      cat > "$file" <<EOT
schemaVersion: "2.0.0"
commandTests:
  - name: version
    command: "/python/bin/python${minor}"
    args: ["--version"]
    expectedOutput: ["Python ${new}"]
  - name: symlink
    command: "/python/bin/python3"
    args: ["--version"]
    expectedOutput: ["Python ${new}"]
EOT
      echo "created $file for Python ${new}"
      continue
    fi
    old=$(echo "$old_snapshot" | awk -v key="${minor}_amd64" '$1 == key { print $2 }')
    if [ -n "$old" ] && [ -n "$new" ] && [ "$old" != "$new" ]; then
      sed_inplace "s/Python ${old}/Python ${new}/g" "$file"
      grep -q "Python ${new}" "$file" || { echo "testdata bump for ${file} did not land" >&2; return 1; }
      echo "bumped $file to ${new}"
    fi
  done
}
