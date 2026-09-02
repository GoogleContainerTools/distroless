#!/usr/bin/env python3
"""Emit an SPDX 2.3 SBOM for a python-build-standalone release.

Reads the release component manifest and lists runtime components: the CPython
versions, bundled ensurepip wheel, and native libraries statically linked into
the interpreters. Build-time-only tools (autoconf, binutils, musl, llvm, ...)
are excluded. This is PBS release provenance, not a complete image SBOM.

Usage: gen_pbs_sbom.py <downloads.py> <release> <output.spdx.json>
"""
import ast
import datetime
import json
import sys

LICENSE_REF = {"bzip2-1.0.6": "LicenseRef-bzip2-1.0.6"}
# Bundled PyPI components whose licenses are absent from the manifest.
# These stable, well-known values are used only as fallbacks.
PYPI_LICENSE = {"pip": "MIT"}


def declared(name, entry):
    ids = entry.get("licenses") or []
    if not ids and name in PYPI_LICENSE:
        ids = [PYPI_LICENSE[name]]
    out = [LICENSE_REF.get(i) or i for i in ids]
    if not ids and entry.get("library_names"):
        out = ["LicenseRef-Public-Domain"]  # SQLite has no SPDX identifier for public domain.
    return " AND ".join(out) if out else "NOASSERTION"


def purl(name, version):
    if name in PYPI_LICENSE:
        return "pkg:pypi/{}@{}".format(name, version)
    # C libraries built from source tarballs use generic purls for provenance.
    return "pkg:generic/{}@{}".format(name, version)


def is_runtime(name, entry):
    # The pip wheel supports ensurepip but is not installed as a command;
    # setuptools is a PBS build-time tool and is not shipped in install_only.
    return name.startswith("cpython") or name == "pip" or bool(entry.get("library_names"))


def load_downloads(path):
    with open(path, encoding="utf-8") as fh:
        tree = ast.parse(fh.read(), filename=path)
    for node in tree.body:
        if isinstance(node, ast.Assign):
            targets = node.targets
        elif isinstance(node, ast.AnnAssign):
            targets = [node.target]
        else:
            continue
        if any(isinstance(target, ast.Name) and target.id == "DOWNLOADS" for target in targets):
            downloads = ast.literal_eval(node.value)
            if isinstance(downloads, dict):
                return downloads
            break
    raise ValueError("DOWNLOADS must be a literal dictionary")


def main():
    manifest, release, output = sys.argv[1], sys.argv[2], sys.argv[3]
    try:
        downloads = load_downloads(manifest)
    except (OSError, SyntaxError, ValueError) as err:
        sys.exit("cannot parse manifest {}: {}".format(manifest, err))

    doc = {
        "spdxVersion": "SPDX-2.3",
        "dataLicense": "CC0-1.0",
        "SPDXID": "SPDXRef-DOCUMENT",
        "name": "python-build-standalone-{}-linux".format(release),
        "documentNamespace": "https://github.com/astral-sh/python-build-standalone/releases/tag/{}/spdx.json".format(release),
        "creationInfo": {
            "created": datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
            "creators": ["Tool: distroless-pbs-sbom"],
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
        # Prefer actual_version; SQLite also stores SQLITE_VERSION_NUMBER in version.
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
