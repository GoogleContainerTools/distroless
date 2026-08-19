#!/usr/bin/env python3
"""Check the pinned PBS native libraries against NVD CVE data.

The native libraries embedded in python-build-standalone releases (openssl,
sqlite, zlib, expat, bzip2, ncurses, xz) are source pins (`pkg:generic`) that
trivy and other SBOM scanners cannot match against advisory feeds. NVD tracks
them as CPE products with per-version CVE data, so this queries the NVD API 2.0
with the exact version pinned in the SBOM (which the updater has already
verified against the binary) and fails on HIGH/CRITICAL findings.

False-positive filtering: the NVD `cpeName` query also returns CVEs of other
products (mutt, OpenLDAP, httpd, ...) whose configurations merely reference the
library. A CVE is reported only when the library's own CPE appears as
vulnerable=true in its configuration.

Usage:
  pbs_cve_check.py <sbom.spdx.json>
  pbs_cve_check.py <sbom.spdx.json> --nvd-fixture <response.json>   # hermetic tests

Env: NVD_API_KEY (optional; removes the unauthenticated rate-limit sleeps).
Exit 0: no CVEs or none HIGH/CRITICAL on pinned versions. Exit 1: findings.
"""
import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

# SBOM component name -> NVD CPE vendor/product (all verified extractable from
# the binary by python/pbs_embedded_versions.py).
CPES = {
    "openssl-3.5": ("openssl", "openssl"),
    "sqlite": ("sqlite", "sqlite"),
    "zlib": ("zlib", "zlib"),
    "expat": ("libexpat", "expat"),
    "bzip2": ("bzip2", "bzip2"),
    "ncurses": ("gnu", "ncurses"),
    "xz": ("tukaani", "xz"),
}
GATE = {"HIGH", "CRITICAL"}


def cpe_version(name, version):
    # sqlite's actual_version is "3.53.1.0"; NVD CPEs use "3.53.1".
    if name == "sqlite" and version.endswith(".0"):
        return version[:-2]
    return version


def fetch_nvd(cpe, api_key, fixture):
    if fixture is not None:
        return fixture.get(cpe, {"vulnerabilities": []})
    url = "https://services.nvd.nist.gov/rest/json/cves/2.0?cpeName=" + urllib.parse.quote(cpe, safe=":")
    req = urllib.request.Request(url, headers={"User-Agent": "distroless-pbs-cve-check"})
    if api_key:
        req.add_header("apiKey", api_key)
    for attempt in range(4):
        try:
            with urllib.request.urlopen(req, timeout=60) as resp:
                return json.load(resp)
        except urllib.error.HTTPError as err:
            if err.code == 429:
                time.sleep(10 * (attempt + 1))  # unauthenticated rate limit: ~5 req/30s
                continue
            raise
    sys.exit("NVD API rate limited for " + cpe)


def affects(cve, vendor, product):
    # walk every configuration, recursing into children nodes (NVD nests
    # dependency/AND-OR groups); keep only vulnerable matches on the product.
    def walk(nodes):
        for node in nodes:
            for match in node.get("cpeMatch", []):
                parts = match["criteria"].split(":")
                if len(parts) > 5 and parts[3] == vendor and parts[4] == product and match.get("vulnerable"):
                    return True
            if walk(node.get("children", [])):
                return True
        return False
    for config in cve.get("configurations") or []:
        if walk(config.get("nodes", [])):
            return True
    return False


def severity(cve):
    metrics = cve.get("metrics", {})
    for key in ("cvssMetricV31", "cvssMetricV30", "cvssMetricV2"):
        if metrics.get(key):
            return metrics[key][0]["cvssData"].get("baseSeverity", "UNKNOWN")
    return "UNKNOWN"


def main():
    sbom_path, rest = sys.argv[1], sys.argv[2:]
    fixture = None
    if rest and rest[0] == "--nvd-fixture":
        fixture = json.load(open(rest[1]))
    doc = json.load(open(sbom_path))
    versions = {p["name"]: p["versionInfo"] for p in doc["packages"]}

    findings = []
    for name, (vendor, product) in sorted(CPES.items()):
        if name not in versions:
            continue
        cpe = "cpe:2.3:a:{}:{}:{}".format(vendor, product, cpe_version(name, versions[name]))
        data = fetch_nvd(cpe, os.environ.get("NVD_API_KEY", ""), fixture)
        for vuln in data.get("vulnerabilities", []):
            cve = vuln["cve"]
            if affects(cve, vendor, product):
                desc = cve["descriptions"][0]["value"][:90] if cve.get("descriptions") else ""
                findings.append((severity(cve), name, cve["id"], desc))

    if not findings:
        print("no CVEs found for pinned PBS native libraries")
        return 0
    for sev, name, cid, desc in sorted(findings):
        print("{} {} {} {}".format(sev.ljust(8), name.ljust(10), cid, desc))
    if any(sev in GATE for sev, _, _, _ in findings):
        print("HIGH/CRITICAL CVEs on pinned versions - update blocked")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
