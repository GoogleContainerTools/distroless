#!/usr/bin/env bash
# Hermetic test for python/pbs_cve_check.py (NVD CPE check for the pinned
# native libraries): clean fixture exits 0, HIGH/CRITICAL fixture exits 1 and
# reports the library's own CVE while ignoring other-product false positives
# (mutt-style CPE references with vulnerable=false).
set -euo pipefail

cd "$TEST_SRCDIR/${TEST_WORKSPACE:-_main}"

out=$(python3 python/pbs_cve_check.py python/testdata/cve_sbom_mini.json --nvd-fixture python/testdata/cve_fixture_clean.json)
echo "$out" | grep -q 'no CVEs found' || { echo "clean: expected no findings"; exit 1; }

set +e
out=$(python3 python/pbs_cve_check.py python/testdata/cve_sbom_mini.json --nvd-fixture python/testdata/cve_fixture_high.json 2>&1)
rc=$?
set -e
[ "$rc" = 1 ] || { echo "high: expected exit 1, got $rc"; exit 1; }
echo "$out" | grep -q 'CVE-2026-99999' || { echo "high: openssl CVE missing"; exit 1; }
echo "$out" | grep -q 'CVE-2026-00001' || { echo "high: MEDIUM zlib CVE should still be reported"; exit 1; }
! echo "$out" | grep -q 'CVE-2009-1390' || { echo "high: mutt false positive leaked"; exit 1; }
echo "$out" | grep -q 'update blocked' || { echo "high: gate message missing"; exit 1; }

echo "pbs_cve_check OK"
