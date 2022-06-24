#!/usr/bin/env python
'''
Packages ld.so.cache into a tar file with the correct path to avoid extra container layers.
'''

import os
import sys
import tarfile


def make_ld_so_tar(inpath, outpath):
    with tarfile.open(outpath, 'w') as outtar, open(inpath, 'rb') as infile:
        # get the actual file size: in a Bazel build inpath will be a symlink
        stat = os.fstat(infile.fileno())

        ld_cache_info = tarfile.TarInfo('etc/ld.so.cache')
        ld_cache_info.mode = 0o644
        ld_cache_info.uid = 0
        ld_cache_info.gid = 0
        ld_cache_info.size = stat.st_size
        outtar.addfile(ld_cache_info, infile)


def main():
    if len(sys.argv) != 3:
        sys.stderr.write('usage: make_ld_so_tar.py (input ld.so.cache) (output.tar)\n')
        sys.exit(1)
    inpath = sys.argv[1]
    outpath = sys.argv[2]

    make_ld_so_tar(inpath, outpath)


if __name__ == '__main__':
    main()
