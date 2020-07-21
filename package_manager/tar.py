# Copyright 2015 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""This tool build tar files from a list of inputs."""

import argparse
import os
import tarfile

parser = argparse.ArgumentParser(
    description="Builds a tar file from a list of inputs."
)
parser.add_argument("--output", required=True, help='The output file')
parser.add_argument("args", nargs=argparse.REMAINDER, help='Files or directories to add to the tar')


def reproducible_tar(tarinfo):
    tarinfo.gid = 0
    tarinfo.gname = ''
    tarinfo.uid = 0
    tarinfo.uname = ''
    tarinfo.mtime = 0
    tarinfo.mode = 0o644 if tarinfo.isfile() else 0o755
    return tarinfo


class Tar(object):
    def __init__(self, output):
        self.tar = tarfile.open(output, "w")
        self.members = set([])

    def __enter__(self):
        return self

    def __exit__(self, t, v, traceback):
        self.close()

    def close(self):
        self.tar.close()

    def add(self, path, name=None, depth=100):
        if name is None:
            name = path

        if depth <= 0:
            raise Exception('Recursion depth exceeded, probably in an infinite directory loop.')

        if os.path.isdir(path):
            self.tar.addfile(reproducible_tar(self.tar.gettarinfo(path, name)))
            for f in sorted(os.listdir(path)):
                self.add(os.path.join(path, f), os.path.join(name, f), depth - 1)
        else:
            self.tar.add(path, arcname=name, filter=reproducible_tar)


def main():
    """ A tool for building tar files from a list of inputs.."""
    args = parser.parse_args()
    # Add objects to the tar file
    with Tar(args.output) as tar:
        for f in sorted(args.args):
            tar.add(f)


if __name__ == '__main__':
    main()
