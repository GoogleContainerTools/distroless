#!/bin/bash

set -o errexit

DEB=$1
OUT_TAR=$2

ar -x "$DEB" data.tar.xz

tar -xf data.tar.xz ./usr/lib/locale

rm data.tar.xz

tar -cf locale.tar ./usr

mv locale.tar "$OUT_TAR"

rm -rf usr
