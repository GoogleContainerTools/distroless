#!/bin/bash

set -o errexit

DEB=$1
OUT_TAR=$2

ar -x "$DEB" data.tar.xz

tar -xf data.tar.xz ./usr/lib/locale/C.UTF-8 ./usr/share/doc/libc-bin/copyright

rm data.tar.xz

# On Mac OS, you need to make sure that GNU Tar is used instead of the BSD tar that is shipped with MacOS.
# To resolve this you can install gnu-tar via Homebrew and symlink it as /usr/local/bin/tar.
tar -c --owner=0 --group=0 -f locale.tar ./usr

mv locale.tar "$OUT_TAR"

rm -rf usr
