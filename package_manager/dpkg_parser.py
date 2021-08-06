# Copyright 2017 Google Inc. All rights reserved.

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
import gzip
import json
import lzma  # requires python3
import os
import subprocess

from package_manager.parse_metadata import parse_package_metadata
from package_manager.version_utils import compare_versions
from package_manager import util

OUT_FOLDER = "file"
OS_RELEASE_PATH = "etc"
PACKAGES_FILE_NAME = os.path.join(OUT_FOLDER,"Packages.json")
PACKAGE_MAP_FILE_NAME = os.path.join(OUT_FOLDER,"packages.bzl")
OS_RELEASE_FILE_NAME = os.path.join(OS_RELEASE_PATH, "os-release")
OS_RELEASE_TAR_FILE_NAME = os.path.join(OUT_FOLDER, "os_release.tar")
DEB_FILE_NAME = os.path.join(OUT_FOLDER,"pkg.deb")

FILENAME_KEY = "Filename"
SHA256_KEY = "SHA256"
VERSION_KEY = "Version"

parser = argparse.ArgumentParser(
    description="Downloads a deb package from a package source file"
)

parser.add_argument("--package-files", action='store',
                    help='A list of Packages.xz/gz files to use')
parser.add_argument("--packages", action='store',
                    help='A comma delimited list of packages to search for and download')
parser.add_argument("--workspace-name", action='store',
                    help='The name of the current bazel workspace')
parser.add_argument("--versionsfile", action='store',
                    help='If set, the output path of the versions file to be generated')

parser.add_argument("--download-and-extract-only", action='store',
                    help='If True, download Packages.xz/gz and make urls absolute from mirror url')
parser.add_argument("--mirror-url", action='store',
                    help='The base url for the package list mirror')
parser.add_argument("--arch", action='store',
                    help='The target architecture for the package list')
parser.add_argument("--distro", action='store',
                    help='The target distribution for the package list')
parser.add_argument("--snapshot", action='store',
                    help='The snapshot date to download')
parser.add_argument("--sha256", action='store',
                    help='The sha256 checksum to validate for the Packages.xz/gz file')
parser.add_argument("--packages-url", action='store',
                    help='The full url for the Packages.xz/gz file')
parser.add_argument("--package-prefix", action='store',
                    help='The prefix to prepend to the value of Filename key in the Packages.xz/gz file.')


def main():
    """ A tool for downloading debian packages and package metadata """
    args = parser.parse_args()

    # golang/bazel use "ppc64le" https://golang.org/doc/install/source#introduction
    # unfortunately debian uses "ppc64el" https://wiki.debian.org/ppc64el
    if args.arch == "ppc64le":
        args.arch = "ppc64el"
    elif args.arch == "arm":
        args.arch = "armhf"
    if args.packages_url and 'ppc64le' in args.packages_url:
        args.packages_url = args.packages_url.replace("ppc64le", "ppc64el")
    elif args.packages_url and '-arm/' in args.packages_url:
        args.packages_url = args.packages_url.replace("-arm/", "-armhf/")

    if args.download_and_extract_only:
        download_package_list(args.mirror_url,args.distro, args.arch, args.snapshot, args.sha256,
                              args.packages_url, args.package_prefix)
        util.build_os_release_tar(args.distro, OS_RELEASE_FILE_NAME, OS_RELEASE_PATH, OS_RELEASE_TAR_FILE_NAME)
    else:
        download_dpkg(args.package_files, args.packages, args.workspace_name, args.versionsfile)

def download_dpkg(package_files, packages, workspace_name, versionsfile):
    """ Using an unzipped, json package file with full urls,
     downloads a .deb package

    Uses the 'Filename' key to download the .deb package
    """
    package_to_rule_map = {}
    package_to_version_map = {}
    package_file_to_metadata = {}
    for pkg_name in set(packages.split(",")):
        pkg = {}
        for package_file in package_files.split(","):
            if package_file not in package_file_to_metadata:
                with open(package_file, 'rb') as f:
                    data = f.read()
                    package_file_to_metadata[package_file] = json.loads(data.decode('utf-8'))
            metadata = package_file_to_metadata[package_file]
            if (pkg_name in metadata and
            (not VERSION_KEY in pkg or compare_versions(metadata[pkg_name][VERSION_KEY], pkg[VERSION_KEY]) > 0)):
                pkg = metadata[pkg_name]
        if (not pkg):
            raise Exception("Package: %s not found in any of the sources" % pkg_name)
        else:
            out_file = os.path.join("file", util.encode_package_name(pkg_name))
            download_and_save(pkg[FILENAME_KEY], out_file)
            package_to_rule_map[pkg_name] = util.package_to_rule(workspace_name, pkg_name)
            package_to_version_map[pkg_name] = pkg[VERSION_KEY]
            actual_checksum = util.sha256_checksum(out_file)
            expected_checksum = pkg[SHA256_KEY]
            if actual_checksum != expected_checksum:
                raise Exception("Wrong checksum for package %s %s (%s).  Expected: %s, Actual: %s" %(pkg_name, os.getcwd() + "/" + out_file, pkg[FILENAME_KEY], expected_checksum, actual_checksum))
    with open(PACKAGE_MAP_FILE_NAME, 'w') as f:
        f.write("packages = " + json.dumps(package_to_rule_map))
        f.write("\nversions = " + json.dumps(package_to_version_map))
    if versionsfile:
        with open(versionsfile, 'w') as f:
            f.write(json.dumps(package_to_version_map, sort_keys=True, indent=4, separators=(',', ': ')))
            f.write('\n')

def download_and_save(url, out_file):
    try:
        subprocess.check_output(["wget", "--tries", "10", url, "-O", out_file], stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as e:
        print("error running wget: %s", e.output)
        raise

def download_package_list(mirror_url, distro, arch, snapshot, sha256, packages_url, package_prefix):
    """Downloads a debian package list, expands the relative urls,
    and saves the metadata as a json file

    A debian package list is a (xz|gzip)-ipped, newline delimited, colon separated
    file with metadata about all the packages available in that repository.
    Multiline keys are indented with spaces.

    An example package looks like:

Package: newmail
Version: 0.5-2
Installed-Size: 76
Maintainer: Martin Schulze <joey@debian.org>
Architecture: amd64
Depends: libc6 (>= 2.7-1)
Description: Notificator for incoming mail
Homepage: http://www.infodrom.org/projects/newmail/
Description-md5: 49b0168ce625e668ce3031036ad2f541
Tag: interface::commandline, mail::notification, role::program,
 scope::utility, works-with::mail
Section: mail
Priority: optional
Filename: pool/main/n/newmail/newmail_0.5-2_amd64.deb
Size: 14154
MD5sum: 5cd31aab55877339145517fb6d5646cb
SHA1: 869934a25a8bb3def0f17fef9221bed2d3a460f9
SHA256: 52ec3ac93cf8ba038fbcefe1e78f26ca1d59356cdc95e60f987c3f52b3f5e7ef

    """

    if bool(packages_url) != bool(package_prefix):
        raise Exception("packages_url and package_prefix must be specified or skipped at the same time.")

    if (not packages_url) and (not mirror_url or not snapshot or not distro or not arch):
        raise Exception("If packages_url is not specified, all of mirror_url, snapshot, "
                        "distro and arch must be specified.")

    url = packages_url
    if not url:
        url = "%s/debian/%s/dists/%s/main/binary-%s/Packages.xz" % (
            mirror_url,
            snapshot,
            distro,
            arch
        )

    
    packages_copy = url.split('/')[-1]
    download_and_save(url, packages_copy)
    actual_sha256 = util.sha256_checksum(packages_copy)
    if sha256 != actual_sha256:
        raise Exception("sha256 of %s don't match: Expected: %s, Actual:%s" %(packages_copy, sha256, actual_sha256))
    if packages_copy.endswith(".gz"):
        with gzip.open(packages_copy, 'rb') as f:
            data = f.read()
    else:
        with lzma.open("Packages.xz", 'rb') as f:
            data = f.read()
    metadata = parse_package_metadata(data, mirror_url, snapshot, package_prefix)
    with open(PACKAGES_FILE_NAME, 'w') as f:
        json.dump(metadata, f)

if __name__ == "__main__":
    main()
