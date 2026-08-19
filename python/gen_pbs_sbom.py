#!/usr/bin/env python3
"""Emit an SPDX 2.3 SBOM for a python-build-standalone release.

Reads the release's component manifest (pythonbuild/downloads.py) and lists
the runtime components: the CPython versions, bundled pip, and the
native libraries statically linked into the interpreters. Build-time-only
tools (autoconf, binutils, musl, llvm, ...) are excluded.

Usage: gen_pbs_sbom.py <downloads.py> <release> <output.spdx.json>
"""
import datetime
import importlib.util
import json
import sys

LICENSE_REF = {"bzip2-1.0.6": "LicenseRef-bzip2-1.0.6"}
# Bundled pypi components whose license the PBS manifest does not carry;
# stable, well-known values (used only as fallback when licenses=[]).
PYPI_LICENSE = {"pip": "MIT"}


def declared(name, entry):
    ids = entry.get("licenses") or []
    if not ids and name in PYPI_LICENSE:
        ids = [PYPI_LICENSE[name]]
    out = [LICENSE_REF.get(i) or i for i in ids]
    if not ids and entry.get("library_names"):
        out = ["LicenseRef-Public-Domain"]  # sqlite: no SPDX id for public domain
    return " AND ".join(out) if out else "NOASSERTION"


def purl(name, version):
    if name in PYPI_LICENSE:
        return "pkg:pypi/{}@{}".format(name, version)
    # C libraries built from source tarballs: generic purl (trivy skips these
    # for vuln/license scanning by design; the purl is provenance metadata).
    return "pkg:generic/{}@{}".format(name, version)


def is_runtime(name, entry):
    # pip is bundled in site-packages; setuptools is a PBS build-time tool and
    # is NOT shipped in install_only tarballs (verified against 3.13.15+20260814).
    return name.startswith("cpython") or name == "pip" or bool(entry.get("library_names"))


def main():
    manifest, release, output = sys.argv[1], sys.argv[2], sys.argv[3]
    spec = importlib.util.spec_from_file_location("pbs_downloads", manifest)
    if spec is None or spec.loader is None:
        sys.exit("cannot load manifest: " + manifest)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    downloads = module.DOWNLOADS

    doc = {
        "spdxVersion": "SPDX-2.3",
        "dataLicense": "CC0-1.0",
        "SPDXID": "SPDXRef-DOCUMENT",
        "name": "python-build-standalone-{}-linux".format(release),
        "documentNamespace": "https://github.com/astral-sh/python-build-standalone/releases/tag/{}/spdx.json".format(release),
        "creationInfo": {
            "created": datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
            "creators": ["Tool: distroless-pbs-sbom (python/gen_pbs_sbom.py)"],
        },
        "packages": [
            {
                "name": "python-build-standalone",
                "SPDXID": "SPDXRef-PBS",
                "versionInfo": release,
                "downloadLocation": "https://github.com/astral-sh/python-build-standalone/releases/tag/{}".format(release),
                "licenseConcluded": "NOASSERTION",
                "licenseDeclared": "NOASSERTION",
                "supplier": "Organization: astral-sh",
                "filesAnalyzed": False,
            }
        ],
        "relationships": [],
    }
    for name, entry in sorted(downloads.items()):
        if not is_runtime(name, entry):
            continue
        pid = "SPDXRef-" + name.replace("-", "_").replace(".", "_")
        # prefer actual_version (sqlite ships its SQLITE_VERSION_NUMBER, e.g.
        # 3530100, in `version` alongside actual_version 3.53.1.0)
        version = str(entry.get("actual_version") or entry.get("version", ""))
        doc["packages"].append(
            {
                "name": name,
                "SPDXID": pid,
                "versionInfo": version,
                "downloadLocation": entry.get("url", "NOASSERTION"),
                "licenseConcluded": "NOASSERTION",
                "licenseDeclared": declared(name, entry),
                "externalRefs": [
                    {
                        "referenceCategory": "PACKAGE-MANAGER",
                        "referenceType": "purl",
                        "referenceLocator": purl(name, version),
                    }
                ],
                "checksums": [{"algorithm": "SHA256", "checksumValue": entry.get("sha256", "")}],
                "filesAnalyzed": False,
            }
        )
        doc["relationships"].append(
            {
                "spdxElementId": "SPDXRef-PBS",
                "relationshipType": "CONTAINS",
                "relatedSpdxElement": pid,
            }
        )
    with open(output, "w") as fh:
        json.dump(doc, fh, indent=1)
        fh.write("\n")


if __name__ == "__main__":
    main()
