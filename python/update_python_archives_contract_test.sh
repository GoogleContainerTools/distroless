#!/usr/bin/env bash
# Black-box contract test for the python updater (knife.d/update_python_archives.sh).
#
# Contract: after a NEW PBS release, the updater must rewrite ALL files needed to
# build the new images consistently and converge:
#   - private/extensions/python.bzl: archive blocks (url/sha/version incl. release tag)
#     AND the python_versions_repo dict (patch bumps)
#   - python/config.bzl: matrix extension when a new stable minor appears
#   - MODULE.bazel: use_repo gains the new minor's archives
#   - python/testdata/python3.X.yaml: version strings (patch bumps) / new yaml (new minor)
#   - a second run is a NO_CHANGE no-op (the state is the updater's fixed point)
# Runs fully offline; fixture release data is injected via PBS_RELEASE_FILE /
# PBS_SHA256SUMS_FILE.
set -euo pipefail

cd "$TEST_SRCDIR/${TEST_WORKSPACE:-_main}"

FIX=$(mktemp -d)
trap 'rm -rf "$FIX"' EXIT

# fixture workspace: every file the updater mutates, copied verbatim from the tree
mkdir -p "$FIX/private/extensions" "$FIX/python/testdata"
cp knife.d/update_python_archives.sh "$FIX/"
cp private/extensions/python.bzl "$FIX/private/extensions/"
cp python/config.bzl "$FIX/python/"
cp MODULE.bazel "$FIX/"
cp python/update_python_archives_test.sh "$FIX/python/"
cp python/testdata/python3.13.yaml python/testdata/python3.14.yaml "$FIX/python/testdata/"

cd "$FIX"
source update_python_archives.sh

# --- fixtures ---------------------------------------------------------------
# 64-hex fake shas: the updater only copies them, nothing validates them here.
SHA_A=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
SHA_B=bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
SHA_C=cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
SHA_D=dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
TRIPLES=(x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu s390x-unknown-linux-gnu riscv64-unknown-linux-gnu)

make_sha256sums() { # $1=release $2=patch313 $3=patch314 $4=patch315 ("" = no 3.15 yet)
  local release=$1 p313=$2 p314=$3 p315=${4:-}
  : > SHA256SUMS
  for t in "${TRIPLES[@]}"; do
    echo "$SHA_A  cpython-${p313}+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
    echo "$SHA_B  cpython-${p314}+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
    if [ -n "$p315" ]; then
      echo "$SHA_C  cpython-${p315}+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
    fi
  done
}

run_updater() { # prints stdout; fails the test on a non-zero exit
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
    generate_python_archives 2>"$FIX/updater.err"
}

# --- phase A: tag-only bump (new release, same patches) -----------------------
# the maintainer-reported gap: 20260814 -> 20260815 with unchanged CPython versions
echo '{"tag": "20990101"}' > release.json
make_sha256sums 20990101 3.13.15 3.14.7
[ "$(run_updater)" = "20990101" ] || { echo "phase A: expected update to 20990101"; cat "$FIX/updater.err"; exit 1; }
grep -q 'releases/download/20990101/' private/extensions/python.bzl || { echo "phase A: archives not re-pointed at new release"; exit 1; }
! grep -q '20260807' private/extensions/python.bzl || { echo "phase A: old release still referenced"; exit 1; }
grep -q '3.13.15+20990101' private/extensions/python.bzl || { echo "phase A: archive version lacks new release tag"; exit 1; }
grep -q '"3.13_amd64": "3.13.15"' private/extensions/python.bzl || { echo "phase A: versions dict must not change on a tag-only bump"; exit 1; }
grep -q 'Python 3.13.15' python/testdata/python3.13.yaml || { echo "phase A: testdata must not change on a tag-only bump"; exit 1; }
[ "$(run_updater)" = "NO_CHANGE" ] || { echo "phase A: second run must be NO_CHANGE"; cat "$FIX/updater.err"; exit 1; }

# --- phase B: patch bump (new release, new patches) ---------------------------
snap_b=$(get_python_versions)
echo '{"tag": "20990102"}' > release.json
make_sha256sums 20990102 3.13.16 3.14.8
[ "$(run_updater)" = "20990102" ] || { echo "phase B: expected update to 20990102"; cat "$FIX/updater.err"; exit 1; }
grep -q '3.13.16+20990102' private/extensions/python.bzl || { echo "phase B: archive version not bumped"; exit 1; }
grep -q '"3.13_amd64": "3.13.16"' private/extensions/python.bzl || { echo "phase B: versions dict not bumped"; exit 1; }
update_test_versions_python "$snap_b"
grep -q 'Python 3.13.16' python/testdata/python3.13.yaml || { echo "phase B: testdata 3.13 not bumped"; exit 1; }
grep -q 'Python 3.14.8' python/testdata/python3.14.yaml || { echo "phase B: testdata 3.14 not bumped"; exit 1; }

# --- phase C: new stable minor fill (3.15 appears upstream) -------------------
snap_c=$(get_python_versions)
echo '{"tag": "20990103"}' > release.json
make_sha256sums 20990103 3.13.16 3.14.8 3.15.0
[ "$(run_updater)" = "20990103" ] || { echo "phase C: expected update to 20990103"; cat "$FIX/updater.err"; exit 1; }
grep -q '"3.15"' python/config.bzl || { echo "phase C: 3.15 missing from PYTHON_MAJOR_VERSIONS"; exit 1; }
grep -q '"3.15": \[' python/config.bzl || { echo "phase C: 3.15 arch map missing from config.bzl"; exit 1; }
grep -q 'python315_amd64' MODULE.bazel || { echo "phase C: use_repo not extended with python315 repos"; exit 1; }
grep -q 'python315_amd64' private/extensions/python.bzl || { echo "phase C: 3.15 archive missing from extension"; exit 1; }
grep -q '3.15.0+20990103' private/extensions/python.bzl || { echo "phase C: 3.15 archive version wrong"; exit 1; }
update_test_versions_python "$snap_c"
[ -f python/testdata/python3.15.yaml ] || { echo "phase C: python3.15.yaml not created"; exit 1; }
grep -q 'Python 3.15.0' python/testdata/python3.15.yaml || { echo "phase C: python3.15.yaml version wrong"; exit 1; }

# --- convergence + structural consistency -------------------------------------
[ "$(run_updater)" = "NO_CHANGE" ] || { echo "final: expected NO_CHANGE"; cat "$FIX/updater.err"; exit 1; }
for minor in $(get_python_minors); do
  for arch in $(get_python_archs "$minor"); do
    v=$(current_version "$minor" "$arch")
    [ -n "$v" ] || { echo "final: no versions-dict entry for ${minor}_${arch}"; exit 1; }
    p=$(pinned_version "$minor" "$arch")
    [ -n "$p" ] || { echo "final: no archive pin for ${minor}_${arch}"; exit 1; }
    case "$p" in
      "$v"+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]) ;;
      *) echo "final: pin for ${minor}_${arch} must be '<patch>+<release>', got [$p]"; exit 1 ;;
    esac
  done
done

echo "update_python_archives contract OK (tag-only bump, patch bump, new minor, convergence)"
