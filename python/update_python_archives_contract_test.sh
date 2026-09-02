#!/usr/bin/env bash
# Black-box contract test for the Python updater.
#
# Contract: after a new PBS release, the updater rewrites all files needed to
# build consistent images and converge:
#   - archive blocks and version data
#   - the matrix and repository visibility for selected minors
#   - version-specific testdata
#   - a second run returns NO_CHANGE (the updater reaches a fixed point)
# The test runs offline; fixture data is supplied through PBS_RELEASE_FILE,
# PBS_SHA256SUMS_FILE, PBS_DOWNLOADS_FILE, PBS_TARBALL_FILE, or PBS_TARBALL_DIR.
set -euo pipefail

cd "$TEST_SRCDIR/${TEST_WORKSPACE:-_main}"

FIX=$(mktemp -d)
trap 'rm -rf "$FIX"' EXIT

# Copy every file mutated by the updater into the test workspace.
mkdir -p "$FIX/private/extensions" "$FIX/python/testdata"
cp knife.d/update_python_archives.sh "$FIX/"
cp private/extensions/python.bzl "$FIX/private/extensions/"
cp python/config.bzl "$FIX/python/"
cp MODULE.bazel "$FIX/"
cp python/update_python_archives_test.sh "$FIX/python/"
cp python/gen_pbs_sbom.py "$FIX/python/"
cp python/testdata/python3.13.yaml python/testdata/python3.14.yaml "$FIX/python/testdata/"
cp python/pbs_embedded_versions.py "$FIX/python/"

# Minimal PBS component manifest for SBOM generation.
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

# Minimal PBS install tarball containing the markers checked by the verifier.
make_tarball() { # $1 = output path; markers must match the fixture manifest.
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
    info = tarfile.TarInfo("python/lib/libpython3.13.so.1.0")
    info.size = len(blob)
    tar.addfile(info, io.BytesIO(blob))
    link = tarfile.TarInfo("python/lib/libpython3.13.so")
    link.type = tarfile.SYMTYPE
    link.linkname = "libpython3.13.so.1.0"
    tar.addfile(link)
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
# Test tarballs use placeholder hashes because PBS_TARBALL_DIR skips downloads.
SHA_A=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
SHA_B=bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
SHA_C=cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
SHA_D=dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
TRIPLES=(x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu s390x-unknown-linux-gnu riscv64-unknown-linux-gnu)

make_sha256sums() { # Arguments: release, 3.13 patch, 3.14 patch, optional 3.15 patches.
  local release=$1 p313=$2 p314=$3 p315=${4:-} p315_alt=${5:-}
  : > SHA256SUMS
  for t in "${TRIPLES[@]}"; do
    echo "$SHA_A  cpython-${p313}+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
    echo "$SHA_B  cpython-${p314}+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
    if [ -n "$p315" ]; then
      echo "$SHA_C  cpython-${p315}+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
    fi
    if [ -n "$p315_alt" ]; then
      echo "$SHA_D  cpython-${p315_alt}+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
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
    if [ -n "$p315_alt" ]; then
      cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-${p315_alt}+${release}-${t}-install_only.tar.gz"
    fi
  done
}

make_numeric_fill_sha256sums() {
  local release=$1
  : > SHA256SUMS
  for t in "${TRIPLES[@]}"; do
    echo "$SHA_A  cpython-3.9.9+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
    echo "$SHA_B  cpython-3.10.1+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
    echo "$SHA_D  cpython-3.10.1rc1+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
  done
  rm -rf "$FIX/tarballs"
  mkdir -p "$FIX/tarballs"
  for t in "${TRIPLES[@]}"; do
    cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-3.9.9+${release}-${t}-install_only.tar.gz"
    cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-3.10.1+${release}-${t}-install_only.tar.gz"
    cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-3.10.1rc1+${release}-${t}-install_only.tar.gz"
  done
}

make_prerelease_only_sha256sums() {
  local release=$1
  : > SHA256SUMS
  for t in "${TRIPLES[@]}"; do
    echo "$SHA_C  cpython-3.15.0rc1+${release}-${t}-install_only.tar.gz" >> SHA256SUMS
  done
  rm -rf "$FIX/tarballs"
  mkdir -p "$FIX/tarballs"
  for t in "${TRIPLES[@]}"; do
    cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-3.15.0rc1+${release}-${t}-install_only.tar.gz"
  done
}

run_updater() { # Print stdout and fail the test on a nonzero exit.
  # Run in bash -c so an updater failure does not terminate this test script.
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
    PBS_DOWNLOADS_FILE="$FIX/downloads.py" PBS_TARBALL_DIR="$FIX/tarballs" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err"
}

run_updater_expect_fail() { # A nonzero exit is expected for drift.
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
    PBS_DOWNLOADS_FILE="$FIX/downloads.py" PBS_TARBALL_FILE="$FIX/drift.tar.gz" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err" && return 1 || return 0
}

run_updater_path_traversal() {
  TMPDIR="$FIX/tmp" PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
    PBS_DOWNLOADS_FILE="$FIX/downloads.py" PBS_TARBALL_FILE="$FIX/path-traversal.tar.gz" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err" && return 1 || return 0
}

run_updater_noop() {
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
    PBS_DOWNLOADS_FILE="$FIX/missing-downloads.py" PBS_TARBALL_DIR="$FIX/tarballs" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err"
}

run_updater_bad_manifest() {
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
    PBS_DOWNLOADS_FILE="$FIX/bad-downloads.py" PBS_TARBALL_DIR="$FIX/tarballs" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err"
}

run_updater_required_asset_fail() {
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
    PBS_DOWNLOADS_FILE="$FIX/downloads.py" PBS_TARBALL_DIR="$FIX/tarballs" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err" && return 1 || return 0
}

enable_315() {
  python3 - <<'PYEOF'
from pathlib import Path

path = Path("python/config.bzl")
text = path.read_text()
text = text.replace(
    'PYTHON_MAJOR_VERSIONS = ["3.13", "3.14"]',
    'PYTHON_MAJOR_VERSIONS = ["3.13", "3.14", "3.15"]',
)
text = text.replace(
    '        "3.14": ["amd64", "arm64", "s390x", "riscv64"],\n',
    '        "3.14": ["amd64", "arm64", "s390x", "riscv64"],\n'
    '        "3.15": ["amd64", "arm64", "s390x", "riscv64"],\n',
)
path.write_text(text)
PYEOF
}

enable_315_without_arches() {
  python3 - <<'PYEOF'
from pathlib import Path

path = Path("python/config.bzl")
text = path.read_text().replace(
    'PYTHON_MAJOR_VERSIONS = ["3.13", "3.14"]',
    'PYTHON_MAJOR_VERSIONS = ["3.13", "3.14", "3.15"]',
)
path.write_text(text)
PYEOF
}

disable_315() {
  python3 - <<'PYEOF'
from pathlib import Path

path = Path("python/config.bzl")
text = path.read_text()
text = text.replace(', "3.15"]', ']')
text = text.replace(
    '        "3.15": ["amd64", "arm64", "s390x", "riscv64"],\n',
    '',
)
path.write_text(text)
PYEOF
}

# --- tag-only bump (new release, same patches) -------------------------------
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

# --- embedded-library drift ---------------------------------------------------
# A binary version mismatch must fail the updater without changing the workspace.
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

# --- archive path traversal ----------------------------------------------------
mkdir -p "$FIX/tmp" "$FIX/escape"
python3 - "$FIX/path-traversal.tar.gz" "$(basename "$FIX")" <<'PYEOF'
import sys, tarfile, io

member = f"python/lib/../../../../../{sys.argv[2]}/escape/libpython3.13.so"
with tarfile.open(sys.argv[1], "w:gz") as tar:
    blob = b"not a Python library"
    info = tarfile.TarInfo(member)
    info.size = len(blob)
    tar.addfile(info, io.BytesIO(blob))
PYEOF
run_updater_path_traversal || { echo "phase PATH: traversal archive must fail"; cat "$FIX/updater.err"; exit 1; }
[ ! -e "$FIX/escape/libpython3.13.so" ] || { echo "phase PATH: archive escaped the extraction directory"; exit 1; }

# --- patch bump (new release, new patches) -----------------------------------
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

# --- prerelease remains opt-in -------------------------------------------------
echo '{"tag": "20990103"}' > release.json
make_sha256sums 20990103 3.13.16 3.14.8 3.15.0b4
[ "$(run_updater)" = "20990103" ] || { echo "phase PRE: expected stable update"; cat "$FIX/updater.err"; exit 1; }
! grep -q '"3.15"' python/config.bzl || { echo "phase PRE: beta must not extend the matrix"; exit 1; }
! grep -q 'python315_' private/extensions/python.bzl || { echo "phase PRE: beta must not enter the extension"; exit 1; }
make_prerelease_only_sha256sums 20990103
run_updater_required_asset_fail || { echo "phase PRE: missing stable assets must fail"; cat "$FIX/updater.err"; exit 1; }
grep -q 'required matrix entry 3.13 amd64' "$FIX/updater.err" || { echo "phase PRE: missing stable asset error is unclear"; cat "$FIX/updater.err"; exit 1; }

# --- opted-in prerelease -------------------------------------------------------
enable_315_without_arches
echo '{"tag": "20990104"}' > release.json
make_sha256sums 20990104 3.13.16 3.14.8
run_updater_required_asset_fail || { echo "phase OPT-IN: incomplete matrix must fail"; cat "$FIX/updater.err"; exit 1; }
grep -q 'no archs for 3.15' "$FIX/updater.err" || { echo "phase OPT-IN: incomplete matrix error is unclear"; cat "$FIX/updater.err"; exit 1; }
enable_315
echo '{"tag": "20990104"}' > release.json
make_sha256sums 20990104 3.13.16 3.14.8
run_updater_required_asset_fail || { echo "phase OPT-IN: missing required asset must fail"; cat "$FIX/updater.err"; exit 1; }
grep -q 'required matrix entry 3.15 amd64' "$FIX/updater.err" || { echo "phase OPT-IN: missing asset error is unclear"; cat "$FIX/updater.err"; exit 1; }
! grep -q '20990104' private/extensions/python.bzl || { echo "phase OPT-IN: failed update changed the extension"; exit 1; }
! grep -q 'python315_' MODULE.bazel || { echo "phase OPT-IN: failed update changed repository visibility"; exit 1; }
make_sha256sums 20990104 3.13.16 3.14.8 3.15.0b4
[ "$(run_updater)" = "20990104" ] || { echo "phase OPT-IN: expected beta update"; cat "$FIX/updater.err"; exit 1; }
grep -q '3.15.0b4+20990104' private/extensions/python.bzl || { echo "phase OPT-IN: beta archive version wrong"; exit 1; }
make_sha256sums 20990104 3.13.16 3.14.8 3.15.0rc1 3.15.0rc2
for t in "${TRIPLES[@]}"; do
  echo "$SHA_C  cpython-3.15.0+20990104-${t}-install_only.tar.gz" >> SHA256SUMS
  cp "$FIX/tarball.tar.gz" "$FIX/tarballs/cpython-3.15.0+20990104-${t}-install_only.tar.gz"
done
[ "$(run_updater)" = "20990104" ] || { echo "phase OPT-IN: expected prerelease update"; cat "$FIX/updater.err"; exit 1; }
grep -q 'python315_amd64' MODULE.bazel || { echo "phase OPT-IN: selected repos not visible"; exit 1; }
grep -q '3.15.0rc2+20990104' private/extensions/python.bzl || { echo "phase OPT-IN: latest RC archive version wrong"; exit 1; }

# --- opt-out remains removed ---------------------------------------------------
disable_315
make_sha256sums 20990104 3.13.16 3.14.8
[ "$(run_updater)" = "20990104" ] || { echo "phase OPT-OUT: expected cleanup update"; cat "$FIX/updater.err"; exit 1; }
! grep -q 'python315_' MODULE.bazel || { echo "phase OPT-OUT: removed repos were repaired"; exit 1; }
! grep -q 'python315_' private/extensions/python.bzl || { echo "phase OPT-OUT: removed archives were repaired"; exit 1; }

# --- new stable minor --------------------------------------------------------
snap_c=$(get_python_versions)
echo '{"tag": "20990105"}' > release.json
make_sha256sums 20990105 3.13.16 3.14.8 3.15.0
[ "$(run_updater)" = "20990105" ] || { echo "phase C: expected update to 20990105"; cat "$FIX/updater.err"; exit 1; }
grep -q '"3.15"' python/config.bzl || { echo "phase C: 3.15 missing from PYTHON_MAJOR_VERSIONS"; exit 1; }
grep -q '"3.15": \[' python/config.bzl || { echo "phase C: 3.15 arch map missing from config.bzl"; exit 1; }
grep -q 'python315_amd64' MODULE.bazel || { echo "phase C: use_repo not extended with python315 repos"; exit 1; }
grep -q 'python315_amd64' private/extensions/python.bzl || { echo "phase C: 3.15 archive missing from extension"; exit 1; }
grep -q '3.15.0+20990105' private/extensions/python.bzl || { echo "phase C: 3.15 archive version wrong"; exit 1; }
update_test_versions_python "$snap_c"
[ -f python/testdata/python3.15.yaml ] || { echo "phase C: python3.15.yaml not created"; exit 1; }
grep -q 'Python 3.15.0' python/testdata/python3.15.yaml || { echo "phase C: python3.15.yaml version wrong"; exit 1; }

# --- convergence and consistency ---------------------------------------------
[ "$(run_updater)" = "NO_CHANGE" ] || { echo "final: expected NO_CHANGE"; cat "$FIX/updater.err"; exit 1; }
grep -q '20990105' python/pbs-sbom.spdx.json || { echo "final: SBOM must stay on the last release"; exit 1; }
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

# --- numeric stable minor ordering ---------------------------------------------
python3 - <<'PYEOF'
from pathlib import Path

Path("python/config.bzl").write_text('''"python configurations"

PYTHON_DISTROS = ["debian13"]
PYTHON_MAJOR_VERSIONS = ["3.9"]
PYTHON_ARCHITECTURES = {
    "debian13": {
        "3.9": ["amd64", "arm64", "s390x", "riscv64"],
    },
}
PYTHON_PACKAGES = {
    "debian13": ["libc-bin"],
}
''')
PYEOF
echo '{"tag": "20990106"}' > release.json
make_numeric_fill_sha256sums 20990106
[ "$(run_updater)" = "20990106" ] || { echo "phase NUMERIC: expected update to 20990106"; cat "$FIX/updater.err"; exit 1; }
grep -q '"3.10"' python/config.bzl || { echo "phase NUMERIC: 3.10 was not added after 3.9"; exit 1; }
grep -q '3.10.1+20990106' private/extensions/python.bzl || { echo "phase NUMERIC: 3.10 archive missing"; exit 1; }
! grep -q '3.10.1rc1+20990106' private/extensions/python.bzl || { echo "phase NUMERIC: stable minor selected an RC"; exit 1; }

echo "update_python_archives contract OK (tag-only bump, patch bump, new minor, convergence)"
