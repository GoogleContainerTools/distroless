# Copyright 2019 The Bazel Authors. All rights reserved.
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
import os
import sys

def SplitNameValuePairAtSeparator(arg, sep):
  """Split a string at the first unquoted occurrence of a character.

  Split the string arg at the first unquoted occurrence of the character c.
  Here, in the first part of arg, the backslash is considered the
  quoting character indicating that the next character is to be
  added literally to the first part, even if it is the split character.

  Args:
    arg: the string to be split
    sep: the character at which to split

  Returns:
    The unquoted string before the separator and the string after the
    separator.
  """
  head = ''
  i = 0
  while i < len(arg):
    if arg[i] == sep:
      return (head, arg[i + 1:])
    elif arg[i] == '\\':
      i += 1
      if i == len(arg):
        # dangling quotation symbol
        return (head, '')
      else:
        head += arg[i]
    else:
      head += arg[i]
    i += 1
  # if we leave the loop, the character sep was not found unquoted
  return (head, '')

def GetFlagValue(flagvalue, strip=True):
  """Converts a raw flag string to a useable value.

  1. Expand @filename style flags to the content of filename.
  2. Cope with Python3 strangness of sys.argv.
     sys.argv is not actually proper str types on Unix with Python3
     The bytes of the arg are each directly transcribed to the characters of
     the str. It is actually more complex than that, as described in the docs.
       https://docs.python.org/3/library/sys.html#sys.argv
       https://docs.python.org/3/library/os.html#os.fsencode
       https://www.python.org/dev/peps/pep-0383/

  Args:
    flagvalue: (str) raw flag value
    strip: (bool) Strip white space.

  Returns:
    Python2: unicode
    Python3: str
  """
  if flagvalue:
    if sys.version_info[0] < 3:
      # python2 gives us raw bytes in argv.
      flagvalue = flagvalue.decode('utf-8')
    # assertion: py2: flagvalue is unicode
    # assertion: py3: flagvalue is str, but in weird format
    if flagvalue[0] == '@':
      # Subtle: We do not want to re-encode the value here, because it
      # is encoded in the right format for file open operations.
      with open(flagvalue[1:], 'rb') as f:
        flagvalue = f.read().decode('utf-8')
    else:
      # convert fs specific encoding back to proper unicode.
      if sys.version_info[0] > 2:
        flagvalue = os.fsencode(flagvalue).decode('utf-8')

    if strip:
      return flagvalue.strip()
  return flagvalue
