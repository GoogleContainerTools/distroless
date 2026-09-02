#!/usr/bin/env python3
"""Verify native libraries embedded in a PBS libpython shared object.

The PBS manifest lists source components, while selected libraries are statically
linked into libpython. Compare detectable version markers with the manifest.

Usage: pbs_embedded_versions.py <libpython.so> <downloads.py>
"""
import ast
import re
import sys


# Manifest key to a version-marker pattern with one capture group.
STRONG = [
    ("openssl-3.5", re.compile(rb"OpenSSL (\d+\.\d+\.\d+[a-z]?)\s+\d{1,2} [A-Z][a-z]{2} \d{4}")),
    ("openssl-1.1", re.compile(rb"OpenSSL (1\.1\.1[a-z]?)\s+\d{1,2} [A-Z][a-z]{2} \d{4}")),
    ("zlib", re.compile(rb"deflate (\d+\.\d+\.\d+) Copyright")),
    ("expat", re.compile(rb"expat_(\d+\.\d+\.\d+)")),
    ("ncurses", re.compile(rb"ncurses (\d+\.\d+\.\d+(?:\.\d+)?)")),
    ("bzip2", re.compile(rb"(\d+\.\d+\.\d+), \d{1,2}-[A-Z][a-z]{2}-\d{4}")),
]
WEAK = ("sqlite", "xz", "zstd", "mpdecimal")


def load_manifest(path):
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


def expected_version(entry, name=None):
    value = entry.get("actual_version") or entry.get("version") or ""
    if name == "sqlite":
        return re.sub(r"\.0$", "", value)
    return value


def marker_version(blob, regex):
    match = regex.search(blob)
    return match.group(1).decode() if match else None


def weak_version(blob, name, entry):
    expected = expected_version(entry, name)
    pattern = re.compile(rb"(?<![0-9])" + re.escape(expected.encode()) + rb"(?![0-9])")
    return expected if expected and pattern.search(blob) else None


def main():
    so_path, manifest_path = sys.argv[1], sys.argv[2]
    with open(so_path, "rb") as fh:
        blob = fh.read()
    downloads = load_manifest(manifest_path)

    failures = 0
    for name, regex in STRONG:
        if name not in downloads:
            continue
        found = marker_version(blob, regex)
        if found is None:
            print("ABSENT   {:<10} (no version marker in binary)".format(name))
            continue
        expected = expected_version(downloads[name], name)
        if found == expected or (name == "ncurses" and found.startswith(expected)):
            print("OK       {:<10} {}".format(name, found))
        else:
            print("MISMATCH {:<10} manifest={} binary={}".format(name, expected, found))
            failures += 1

    for name in WEAK:
        if name not in downloads:
            continue
        found = weak_version(blob, name, downloads[name])
        expected = expected_version(downloads[name], name)
        if found is None:
            print("ABSENT   {:<10} manifest={} binary=(no version literal)".format(name, expected))
        else:
            print("OK       {:<10} {} (weak marker)".format(name, found))

    if failures:
        print("PBS embedded native-library drift detected (see above).", file=sys.stderr)
        return 1
    print("Embedded native libraries verified against the release manifest.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
