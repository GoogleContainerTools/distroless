#!/usr/bin/env python
"""A tool for updating a WORKSPACE file containing deb_packages rules"""

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

from __future__ import print_function

import argparse
import gzip
import hashlib
import json
import os
import subprocess
import tempfile
import urllib
import urlparse

# python-apt
# https://apt.alioth.debian.org/python-apt-doc/library/index.html
import apt_pkg

PARSER = argparse.ArgumentParser(
    description="Adds and updates deb_packages rules in WORKSPACE files")

PARSER.add_argument(
    "-u",
    "--update",
    default="all",
    metavar="RULENAME",
    help=
    'Name of the deb_packages rule that will be updated. Use "all" to update all rules.'
)

PARSER.add_argument(
    "-a",
    "--add",
    action='store_true',
    help=
    'Parses BUILD files for docker_build rules and adds debs defined there to the WORKSPACE file.'
)


def get_packages_file(arch, distro_type, distro, mirrors_list):
    release_done = False
    all_packages_file = tempfile.NamedTemporaryFile(mode="ab", delete=False)
    release_file = tempfile.NamedTemporaryFile(mode="w+b", delete=False)
    release_gpg_file = tempfile.NamedTemporaryFile(mode="w+b", delete=False)

    for mirror in mirrors_list:
        release_url = urlparse.urljoin(
            mirror, "/" + distro_type + "/dists/" + distro + "/Release")
        release_gpg_url = urlparse.urljoin(
            mirror, "/" + distro_type + "/dists/" + distro + "/Release.gpg")
        try:
            urllib.urlretrieve(release_url, release_file.name)
        except BaseException as exception:
            print("Could not load Release file from mirror {} with url {}".
                  format(mirror, release_url))
            print("Exception thrown: {}".format(exception))
            continue
        try:
            urllib.urlretrieve(release_gpg_url, release_gpg_file.name)
            release_done = True
            break
        except BaseException as exception:
            print("Could not load Release.gpg file from mirror {} with url {}".
                  format(mirror, release_gpg_url))
            print("Exception thrown: {}".format(exception))
            continue
    if not release_done:
        raise Exception(
            "Could not download Release files from any of the supplied mirrors"
        )
    # TODO: Verify integrity of Release file with gpg
    os.unlink(release_gpg_file.name)

    with apt_pkg.TagFile(release_file.name) as tagfile:
        for section in tagfile:
            components = section["Components"].split()
            for component in components:
                sha256 = section["SHA256"].split()
                for index, entry in enumerate(sha256):
                    if entry.endswith(component + "/binary-" + arch +
                                      "/Packages.gz"):
                        package_path = sha256[index]
                        package_sha256 = sha256[index - 2]
                package_done = False
                packages_file = tempfile.NamedTemporaryFile(
                    mode="w+b", delete=False)
                for mirror in mirrors_list:
                    package_url = urlparse.urljoin(
                        mirror, "/" + distro_type + "/dists/" + distro + "/" +
                        package_path)
                    try:
                        urllib.urlretrieve(package_url, packages_file.name)
                        package_done = True
                        break
                    except BaseException as exception:
                        print(
                            "Could not load Packages.gz file from mirror {} with url {}".
                            format(mirror, package_url))
                        print("Exception thrown: {}".format(exception))
                        continue
                if not package_done:
                    raise Exception(
                        "Could not download Packages file from any of the supplied mirrors"
                    )
                # verify sha256 of Packages.gz
                sha256 = hashlib.sha256()
                with open(packages_file.name, 'rb') as packagefile:
                    for block in iter(lambda: packagefile.read(65536), b''):
                        sha256.update(block)
                actual_hash = sha256.hexdigest()
                if not actual_hash.lower() == package_sha256.lower():
                    raise Exception(
                        "Hashes of downloaded Packages.gz file do not match. Got {}, expected {}".
                        format(actual_hash, package_sha256))
                # Append Package files together
                with gzip.open(packages_file.name, "rb") as packagesfile:
                    all_packages_file.file.write(packagesfile.read())
                os.unlink(packages_file.name)
    os.unlink(release_file.name)
    return all_packages_file


def get_distro_type(rule_name, workspace_contents):
    # run buildozer:
    # buildozer 'print distro_type' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        ["buildozer", "print distro_type", "-:{}".format(rule_name)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    result = str(stdout).strip().lower()
    return result


def get_distro(rule_name, workspace_contents):
    # run buildozer:
    # buildozer 'print distro' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        ["buildozer", "print distro", "-:{}".format(rule_name)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    result = str(stdout).strip().lower()
    return result


def get_architecture(rule_name, workspace_contents):
    # run buildozer:
    # buildozer 'print architecture' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        ["buildozer", "print architecture", "-:{}".format(rule_name)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    result = str(stdout).strip().lower()
    return result


def get_mirrors(rule_name, workspace_contents):
    # run buildozer:
    # buildozer 'print mirrors' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        ["buildozer", "print mirrors", "-:{}".format(rule_name)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    # Ignore [] characters in output
    result = str(stdout)[1:-2].split()
    return result


def get_all_package_names(rule_name, workspace_contents):
    # run buildozer:
    # buildozer 'print packages' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        ["buildozer", "print packages", "-:{}".format(rule_name)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    # the results currently include curly braces and quotes
    # package names are the ones ending in a colon

    # remove the last (trailing) comma, otherwise this isn't valid JSON
    # see https://stackoverflow.com/a/9943875
    result = json.loads("".join(str(stdout).rsplit(",", 1)))
    return result.keys()


def get_all_packages(rule_name, workspace_contents):
    # run buildozer:
    # buildozer 'print packages' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        ["buildozer", "print packages", "-:{}".format(rule_name)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    # the results currently include curly braces and quotes
    # package names are the ones ending in a colon, paths end in a comma

    # remove the last (trailing) comma, otherwise this isn't valid JSON
    # see https://stackoverflow.com/a/9943875
    result = json.loads("".join(str(stdout).rsplit(",", 1)))
    return result


def get_all_packages_sha256(rule_name, workspace_contents):
    # run buildozer:
    # buildozer 'print packages_sha256' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        ["buildozer", "print packages_sha256", "-:{}".format(rule_name)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    # the results currently include curly braces and quotes
    # package names are the ones ending in a colon, paths end in a comma

    # remove the last (trailing) comma, otherwise this isn't valid JSON
    # see https://stackoverflow.com/a/9943875
    result = json.loads("".join(str(stdout).rsplit(",", 1)))
    return result


def get_all_rule_names(workspace_contents):
    # run buildozer:
    # buildozer 'print name' -:%deb_packages <WORKSPACE
    process = subprocess.Popen(
        ["buildozer", "print name", "-:%deb_packages"],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    result = str(stdout).split()
    return result


def get_all_debs_used():
    # run buildozer:
    # buildozer 'print label debs' //...:%docker_build
    process = subprocess.Popen(
        ["buildozer", "print label debs", "//...:%docker_build"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE)
    stdout = process.communicate()[0]
    result = {}
    for word in str(stdout).split():
        if word.endswith(","):
            result.setdefault(word.split("[")[0],
                              set()).add(word.split('"')[1])
    return result


def write_distro_to_rule(distro, rule_name, workspace_contents):
    # run buildozer
    # buildozer 'set distro DISTRONAME_GOES_HERE' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        [
            "buildozer", 'set distro "{}"'.format(distro),
            "-:{}".format(rule_name)
        ],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    return stdout


def write_packages_to_rule(dictionary, rule_name, workspace_contents):
    # run buildozer
    # buildozer 'set packages {"foo":"bar","foo2":"baz"}' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        [
            "buildozer", "set packages {}".format(
                json.dumps(dictionary, separators=(",", ":"), sort_keys=True)),
            "-:{}".format(rule_name)
        ],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    return stdout


def write_packages_sha256_to_rule(dictionary, rule_name, workspace_contents):
    # run buildozer
    # buildozer 'set packages_sha256 {"foo":"bar","foo2":"baz"}' -:RULENAME_GOES_HERE <WORKSPACE
    process = subprocess.Popen(
        [
            "buildozer", "set packages_sha256 {}".format(
                json.dumps(dictionary, separators=(",", ":"), sort_keys=True)),
            "-:{}".format(rule_name)
        ],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE)
    stdout = process.communicate(input=workspace_contents)[0]
    return stdout


def update_workspace(args, workspace_contents):
    if args.update == "all":
        rule_names = get_all_rule_names(workspace_contents)
    else:
        rule_names = [args.update]

    for rule in rule_names:
        package_names = get_all_package_names(rule, workspace_contents)
        package_names_dict = {}
        for package_name in package_names:
            if "=" in package_name:
                name, version = package_name.split("=")
                package_names_dict[name] = version
            else:
                package_names_dict[package_name] = "latest"
        distro_type = get_distro_type(rule, workspace_contents)
        distro = get_distro(rule, workspace_contents)
        arch = get_architecture(rule, workspace_contents)
        mirrors_list = get_mirrors(rule, workspace_contents)
        packages_file = get_packages_file(arch, distro_type, distro,
                                          mirrors_list)
        packages = {}
        packages_sha256 = {}
        package_dict = {}
        with apt_pkg.TagFile(packages_file.name) as packagesfile:
            for section in packagesfile:
                if section["Package"] in package_dict:
                    package_dict[section["Package"]].append(section)
                else:
                    package_dict[section["Package"]] = [section]
        os.unlink(packages_file.name)
        for package in package_dict:
            if package in package_names_dict:
                version_list = []
                for version in package_dict[package]:
                    version_list.append(version["Version"])
                version_to_use = None
                if package_names_dict[package] == "latest":
                    latest_version = version_list[0]
                    for entry in version_list:
                        compare_version = entry
                        res = apt_pkg.version_compare(latest_version,
                                                      compare_version)
                        if res < 0:
                            latest_version = compare_version
                    version_to_use = latest_version
                else:
                    version_to_use = package_names_dict[package]
                for version in package_dict[package]:
                    if apt_pkg.version_compare(version["Version"],
                                               version_to_use) == 0:
                        packages[package] = version["Filename"]
                        packages_sha256[package] = version["SHA256"]
        workspace_contents = write_packages_to_rule(packages, rule,
                                                    workspace_contents)
        workspace_contents = write_packages_sha256_to_rule(
            packages_sha256, rule, workspace_contents)
        # Workaround, since buildozer seems to run buildifier over its input
        # but not its output if "-buildifier" is not set.
        # This formats the outputs nicely
        workspace_contents = write_distro_to_rule(distro, rule,
                                                  workspace_contents)
    return workspace_contents


def add_packages(workspace_contents):
    deb_packages = get_all_debs_used()
    all_rules = get_all_rule_names(workspace_contents)
    for rule in deb_packages:
        if rule not in all_rules:
            raise Exception("deb_packages rule %s not found in WORKSPACE",
                            rule)
        package_names = get_all_package_names(rule, workspace_contents)
        if set(package_names) == deb_packages[rule]:
            continue
        else:
            packages = get_all_packages(rule, workspace_contents)
            packages_sha256 = get_all_packages_sha256(rule, workspace_contents)
            for package in deb_packages[rule]:
                packages[package] = "temp"
                packages_sha256[package] = "temp"

        workspace_contents = write_packages_to_rule(packages, rule,
                                                    workspace_contents)
        workspace_contents = write_packages_sha256_to_rule(
            packages_sha256, rule, workspace_contents)
        # Workaround, since buildozer seems to run buildifier over its input
        # but not its output if "-buildifier" is not set.
        # This formats the outputs nicely
        distro = get_distro(rule, workspace_contents)
        workspace_contents = write_distro_to_rule(distro, rule,
                                                  workspace_contents)
    return workspace_contents


def main(args):
    """A tool for updating a WORKSPACE file containing deb_packages rules"""
    apt_pkg.init_system()
    if os.path.exists("WORKSPACE"):
        with open("WORKSPACE", "r") as workspacefile:
            workspace_contents = workspacefile.read()
    else:
        print("WORKSPACE file not found in the current path, aborting")
        return -1

    if args.add:
        workspace_contents = add_packages(workspace_contents)

    workspace_contents = update_workspace(args, workspace_contents)
    print(workspace_contents)


if __name__ == "__main__":
    ARGS = PARSER.parse_args()
    main(ARGS)
