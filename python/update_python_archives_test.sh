#!/usr/bin/env bash
# Hermetic smoke test for the python updater's parser functions.
# Verifies the committed matrix (python/config.bzl) and the extension
# (private/extensions/python.bzl) stay consistent - no network, no fixtures.
set -euo pipefail

cd "$TEST_SRCDIR/${TEST_WORKSPACE:-_main}"

source knife.d/update_python_archives.sh

minors=$(get_python_minors | tr '\n' ' ')
[ "$minors" = "3.13 3.14 " ] || { echo "unexpected minors: [$minors]"; exit 1; }

for minor in $(get_python_minors); do
  for arch in $(get_python_archs "$minor"); do
    version=$(current_version "$minor" "$arch")
    [ -n "$version" ] || { echo "missing version for ${minor}_${arch}"; exit 1; }
    # the archive pin must carry the PBS release tag: the updater keys change
    # detection on it, so a tag-only bump (native library rebuild under the same
    # CPython patch) must never be silently dropped.
    pinned=$(pinned_version "$minor" "$arch")
    [ -n "$pinned" ] || { echo "missing pinned version for ${minor}_${arch}"; exit 1; }
    case "$pinned" in
      "$version"+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]) ;;
      *) echo "pinned version for ${minor}_${arch} must be '<patch>+<release tag>', got: [$pinned]"; exit 1 ;;
    esac
  done
done

echo "update_python_archives parsing OK"
