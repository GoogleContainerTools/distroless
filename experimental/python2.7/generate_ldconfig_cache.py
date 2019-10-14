#!/usr/bin/env python
'''
Generates ld.so.cache from a container image that contains ldconfig.
'''

import os
import re
import shutil
import subprocess
import sys
import tempfile


CONTAINER_IMAGE_PATH = 'experimental/python2.7/python27_debian9'


def main():
    if len(sys.argv) != 2:
        sys.stderr.write('usage: generate_ldconfig_cache (output ld.so.cache path)\n')
        sys.exit(1)
    output_path = sys.argv[1]

    guess_runfiles = sys.argv[0] + '.runfiles'
    container_path = CONTAINER_IMAGE_PATH
    if os.path.exists(guess_runfiles):
        # container_image script looks for this environment variable
        guess_runfiles = os.path.abspath(guess_runfiles)
        os.environ['PYTHON_RUNFILES'] = guess_runfiles
        container_path = guess_runfiles + '/distroless/' + container_path

    print('loading image {} ...'.format(container_path))
    sys.stdout.flush()
    subprocess.check_call((container_path, ), stderr=subprocess.STDOUT)

    # create a temporary directory to store the output
    tempdir = tempfile.mkdtemp()
    try:
        docker_tag = 'bazel/' + re.sub(r'/([^/]+)$', r':\1', CONTAINER_IMAGE_PATH)
        print('running docker image {} ...'.format(docker_tag))
        sys.stdout.flush()
        # run with a read-only root file system, write to /output
        docker_command = ('docker', 'run', '--read-only', '--interactive', '--rm',
            '--mount=type=bind,source={},destination=/output'.format(tempdir),
            '--entrypoint=/sbin/ldconfig', docker_tag, '-C', '/output/ld.so.cache')
        subprocess.check_call(docker_command, stderr=subprocess.STDOUT)

        shutil.copyfile(tempdir + '/ld.so.cache', output_path)
    finally:
        shutil.rmtree(tempdir)


if __name__ == '__main__':
    main()
