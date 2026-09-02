#!/usr/bin/env bash
# Hermetic smoke test for the Python updater's parser functions.
# Verifies that the matrix and extension remain consistent without network access
# or fixtures.
set -euo pipefail

cd "$TEST_SRCDIR/${TEST_WORKSPACE:-_main}"

source knife.d/update_python_archives.sh

minors=$(get_python_minors | tr '\n' ' ')
[ "$minors" = "3.13 3.14 " ] || { echo "unexpected minors: [$minors]"; exit 1; }

for minor in $(get_python_minors); do
  for arch in $(get_python_archs "$minor"); do
    version=$(current_version "$minor" "$arch")
    [ -n "$version" ] || { echo "missing version for ${minor}_${arch}"; exit 1; }
    # Archive pins include the PBS release tag because change detection uses it.
    # A tag-only bump must not be silently ignored.
    pinned=$(pinned_version "$minor" "$arch")
    [ -n "$pinned" ] || { echo "missing pinned version for ${minor}_${arch}"; exit 1; }
    case "$pinned" in
      "$version"+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]) ;;
      *) echo "pinned version for ${minor}_${arch} must be '<patch>+<release tag>', got: [$pinned]"; exit 1 ;;
    esac
  done
done

echo "update-python-archives parser OK"
