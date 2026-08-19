#!/usr/bin/env python3
"""Verify the native libraries statically linked into a PBS libpython .so.

python-build-standalone compiles the C libraries (openssl, sqlite, zlib, ...)
into libpython3.x.so at release build time. No SBOM scanner can see them there
(trivy's binary detection does not cover statically embedded libs), and a
release can bump them while the CPython version stays unchanged - invisible
when only the python version pin is tracked. This dissects the binary for the
version markers those libraries leave behind and compares them against the
release manifest (pythonbuild/downloads.py).

Marker patterns were empirically verified against cpython-3.13.15+20260814:
  strong  openssl  "OpenSSL 3.5.7 9 Jun 2026"
          zlib     "deflate 1.3.2 Copyright 1995-2026 Jean-loup Gailly"
          expat    "expat_2.8.3"
          ncurses  "ncurses 6.5.20240427"   (manifest keeps the 6.5 prefix)
          bzip2    "1.0.8, 13-Jul-2019"
  weak    sqlite   bare "3.53.1" literal (manifest actual_version)
          xz       bare "5.8.3" literal
  absent  libffi, readline, gdbm, tcl, uuid, libedit, libX11, libxcb: no
          version string is embedded -> reported unverifiable, never fails.

Usage: pbs_embedded_versions.py <libpython.so> <downloads.py>
Exit code 0 = every extractable manifest library matches the binary;
1 = a library's embedded version differs from the manifest (drift).
"""
import importlib.util
import re
import sys

# manifest key -> (regex with one capture group for the version)
STRONG = [
    ("openssl-3.5", re.compile(rb"OpenSSL (\d+\.\d+\.\d+[a-z]?)\s+\d{1,2} [A-Z][a-z]{2} \d{4}")),
    ("openssl-1.1", re.compile(rb"OpenSSL (1\.1\.1[a-z]?)\s+\d{1,2} [A-Z][a-z]{2} \d{4}")),
    ("zlib", re.compile(rb"deflate (\d+\.\d+\.\d+) Copyright")),
    ("expat", re.compile(rb"expat_(\d+\.\d+\.\d+)")),
    ("ncurses", re.compile(rb"ncurses (\d+\.\d+\.\d+(?:\.\d+)?)")),
    ("bzip2", re.compile(rb"(\d+\.\d+\.\d+), \d{1,2}-[A-Z][a-z]{2}-\d{4}")),
]
# manifest keys with only a bare version literal: presence check (weak)
WEAK = ("sqlite", "xz")


def load_manifest(path):
    spec = importlib.util.spec_from_file_location("pbs_downloads", path)
    if spec is None or spec.loader is None:
        sys.exit("cannot load manifest: " + path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.DOWNLOADS


def expected_version(entry):
    """Human version for the manifest entry: actual_version when present
    (sqlite ships its SQLITE_VERSION_NUMBER in `version`, e.g. 3530100,
    alongside actual_version 3.53.1.0), else `version` as-is."""
    v = entry.get("actual_version") or entry.get("version") or ""
    return re.sub(r"\.0$", "", v)


def marker_version(blob, regex, name, entry):
    match = regex.search(blob)
    if not match:
        return None  # marker absent (library not linked into this .so)
    return match.group(1).decode()


def check_weak(blob, name, entry):
    expected = expected_version(entry)
    if not expected:
        return None
    # bare literal with non-digit boundaries: "3.53.1" must not match "3.53.10"
    pattern = re.compile(rb"(?<![0-9])" + re.escape(expected.encode()) + rb"(?![0-9])")
    return expected if pattern.search(blob) else None


def main():
    so_path, manifest_path = sys.argv[1], sys.argv[2]
    with open(so_path, "rb") as fh:
        blob = fh.read()
    downloads = load_manifest(manifest_path)

    failures = 0
    for name, regex in STRONG:
        if name not in downloads:
            continue
        found = marker_version(blob, regex, name, downloads[name])
        if found is None:
            print("ABSENT   {:<10} (no version marker in binary)".format(name))
            continue
        expected = expected_version(downloads[name])
        if found == expected or (name == "ncurses" and found.startswith(expected)):
            print("OK       {:<10} {}".format(name, found))
        else:
            print("MISMATCH {:<10} manifest={} binary={}".format(name, expected, found))
            failures += 1
    for name in WEAK:
        if name not in downloads:
            continue
        found = check_weak(blob, name, downloads[name])
        expected = expected_version(downloads[name])
        if found is None:
            print("MISMATCH {:<10} manifest={} binary=(no bare version literal)".format(name, expected))
            failures += 1
        else:
            print("OK       {:<10} {} (weak marker)".format(name, found))

    if failures:
        print("PBS embedded native libraries drift detected (see above)", file=sys.stderr)
        sys.exit(1)
    print("embedded native libraries verified against the release manifest")


if __name__ == "__main__":
    main()
