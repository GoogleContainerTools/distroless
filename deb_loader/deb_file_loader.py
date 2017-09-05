#!/usr/bin/env python
"""A tool for downloading deb packages"""

# Copyright 2017 mgIT GmbH All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import argparse
import hashlib
import json
import urllib
# Python 2/3 compatibility:
try:
    from urllib.parse import urljoin
except ImportError:
    from urlparse import urljoin

PARSER = argparse.ArgumentParser(
    description="Downloads and validates deb packages from package sources")

PARSER.add_argument(
    "--rule_name",
    action='store',
    help='The name of the rule in the WORKSPACE file')
PARSER.add_argument(
    "--distro_type",
    action='store',
    help='The distribution type to use (e.g. "debian")')
PARSER.add_argument(
    "--distro",
    action='store',
    help='The actual distribution name (e.g. "jessie")')
PARSER.add_argument(
    "--arch",
    action='store',
    help='The package architecture to use (e.g. "amd64")')
PARSER.add_argument(
    "--packages_dict",
    action='store',
    type=json.loads,
    help=
    'A JSON-encoded dictionary of packages to use with the path to them as value'
)
PARSER.add_argument(
    "--packages_sha256_dict",
    action='store',
    type=json.loads,
    help=
    'A JSON-encoded dictionary of packages to use with the corresponding SHA256 hash as value'
)
PARSER.add_argument(
    "--mirrors_list",
    action='store',
    type=json.loads,
    help='A JSON-encoded list of mirrors to use')


def download_deb(mirrorlist, sha256_hash, deb_path):
    """Download a deb file from a list of mirrors"""
    success = False
    for mirror in mirrorlist:
        # Append eventually missing slash to mirror
        if not mirror.endswith("/"):
            mirror = mirror + "/"
        url = urljoin(mirror, deb_path)
        # get the part after the last slash
        pkgname = url.rsplit('/', 1)[-1]
        # Rename to the hash it is supposed to have
        filename = sha256_hash.lower() + ".deb"
        try:
            urllib.urlretrieve(url, "debs/" + filename)
            print("Downloaded file {} from mirror {} with url {}".format(
                pkgname, mirror, url))
            success = True
            break
        except BaseException as exception:
            print("Could not load file {} from mirror {} with url {}".format(
                pkgname, mirror, url))
            print("Exception thrown: {}".format(exception))
            continue
    if success:
        return filename
    else:
        raise Exception(
            "Could not load file {} from any supplied mirror".format(pkgname))


def verify_deb(filename, sha256_hash, package_name):
    """Verify that the hash of a given file matches a supplied hash"""
    sha256 = hashlib.sha256()
    with open("debs/" + filename, 'rb') as debfile:
        for block in iter(lambda: debfile.read(65536), b''):
            sha256.update(block)
    actual_hash = sha256.hexdigest()
    if not actual_hash.lower() == sha256_hash.lower():
        raise Exception(
            "Hashes of downloaded file {} do not match. Got {}, expected {}".
            format(package_name, actual_hash, sha256_hash))


def main(args):
    """A tool for downloading deb packages"""
    debian = False
    ubuntu = False
    if args.distro_type.lower() == "debian":
        debian = True
    elif args.distro_type.lower() == "ubuntu":
        ubuntu = True
    else:
        # For now the distro_type is not used beyond this point.
        # There might be some other distributions with different layouts in the future.
        raise NotImplementedError(
            "Only debian and ubuntu are supported in distro_type at the moment"
        )
    package_to_rule_dict = {}
    for package in args.packages_dict:
        if package not in args.packages_sha256_dict:
            raise Exception(
                "Package {} was not found in packages_sha256.".format(package))
        # download deb
        filename = download_deb(args.mirrors_list,
                                args.packages_sha256_dict[package],
                                args.packages_dict[package])
        verify_deb(filename, args.packages_sha256_dict[package], package)
        # add to package_to_rule_dict
        package_to_rule_dict[
            package] = "@" + args.rule_name + "//debs:" + filename

    with open("debs/deb_packages.bzl", "w") as packagefile:
        packagefile.write(args.rule_name + " = " +
                          json.dumps(package_to_rule_dict))


if __name__ == "__main__":
    ARGS = PARSER.parse_args()
    main(ARGS)
