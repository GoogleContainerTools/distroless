#!/usr/bin/env python3
"""Offline contracts for PBS provenance and binary-marker verification."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

import gen_pbs_sbom as sbom
import pbs_embedded_versions as embedded


class MetadataTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.manifest = self.root / "manifest"

    def test_manifest_is_data(self):
        self.manifest.write_text('raise RuntimeError("must not execute")\nDOWNLOADS: dict = {"zlib": {"version": "1.3.2"}}')
        self.assertEqual(embedded.load_manifest(self.manifest), {"zlib": {"version": "1.3.2"}})
        for value in ('{}', '[]', '{"": {}}', '{"zlib": []}', 'dict(zlib={})'):
            with self.subTest(value=value), self.assertRaises(ValueError):
                self.manifest.write_text("DOWNLOADS = " + value)
                sbom.load_downloads(self.manifest)

    def generate(self, entries):
        self.manifest.write_text("DOWNLOADS = " + repr(entries))
        output = self.root / "sbom.json"
        with patch.object(sys, "argv", ["gen_pbs_sbom.py", str(self.manifest), "20990101", str(output)]):
            sbom.main()
        return json.loads(output.read_text())

    def test_spdx_provenance(self):
        entries = {
            "cpython-3.14": {"version": "3.14.7", "sha256": "a" * 64, "licenses": ["Python-2.0"]},
            "bzip2": {"version": "1.0.8", "library_names": ["bz2"], "licenses": ["bzip2-1.0.6"]},
            "sqlite": {"actual_version": "3.53.1.0", "library_names": ["sqlite3"]},
            "pip": {"version": "26.1"},
            "autoconf": {"version": "2.72"},
            "llvm-x86_64-linux": {"version": "21.1.0"},
        }
        doc = self.generate(entries)
        packages = {p["name"]: p for p in doc["packages"]}
        self.assertEqual(set(packages), {"python-build-standalone", "cpython-3.14", "bzip2", "sqlite", "pip"})
        for package in packages.values():
            self.assertRegex(package["SPDXID"], r"^SPDXRef-[A-Za-z0-9.-]+$")
        self.assertEqual(packages["bzip2"]["licenseDeclared"], "bzip2-1.0.6")
        self.assertEqual(packages["sqlite"]["licenseDeclared"], "NOASSERTION")
        self.assertNotIn("checksums", packages["sqlite"])
        self.assertEqual(packages["cpython-3.14"]["checksums"][0]["checksumValue"], "a" * 64)
        self.assertEqual(packages["pip"]["externalRefs"][0]["referenceLocator"], "pkg:pypi/pip@26.1")
        self.assertEqual(doc["relationships"][0]["relationshipType"], "DESCRIBES")
        self.assertNotEqual(doc["documentNamespace"], self.generate(entries)["documentNamespace"])

    def test_bad_metadata_fails_before_output(self):
        for entries in ({}, {"pip": {}}, {"pip": {"version": None}},
                        {"pip": {"version": "1", "sha256": "wrong"}},
                        {"bad_name": {"version": "1", "library_names": ["bad"]}}):
            with self.subTest(entries=entries), self.assertRaises(SystemExit):
                self.generate(entries)
        self.assertFalse((self.root / "sbom.json").exists())

    def test_version_boundaries(self):
        self.assertEqual(embedded.expected_version({"actual_version": "3.53.1.0"}, "sqlite"), "3.53.1")
        self.assertEqual(embedded.expected_version({"version": "4.0.0"}, "mpdecimal"), "4.0.0")
        for blob in (b"13.53.1", b"3.53.10", b"3.53.1.2", b"1.3.53.1"):
            self.assertIsNone(embedded.weak_version(blob, "sqlite", {"actual_version": "3.53.1.0"}))
        self.assertEqual(embedded.weak_version(b"\x003.53.1\x00", "sqlite", {"version": "3.53.1"}), "3.53.1")

    def test_marker_drift_and_limited_coverage(self):
        self.manifest.write_text('DOWNLOADS = {"ncurses": {"version": "6.5"}, "xz": {"version": "5.8.3"}}')
        library = self.root / "libpython.so"
        for blob, status in ((b"ncurses 6.5.20240427", 0), (b"ncurses 6.50.20240427", 1), (b"", 0)):
            with self.subTest(blob=blob):
                library.write_bytes(blob)
                result = subprocess.run([sys.executable, embedded.__file__, str(library), str(self.manifest)], capture_output=True, text=True)
                self.assertEqual(result.returncode, status, result.stderr)
                self.assertIn("ABSENT", result.stdout)
                if status == 0:
                    self.assertIn("unverified", result.stdout)

    def test_failed_ldconfig_cannot_replace_cache(self):
        cache = self.root / "python/ldconfig/ld.so.cache.arm64"
        cache.parent.mkdir(parents=True)
        cache.write_text("original cache")
        docker = self.root / "docker"
        docker.write_text('''#!/usr/bin/env bash
case "$1" in
  create) echo fixture-container ;;
  start|rm) exit 0 ;;
  inspect) echo 1 ;;
  cp) echo "must not copy a failed container" >&2; exit 99 ;;
esac
''')
        docker.chmod(0o755)
        script = Path(__file__).parent / "ldconfig/ldconfig.sh"
        result = subprocess.run(["bash", str(script.resolve()), "update", "arm64"], cwd=self.root,
                                env={**os.environ, "PATH": str(self.root) + os.pathsep + os.environ["PATH"],
                                     "BUILD_WORKSPACE_DIRECTORY": ""}, capture_output=True, text=True)
        self.assertEqual(result.returncode, 1)
        self.assertIn("ldconfig failed", result.stderr)
        self.assertEqual(cache.read_text(), "original cache")


if __name__ == "__main__":
    unittest.main()
