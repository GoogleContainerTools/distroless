#!/bin/bash

# This script extracts the CA certs from the typical debian ca-certificates debian package.
# It would be nicer to do this in Python or Go, but neither of these languages have packages
# that can extract .xz files in their stdlibs.

DEB=$1
CERTS_PATH=$2

ar -x $DEB data.tar.xz
tar -xf data.tar.xz ./usr/share/ca-certificates

# Concat all the certs.
CERTS=$(find usr/share/ca-certificates -type f | sort)
for cert in $CERTS; do
    cat $cert >> $2
done

rm data.tar.xz
rm -rf usr/share/ca-certificates
