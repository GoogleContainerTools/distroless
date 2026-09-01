#!/usr/bin/env bash
# Hermetic test for python/pbs_cve_check.py (NVD CPE check for the pinned
# native libraries): clean fixture exits 0, HIGH/CRITICAL fixture exits 1 and
# reports the library's own CVE while ignoring other-product false positives
# (mutt-style CPE references with vulnerable=false).
set -euo pipefail

cd "$TEST_SRCDIR/${TEST_WORKSPACE:-_main}"

python3 - <<'PY'
import sys
sys.path.insert(0, "python")
from pbs_cve_check import cpe_version
assert cpe_version("sqlite", "3.53.1.0") == "3.53.1"
assert cpe_version("openssl-1.1", "1.1.1w") == "1.1.1w"
PY

out=$(python3 python/pbs_cve_check.py python/testdata/cve_sbom_mini.json --nvd-fixture python/testdata/cve_fixture_clean.json)
echo "$out" | grep -q 'no CVEs found' || { echo "clean: expected no findings"; exit 1; }

set +e
out=$(python3 python/pbs_cve_check.py python/testdata/cve_sbom_mini.json --nvd-fixture python/testdata/cve_fixture_high.json 2>&1)
rc=$?
set -e
[ "$rc" = 1 ] || { echo "high: expected exit 1, got $rc"; exit 1; }
echo "$out" | grep -q 'CVE-2026-99999' || { echo "high: openssl CVE missing"; exit 1; }
echo "$out" | grep -q 'CVE-2026-11111' || { echo "high: openssl 1.1 CVE missing"; exit 1; }
echo "$out" | grep -q 'CVE-2026-00001' || { echo "high: MEDIUM zlib CVE should still be reported"; exit 1; }
echo "$out" | grep -q 'sqlite.*embedded=3.53.1.*fixed=3.53.2.*CVE-2026-11822' || { echo "high: sqlite version/fix missing"; exit 1; }
echo "$out" | grep -q 'PBS release 20260814 affected' || { echo "high: PBS release footer missing"; exit 1; }
! echo "$out" | grep -q 'CVE-2009-1390' || { echo "high: mutt false positive leaked"; exit 1; }
echo "$out" | grep -q 'update blocked' || { echo "high: gate message missing"; exit 1; }
echo "$out" | grep -q 'mpdecimal.*no NVD CPE mapping' || { echo "high: unmapped component was not reported"; exit 1; }

echo "pbs_cve_check OK"
