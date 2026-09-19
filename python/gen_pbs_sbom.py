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
import re
import sys
import uuid

# Bundled PyPI components whose licenses are absent from the manifest.
# These stable, well-known values are used only as fallbacks.
PYPI_LICENSE = {"pip": "MIT"}


def declared(name, entry):
    ids = entry.get("licenses") or []
    if not ids and name in PYPI_LICENSE:
        ids = [PYPI_LICENSE[name]]
    return " AND ".join(ids) if ids else "NOASSERTION"


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
            if isinstance(downloads, dict) and downloads and all(
                isinstance(name, str) and name
                and isinstance(entry, dict)
                for name, entry in downloads.items()
            ):
                return downloads
            break
    raise ValueError("DOWNLOADS must be a nonempty literal dictionary of component entries")


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
        "documentNamespace": "https://spdx.org/spdxdocs/python-build-standalone-{}-{}".format(release, uuid.uuid4()),
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
        "relationships": [{
            "spdxElementId": "SPDXRef-DOCUMENT",
            "relationshipType": "DESCRIBES",
            "relatedSpdxElement": "SPDXRef-PBS",
        }],
    }
    for name, entry in sorted(downloads.items()):
        if not is_runtime(name, entry):
            continue
        if not re.fullmatch(r"[A-Za-z0-9.-]+", name):
            sys.exit("invalid SPDX component name: " + name)
        pid = "SPDXRef-" + name
        # Prefer actual_version; SQLite also stores SQLITE_VERSION_NUMBER in version.
        version = entry.get("actual_version") or entry.get("version")
        if not isinstance(version, str) or not version:
            sys.exit("missing or invalid version for " + name)
        checksum = entry.get("sha256")
        if checksum is not None and (not isinstance(checksum, str) or not re.fullmatch(r"[0-9a-fA-F]{64}", checksum)):
            sys.exit("invalid SHA256 for " + name)
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
            }
        )
        if checksum is not None:
            doc["packages"][-1]["checksums"] = [{"algorithm": "SHA256", "checksumValue": checksum}]
        doc["packages"][-1]["filesAnalyzed"] = False
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
