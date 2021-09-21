#!/usr/bin/env python
'''
Verifies that the checked in ld.so.cache matches the generated file from
the current base image. This avoids an extra container image layer, and
users don't need Docker just to use the Python image.
'''

import base64
import sys


def main():
    if len(sys.argv) != 3:
        sys.stderr.write('usage: check_ld_so_cache.py (checked in path) (generated path)\n')
        sys.exit(1)
    checked_in_path = sys.argv[1]
    generated_path = sys.argv[2]

    checked_in = open(checked_in_path, 'rb').read()
    generated = open(generated_path, 'rb').read()
    if checked_in != generated:
        sys.stderr.write('Error: checked in file {} does not match generated file {}\n'.format(
            checked_in_path, base64.b64encode(generated)))
        sys.exit(1)


if __name__ == '__main__':
    main()
