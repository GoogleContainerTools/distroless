#!/usr/bin/env bash
# Black-box contract test for the Python updater.
#
# Contract: after a new PBS release, the updater rewrites all files needed to
# build consistent images and converge:
#   - archive blocks and version data
#   - the matrix and repository visibility for selected minors
#   - version-specific testdata
#   - a second run returns NO_CHANGE (the updater reaches a fixed point)
# Release data is supplied through PBS_RELEASE_FILE and PBS_SHA256SUMS_FILE.
set -euo pipefail

cd "$TEST_SRCDIR/${TEST_WORKSPACE:-_main}"

FIX=$(mktemp -d)
trap 'rm -rf "$FIX"' EXIT

# Copy every file mutated by the updater into the test workspace.
mkdir -p "$FIX/private/extensions" "$FIX/python/testdata"
mkdir -p "$FIX/knife.d"
cp knife "$FIX/"
cp knife.d/update_java_versions.sh knife.d/update_python_archives.sh "$FIX/knife.d/"
cp knife.d/update_python_archives.sh "$FIX/"
cp private/extensions/python.bzl "$FIX/private/extensions/"
cp python/config.bzl "$FIX/python/"
cp MODULE.bazel "$FIX/"
cp python/update_python_archives_test.sh "$FIX/python/"
cp python/testdata/python3.13.yaml python/testdata/python3.14.yaml "$FIX/python/testdata/"

cd "$FIX"
# shellcheck source=knife.d/update_python_archives.sh
source update_python_archives.sh

# --- fixtures ---------------------------------------------------------------
SHA_A=aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
SHA_B=bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
SHA_C=cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
SHA_D=dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
TRIPLES=(x86_64-unknown-linux-gnu aarch64-unknown-linux-gnu s390x-unknown-linux-gnu riscv64-unknown-linux-gnu)

make_sha256sums() { # Arguments: release, 3.13 patch, 3.14 patch, optional 3.15 patches.
  local release=$1 p313=$2 p314=$3 p315=${4:-} p315_alt=${5:-}
  : > SHA256SUMS
  for t in "${TRIPLES[@]}"; do
    echo "$SHA_A  cpython-${p313}+${release}-${t}-install_only_stripped.tar.gz" >> SHA256SUMS
    echo "$SHA_B  cpython-${p314}+${release}-${t}-install_only_stripped.tar.gz" >> SHA256SUMS
    if [ -n "$p315" ]; then
      echo "$SHA_C  cpython-${p315}+${release}-${t}-install_only_stripped.tar.gz" >> SHA256SUMS
    fi
    if [ -n "$p315_alt" ]; then
      echo "$SHA_D  cpython-${p315_alt}+${release}-${t}-install_only_stripped.tar.gz" >> SHA256SUMS
    fi
  done
}

make_numeric_fill_sha256sums() {
  local release=$1
  : > SHA256SUMS
  for t in "${TRIPLES[@]}"; do
    echo "$SHA_A  cpython-3.9.9+${release}-${t}-install_only_stripped.tar.gz"
    echo "$SHA_B  cpython-3.10.1+${release}-${t}-install_only_stripped.tar.gz"
    echo "$SHA_D  cpython-3.10.1rc1+${release}-${t}-install_only_stripped.tar.gz"
  done >> SHA256SUMS
}

make_prerelease_only_sha256sums() {
  local release=$1
  : > SHA256SUMS
  for t in "${TRIPLES[@]}"; do
    echo "$SHA_C  cpython-3.15.0rc1+${release}-${t}-install_only_stripped.tar.gz" >> SHA256SUMS
  done
}

run_updater() { # Print stdout and fail the test on a nonzero exit.
  # Run in bash -c so an updater failure does not terminate this test script.
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
    bash -c 'source update_python_archives.sh; generate_python_archives' 2>"$FIX/updater.err"
}

run_updater_required_asset_fail() {
  PBS_RELEASE_FILE="$FIX/release.json" PBS_SHA256SUMS_FILE="$FIX/SHA256SUMS" \
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
cat > python/config.bzl <<'EOF'
PYTHON_MAJOR_VERSIONS = ["3.13", "3.14"]
PYTHON_ARCHITECTURES = {
    "debian13": {
        "3.13": ["amd64", "arm64", "s390x", "riscv64"],
        "3.14": ["amd64", "arm64", "s390x", "riscv64"],
    },
}
EOF
echo '{"tag": "20981231"}' > release.json
make_sha256sums 20981231 3.13.15 3.14.7
run_updater >/dev/null
update_test_versions_python >/dev/null
echo '{"tag": "20990101"}' > release.json
make_sha256sums 20990101 3.13.15 3.14.7
echo "$SHA_A  cpython-3.13.999+20990101-x86_64-unknown-linux-gnu-install_only.tar.gz" >> SHA256SUMS
[ "$(run_updater)" = "20990101" ] || { echo "phase A: expected update to 20990101"; cat "$FIX/updater.err"; exit 1; }
grep -q 'releases/download/20990101/' private/extensions/python.bzl || { echo "phase A: archives not re-pointed at new release"; exit 1; }
! grep -q '20260807' private/extensions/python.bzl || { echo "phase A: old release still referenced"; exit 1; }
grep -q '3.13.15+20990101' private/extensions/python.bzl || { echo "phase A: archive version lacks new release tag"; exit 1; }
grep -q '"3.13_amd64": "3.13.15"' private/extensions/python.bzl || { echo "phase A: versions dict must not change on a tag-only bump"; exit 1; }
grep -q 'Python 3.13.15' python/testdata/python3.13.yaml || { echo "phase A: testdata must not change on a tag-only bump"; exit 1; }

# --- patch bump (new release, new patches) -----------------------------------
echo '{"tag": "20990102"}' > release.json
make_sha256sums 20990102 3.13.16 3.14.8
[ "$(run_updater)" = "20990102" ] || { echo "phase B: expected update to 20990102"; cat "$FIX/updater.err"; exit 1; }
grep -q '3.13.16+20990102' private/extensions/python.bzl || { echo "phase B: archive version not bumped"; exit 1; }
grep -q '"3.13_amd64": "3.13.16"' private/extensions/python.bzl || { echo "phase B: versions dict not bumped"; exit 1; }
update_test_versions_python
grep -q 'Python 3.13.16' python/testdata/python3.13.yaml || { echo "phase B: testdata 3.13 not bumped"; exit 1; }
grep -q 'Python 3.14.8' python/testdata/python3.14.yaml || { echo "phase B: testdata 3.14 not bumped"; exit 1; }

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
update_test_versions_python >/dev/null
make_sha256sums 20990104 3.13.16 3.14.8 3.15.0rc1 3.15.0rc2
[ "$(run_updater)" = "20990104" ] || { cat "$FIX/updater.err"; exit 1; }
grep -q '3.15.0rc2+20990104' private/extensions/python.bzl || { echo "phase OPT-IN: latest RC archive version wrong"; exit 1; }
for t in "${TRIPLES[@]}"; do
  echo "$SHA_C  cpython-3.15.0+20990104-${t}-install_only_stripped.tar.gz" >> SHA256SUMS
done
[ "$(run_updater)" = "20990104" ] || { echo "phase OPT-IN: expected final release update"; cat "$FIX/updater.err"; exit 1; }
grep -q 'python315_amd64' MODULE.bazel || { echo "phase OPT-IN: selected repos not visible"; exit 1; }
grep -q '3.15.0+20990104' private/extensions/python.bzl || { echo "phase OPT-IN: final release must outrank RCs"; exit 1; }

# --- opt-out remains removed ---------------------------------------------------
disable_315
make_sha256sums 20990104 3.13.16 3.14.8
[ "$(run_updater)" = "20990104" ] || { echo "phase OPT-OUT: expected cleanup update"; cat "$FIX/updater.err"; exit 1; }
! grep -q 'python315_' MODULE.bazel || { echo "phase OPT-OUT: removed repos were repaired"; exit 1; }
! grep -q 'python315_' private/extensions/python.bzl || { echo "phase OPT-OUT: removed archives were repaired"; exit 1; }

# --- new stable minor --------------------------------------------------------
echo '{"tag": "20990105"}' > release.json
make_sha256sums 20990105 3.13.16 3.14.8 3.15.0
[ "$(run_updater)" = "20990105" ] || { echo "phase C: expected update to 20990105"; cat "$FIX/updater.err"; exit 1; }
grep -q '"3.15"' python/config.bzl || { echo "phase C: 3.15 missing from PYTHON_MAJOR_VERSIONS"; exit 1; }
grep -q '"3.15": \[' python/config.bzl || { echo "phase C: 3.15 arch map missing from config.bzl"; exit 1; }
grep -q 'python315_amd64' MODULE.bazel || { echo "phase C: use_repo not extended with python315 repos"; exit 1; }
grep -q 'python315_amd64' private/extensions/python.bzl || { echo "phase C: 3.15 archive missing from extension"; exit 1; }
grep -q '3.15.0+20990105' private/extensions/python.bzl || { echo "phase C: 3.15 archive version wrong"; exit 1; }
update_test_versions_python
[ -f python/testdata/python3.15.yaml ] || { echo "phase C: python3.15.yaml not created"; exit 1; }
grep -q 'Python 3.15.0' python/testdata/python3.15.yaml || { echo "phase C: python3.15.yaml version wrong"; exit 1; }
sed_inplace "\$s/Python 3.15.0/Python 3.15.0b4/" python/testdata/python3.15.yaml
update_test_versions_python >/dev/null
! grep -q '3.15.0b4' python/testdata/python3.15.yaml || { echo "stale symlink test version was not repaired"; exit 1; }

# --- convergence and consistency ---------------------------------------------
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

# --- validation, dry run and repair --------------------------------------------
# Validation failures and dry runs must preserve every generated file.
snapshot() {
  cksum private/extensions/python.bzl python/config.bzl MODULE.bazel python/testdata/*.yaml python/update_python_archives_test.sh
}
before=$(snapshot)
cp python/config.bzl config.good
for defect in minor architecture nonstring duplicate_arch; do
  case "$defect" in
    minor) sed_inplace 's/"3.15"/"3.15rc1"/g' python/config.bzl ;;
    architecture) sed_inplace 's/"arm64"/"unknown-arch"/g' python/config.bzl ;;
    nonstring) sed_inplace 's/"arm64"/64/g' python/config.bzl ;;
    duplicate_arch) sed_inplace 's/"amd64"/"amd64", "amd64"/g' python/config.bzl ;;
  esac
  if run_updater; then echo "accepted invalid matrix $defect"; exit 1; fi
  cp config.good python/config.bzl
  [ "$(snapshot)" = "$before" ] || { echo "invalid matrix changed generated files"; exit 1; }
done
[ "$(DRY_RUN=1 run_updater)" = "NO_CHANGE" ]
[ "$(snapshot)" = "$before" ]
echo '{"tag": "20990106"}' > release.json
make_sha256sums 20990106 3.13.16 3.14.8 3.15.0
[ "$(DRY_RUN=1 run_updater)" = "DRY_RUN" ]
[ "$(snapshot)" = "$before" ]
for defect in duplicate malformed versions; do
  make_sha256sums 20990106 3.13.16 3.14.8 3.15.0
  case "$defect" in
    duplicate) duplicate=$(head -1 SHA256SUMS); echo "$duplicate" >> SHA256SUMS ;;
    malformed) sed_inplace "s/${SHA_A}/invalid/" SHA256SUMS ;;
    versions) sed_inplace 's/3.14.8+20990106-aarch64/3.14.7+20990106-aarch64/' SHA256SUMS ;;
  esac
  if run_updater; then echo "accepted invalid $defect fixture"; exit 1; fi
  [ "$(snapshot)" = "$before" ] || { echo "$defect mutated generated files"; exit 1; }
done
echo '{"tag": "20990105"}' > release.json
make_sha256sums 20990105 3.13.16 3.14.8 3.15.0
sed_inplace "s/${SHA_A}/0000000000000000000000000000000000000000000000000000000000000000/" private/extensions/python.bzl
[ "$(run_updater)" = "20990105" ] || { echo "checksum pin was not repaired"; exit 1; }
[ "$(run_updater)" = "NO_CHANGE" ]

# Exercise release discovery through the CLI, including primary-source failure.
mkdir "$FIX/bin"
cat > "$FIX/bin/curl" <<'EOF'
#!/usr/bin/env bash
case "$*" in
  *latest-release.json*) exit 22 ;;
  *releases/latest*) printf '{"tag_name":"20990105"}' ;;
  *SHA256SUMS*) cat "$PBS_SHA_FIXTURE" ;;
  *) exit 22 ;;
esac
EOF
chmod +x "$FIX/bin/curl"
before=$(snapshot)
PATH="$FIX/bin:$PATH" PBS_SHA_FIXTURE="$FIX/SHA256SUMS" \
  bash knife update-python-archives --dry-run > "$FIX/cli.out"
grep -q 'python archives are up to date' "$FIX/cli.out"
[ "$(snapshot)" = "$before" ]

# Shell command failures must propagate through knife's conditional capture.
# shellcheck disable=SC2329 # Exported for the child Bash process.
jq() { command jq "$@"; return 37; }
export -f jq
if PATH="$FIX/bin:$PATH" \
  PBS_SHA_FIXTURE="$FIX/SHA256SUMS" bash knife update-python-archives > "$FIX/cli.out" 2>&1; then
  echo "CLI ignored a failed shell command"; exit 1
fi
[ "$(snapshot)" = "$before" ]
unset -f jq

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
