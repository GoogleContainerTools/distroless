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
import re

import six

INDEX_KEY = "Package"
FILENAME_KEY = "Filename"
SEPARATOR = ":"

def parse_package_metadata(data, mirror_url, snapshot, package_prefix):
    """ Takes a debian package list, changes the relative urls to absolute urls,
    and saves the resulting metadata as a json file """

    # this is called with the output of gzip.open, but should be strings
    if isinstance(data, six.binary_type):
        data = data.decode('utf-8')

    raw_entries = [line.rstrip() for line in data.splitlines()]
    parsed_entries = {}
    current_key = None
    current_entry = {}

    for line in raw_entries:
        if line:
            # If the line starts with indentation,
            # it is a continuation of the previous key
            if re.match(r'\s', line):
                if current_entry is None or current_key is None:
                    raise Exception("Found incorrect indention on line:" + line)
                current_entry[current_key] += line.strip()
            elif SEPARATOR in line:
                (key, value) = line.split(SEPARATOR, 1)
                current_key = key.strip()
                if current_key in current_entry:
                    raise Exception("Duplicate key for package metadata:"
                                    + current_key + "\n" + current_entry)
                current_entry[current_key] = value.strip()
            else:
                raise Exception("Valid line, but no delimiter or indentation:"
                                + line)
        else:
            if current_entry:
                parsed_entries[current_entry[INDEX_KEY]] = current_entry
            current_entry = {}
            current_key = None
    if current_entry:
        parsed_entries[current_entry[INDEX_KEY]] = current_entry
    # The Filename Key is a relative url pointing to the .deb package
    # Here, we're rewriting the metadata with the absolute urls,
    # which is a concatenation of the mirror + '/debian/' + relative_path
    for pkg_data in six.itervalues(parsed_entries):
        if package_prefix:
            pkg_data[FILENAME_KEY] = package_prefix + pkg_data[FILENAME_KEY]
        else:
            pkg_data[FILENAME_KEY] = mirror_url + "/debian/" + snapshot + "/" + pkg_data[FILENAME_KEY]
    return parsed_entries
