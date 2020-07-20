#!/bin/bash

set -o errexit

DEB=$1
OUT_TAR=$2

ar -x "$DEB" data.tar.xz

tar -xf data.tar.xz ./usr/lib/locale/C.UTF-8 ./usr/share/doc/libc-bin/copyright

rm data.tar.xz

tar -c --owner=0 --group=0 -f locale.tar ./usr

mv locale.tar "$OUT_TAR"

rm -rf usr
