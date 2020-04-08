#!/bin/bash -eux

# Copyright 2020 Google Inc. All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

assert::file_contains() {
  if grep -qF "$2" "$1"; then
    return 0
  fi
  return 2
}

cat cacerts/jksutil/test.crt | ./$1 > $TEST_TMPDIR/keys.jks

# Keytool is included with the JRE for querying keystores
keytool -list -v -keystore $TEST_TMPDIR/keys.jks -storepass changeit \
  > $TEST_TMPDIR/keytool_output

cat $TEST_TMPDIR/keytool_output

cat $TEST_TMPDIR/keytool_output
assert::file_contains $TEST_TMPDIR/keytool_output \
  "Your keystore contains 5 entries"

assert::file_contains $TEST_TMPDIR/keytool_output \
  "cn=verisignuniversalrootcertificationauthority,ou=verisigntrustnetwork+ou=(c)2008verisign\,inc.-forauthorizeduseonly,o=verisign\,inc.,c=us"
assert::file_contains $TEST_TMPDIR/keytool_output \
  "SHA1: 36:79:CA:35:66:87:72:30:4D:30:A5:FB:87:3B:0F:A7:7B:B7:0D:54"

assert::file_contains $TEST_TMPDIR/keytool_output \
  "cn=amazonrootca1,o=amazon,c=us"
assert::file_contains $TEST_TMPDIR/keytool_output \
  "SHA1: 8D:A7:F9:65:EC:5E:FC:37:91:0F:1C:6E:59:FD:C1:CC:6A:6E:DE:16"

assert::file_contains $TEST_TMPDIR/keytool_output \
  "cn=digicertassuredidrootca,ou=www.digicert.com,o=digicertinc,c=us"
assert::file_contains $TEST_TMPDIR/keytool_output \
  "SHA1: 05:63:B8:63:0D:62:D7:5A:BB:C8:AB:1E:4B:DF:B5:A8:99:B2:4D:43"

assert::file_contains $TEST_TMPDIR/keytool_output \
  "cn=globalsign,ou=globalsignrootca-r3,o=globalsign"
assert::file_contains $TEST_TMPDIR/keytool_output \
  "SHA1: D6:9B:56:11:48:F0:1C:77:C5:45:78:C1:09:26:DF:5B:85:69:76:AD"

assert::file_contains $TEST_TMPDIR/keytool_output \
  "cn=globalsign,ou=globalsignrootca-r2,o=globalsign"
assert::file_contains $TEST_TMPDIR/keytool_output \
  "SHA1: 75:E0:AB:B6:13:85:12:27:1C:04:F8:5F:DD:DE:38:E4:B7:24:2E:FE"
