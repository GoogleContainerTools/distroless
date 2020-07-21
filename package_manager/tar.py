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

from package_manager.archive import TarFileWriter

parser = argparse.ArgumentParser(
    description="Builds a tar file from a list of inputs."
)
parser.add_argument("--output", required=True, help='The output file')
parser.add_argument("args", nargs=argparse.REMAINDER, help='Files or directories to add to the tar')


def main():
    """ A tool for building tar files from a list of inputs.."""
    args = parser.parse_args()
    # Add objects to the tar file
    with TarFileWriter(name=args.output, default_mtime=0, preserve_tar_mtimes=False) as tar:
        for f in sorted(args.args):
            tar.add_file(name=f, file_content=f)


if __name__ == '__main__':
    main()
