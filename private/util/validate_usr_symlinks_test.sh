#!/usr/bin/env bash
set -euo pipefail

# Bazel runfiles resolution
# shellcheck source=/dev/null
source "${RUNFILES_DIR:-/dev/null}/bazel_tools/tools/bash/runfiles/runfiles.bash" 2>/dev/null ||
  source "$(dirname "$0")/../bazel_tools/tools/bash/runfiles/runfiles.bash" 2>/dev/null ||
  { echo >&2 "ERROR: cannot find runfiles.bash"; exit 1; }

GAWK="$(rlocation gawk/gawk)"
AWK_SCRIPT="$(rlocation distroless/private/util/validate_usr_symlinks.awk)"

run() {
    printf '%s\n' "$1" | "$GAWK" -v validation_output_file=/dev/null -f "$AWK_SCRIPT"
}

fail() { echo "FAIL: $*" >&2; exit 1; }

# --- passing cases ---

run "./bin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/bin" \
  || fail "./bin -> usr/bin should pass"

run "/bin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/bin" \
  || fail "/bin -> usr/bin should pass"

run "bin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/bin" \
  || fail "bin -> usr/bin should pass"

run "./sbin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/sbin" \
  || fail "./sbin -> usr/sbin should pass"

run "./lib type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/lib" \
  || fail "./lib -> usr/lib should pass"

run "./lib32 type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/lib32" \
  || fail "./lib32 -> usr/lib32 should pass"

run "./lib64 type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/lib64" \
  || fail "./lib64 -> usr/lib64 should pass"

run "./lib64 type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/lib64
./usr/bin/ls type=file mode=0755 nlink=1 uid=0 gid=0 size=12345" \
  || fail "content under ./usr/ alongside valid symlinks should pass"

run "/home/user/bin type=dir mode=0755 nlink=2 uid=1000 gid=1000" \
  || fail "deep paths containing 'bin' should pass"

# --- failing cases ---

run "./bin type=dir mode=0755 nlink=2 uid=0 gid=0" \
  && fail "./bin as a directory should fail" || true

run "//bin type=dir mode=0755 nlink=2 uid=0 gid=0" \
  && fail "//bin as a directory should fail" || true

run "././bin type=dir mode=0755 nlink=2 uid=0 gid=0" \
  && fail "././bin as a directory should fail" || true

run "./bin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/sbin" \
  && fail "./bin -> usr/sbin should fail" || true

run "bin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/fin" \
  && fail "bin -> usr/fin should fail" || true

run "/bin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/fin" \
  && fail "/bin -> usr/fin should fail" || true

run "//bin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/fin" \
  && fail "//bin -> usr/fin should fail" || true

run "././bin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/fin" \
  && fail "././bin -> usr/fin should fail" || true

run "./sbin type=link mode=0777 nlink=1 uid=0 gid=0 link=usr/bin" \
  && fail "./sbin -> usr/bin should fail (Debian keeps sbin separate)" || true

run "./lib/libfoo.so.1 type=file mode=0644 nlink=1 uid=0 gid=0 size=4096" \
  && fail "content under ./lib/ should fail" || true

run "lib/libfoo.so.1 type=file mode=0644 nlink=1 uid=0 gid=0 size=4096" \
  && fail "content under lib/ should fail" || true

run "/lib/libfoo.so.1 type=file mode=0644 nlink=1 uid=0 gid=0 size=4096" \
  && fail "content under /lib/ should fail" || true

run "./bin/ls type=file mode=0755 nlink=1 uid=0 gid=0 size=12345" \
  && fail "content under ./bin/ should fail" || true

echo "All tests passed."
