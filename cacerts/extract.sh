#!/bin/bash

set -e

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

# This script extracts the CA certs from the typical debian ca-certificates debian package.
# It would be nicer to do this in Python or Go, but neither of these languages have packages
# that can extract .xz files in their stdlibs.

set -e

DEB=$1
OUT_TAR=$2
OUT_DEB=$3

cp "$DEB" "$OUT_DEB"

ar -x "$DEB" data.tar.xz
ar -d "$OUT_DEB" data.tar.xz

tar -xf data.tar.xz ./usr/share/doc/ca-certificates/copyright
tar -xf data.tar.xz ./usr/share/ca-certificates

# We'll create a new data.tar.xz with flattened certs and
# the copyright
rm data.tar.xz

# Concat all the certs.
CERT_FILE=./etc/ssl/certs/ca-certificates.crt
mkdir -p $(dirname $CERT_FILE)

CERTS=$(find usr/share/ca-certificates -type f | sort)
for cert in $CERTS; do
  cat $cert >> $CERT_FILE
done

tar -cf data.tar \
  etc/ \
  usr/share/doc/ca-certificates/copyright

ar -r "$OUT_DEB" data.tar

mv data.tar "$OUT_TAR"

rm -rf usr/share/ca-certificates
rm -rf etc/ssl/certs/ca-certificate.crt

