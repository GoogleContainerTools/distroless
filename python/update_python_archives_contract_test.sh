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
# Runs fully offline; fixture data is injected via PBS_RELEASE_FILE /
# PBS_SHA256SUMS_FILE / PBS_DOWNLOADS_FILE / PBS_TARBALL_FILE or PBS_TARBALL_DIR.
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
cp python/gen_pbs_sbom.py "$FIX/python/"
cp python/testdata/python3.13.yaml python/testdata/python3.14.yaml "$FIX/python/testdata/"
cp python/pbs_embedded_versions.py "$FIX/python/"

# fake PBS component manifest (pythonbuild/downloads.py) for the SBOM step
cat > "$FIX/downloads.py" <<'EOF'
DOWNLOADS = {
    "cpython-3.14": {
        "url": "https://www.python.org/ftp/python/3.14.7/Python-3.14.7.tar.xz",
        "version": "3.14.7",
        "licenses": ["Python-2.0"],
    },
    "expat": {
        "url": "https://example.invalid/expat.tar.gz",
        "version": "2.8.3",
        "licenses": ["MIT"],
        "library_names": ["expat"],
    },
    "mpdecimal": {
        "url": "https://example.invalid/mpdecimal.tar.gz",
        "version": "4.0.0",
        "library_names": ["mpdecimal"],
    },
    "sqlite": {
        "url": "https://example.invalid/sqlite.tar.gz",
        "version": "3530100",
        "actual_version": "3.53.1.0",
        "library_names": ["sqlite3"],
    },
    "zlib": {
        "url": "https://example.invalid/zlib.tar.gz",
        "version": "1.3.2",
        "licenses": ["Zlib"],
        "library_names": ["z"],
    },
    "zstd": {
        "url": "https://example.invalid/zstd.tar.gz",
        "version": "1.5.7",
        "library_names": ["zstd"],
    },
}
EOF

# fake PBS install tarball: libpython with the markers the verifier checks.
make_tarball() { # $1 = output path; markers must match the fixture manifest
  python3 - "$1" <<'PYEOF'
import sys, tarfile, io
blob = (
    b"OpenSSL 3.5.7 9 Jun 2026\n"
    b"deflate 1.3.2 Copyright 1995-2026 Jean-loup Gailly and Mark Adler\n"
    b"expat_2.8.3\n"
    b"ncurses 6.5.20240427\n"
    b"1.0.8, 13-Jul-2019\n"
    b"3.53.1\n5.8.3\n"
    b"1.5.7\n4.0.0\n"
)
with tarfile.open(sys.argv[1], "w:gz") as tar:
    info = tarfile.TarInfo("python/lib/libpython3.13.so")
    info.size = len(blob)
    tar.addfile(info, io.BytesIO(blob))
PYEOF
}
make_tarball "$FIX/tarball.tar.gz"

cd "$FIX"
source update_python_archives.sh

python3 - <<'PY'
import sys
sys.path.insert(0, "python")
from pbs_embedded_versions import expected_version, weak_version
assert expected_version({"actual_version": "3.53.1.0"}, "sqlite") == "3.53.1"
assert expected_version({"version": "4.0.0"}, "mpdecimal") == "4.0.0"
assert weak_version(b"zstd 1.5.7", "zstd", {"version": "1.5.7"}) == "1.5.7"
PY

# --- fixtures ---------------------------------------------------------------
# Test tarballs use fake hashes because PBS_TARBALL_DIR bypasses download checks.
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
  rm -rf "$FIX/tarballs"
  mkdir -p "$FIX/tarballs"
  for t in "${TRIPLES[@]}"; do
    cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-${p313}+${release}-${t}-install_only.tar.gz"
    cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-${p314}+${release}-${t}-install_only.tar.gz"
    if [ -n "$p315" ]; then
      cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-${p315}+${release}-${t}-install_only.tar.gz"
    fi
  done
}

run_updater() { # prints stdout; fails the test on a non-zero exit
  # bash -c: the updater aborts with exit 1 on fatal errors (knife contract),
  # which must not kill the test script.
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" PBS_SKIP_CVE_CHECK=1 \
    PBS_DOWNLOADS_FILE="$FIX/downloads.py" PBS_TARBALL_DIR="$FIX/tarballs" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err"
}

run_updater_expect_fail() { # non-zero exit is the expectation (drift => RED)
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" PBS_SKIP_CVE_CHECK=1 \
    PBS_DOWNLOADS_FILE="$FIX/downloads.py" PBS_TARBALL_FILE="$FIX/drift.tar.gz" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err" && return 1 || return 0
}

run_updater_noop() {
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" PBS_SKIP_CVE_CHECK=1 \
    PBS_DOWNLOADS_FILE="$FIX/missing-downloads.py" PBS_TARBALL_DIR="$FIX/tarballs" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err"
}

run_updater_bad_manifest() {
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" PBS_SKIP_CVE_CHECK=1 \
    PBS_DOWNLOADS_FILE="$FIX/bad-downloads.py" PBS_TARBALL_DIR="$FIX/tarballs" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err"
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
grep -q 'OK.*zstd.*1.5.7' "$FIX/updater.err" || { echo "phase A: zstd marker not checked"; exit 1; }
grep -q 'OK.*mpdecimal.*4.0.0' "$FIX/updater.err" || { echo "phase A: mpdecimal marker not checked"; exit 1; }
if run_updater_noop; then
  echo "phase A: no-op must inspect PBS artifacts"
  exit 1
fi
printf 'DOWNLOADS = [' > "$FIX/bad-downloads.py"
if run_updater_bad_manifest; then
  echo "phase A: invalid manifest must fail"
  exit 1
fi
grep -q 'PBS SBOM generation failed' "$FIX/updater.err" || { echo "phase A: SBOM failure was not reported"; exit 1; }
! grep -q 'unbound variable' "$FIX/updater.err" || { echo "phase A: SBOM failure cleanup used an unset variable"; exit 1; }
grep -q '20990101' python/pbs-sbom.spdx.json || { echo "phase A: SBOM not regenerated for the new release"; exit 1; }
grep -q '"expat"' python/pbs-sbom.spdx.json || { echo "phase A: SBOM missing bundled component"; exit 1; }

# --- phase DRIFT: embedded library bumped without a manifest change ----------
# the maintainer-reported gap made a hard error: a release whose binary embeds
# e.g. zlib 1.3.3 while the manifest still pins 1.3.2 must fail the updater.
python3 - "$FIX/drift.tar.gz" <<'PYEOF'
import sys, tarfile, io
blob = (
    b"OpenSSL 3.5.7 9 Jun 2026\n"
    b"deflate 1.3.3 Copyright 1995-2026 Jean-loup Gailly and Mark Adler\n"
    b"expat_2.8.3\n"
    b"ncurses 6.5.20240427\n"
    b"1.0.8, 13-Jul-2019\n"
    b"3.53.1\n5.8.3\n"
)
with tarfile.open(sys.argv[1], "w:gz") as tar:
    info = tarfile.TarInfo("python/lib/libpython3.13.so")
    info.size = len(blob)
    tar.addfile(info, io.BytesIO(blob))
PYEOF
echo '{"tag": "20990102"}' > release.json
make_sha256sums 20990102 3.13.15 3.14.7
run_updater_expect_fail || { echo "phase DRIFT: expected the updater to fail"; cat "$FIX/updater.err"; exit 1; }
grep -qi 'drift' "$FIX/updater.err" || { echo "phase DRIFT: missing drift error message"; cat "$FIX/updater.err"; exit 1; }
! grep -q '20990102' private/extensions/python.bzl || { echo "phase DRIFT: workspace must be untouched after a RED"; exit 1; }

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
grep -q '20990102' python/pbs-sbom.spdx.json || { echo "phase B: SBOM not regenerated"; exit 1; }

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
grep -q '20990103' python/pbs-sbom.spdx.json || { echo "final: SBOM must stay on the last release"; exit 1; }
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
