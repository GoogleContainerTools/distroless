#!/bin/sh

set -o errexit

DEB=$1
shift
if [ -z ${DEB+x} ]; then
  echo "Usage: dpkg_extract <deb file> [files to extract]"
  exit 1;
fi

if ! [ -f "$DEB" ]; then
  echo "$DEB package was not found"
  exit 1;
fi

ar -x "$DEB" data.tar.xz

tar -xf data.tar.xz "$@"

rm data.tar.xz
