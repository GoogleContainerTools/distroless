import hashlib
import base64
import collections
import os

# Distroless's test.sh runs pylint on all python files, but this module will not exist
# pylint: disable=import-error
from build_tar import TarFile

def sha256_checksum(filename, block_size=65536):
    sha256 = hashlib.sha256()
    with open(filename, 'rb') as f:
        for block in iter(lambda: f.read(block_size), b''):
            sha256.update(block)
    return sha256.hexdigest()

def package_to_rule(workspace_name, s):
    return  "@" + workspace_name + "//file:" + encode_package_name(s)

def encode_package_name(s):
    return base64.urlsafe_b64encode(s.encode('utf-8')).decode('utf-8') + ".deb"

DEBIAN_RELEASES = {
    "bullseye": "11",
    "buster": "10",
    "stretch": "9",
    "jessie": "8",
    "wheezy": "7",
    "squeeze": "6.0",
    "lenny": "5.0",
    "etch": "4.0",
    "sarge": "3.1",
    "woody": "3.0",
    "potato": "2.2",
}

def generate_os_release(distro, os_release_file):
    """ Generates an /etc/os-release like file with information about the
    package distribution.  VERSION and VERSION_ID are left unset if the package
    source is from an unknown debian release.
    """

    os_release = collections.OrderedDict([
        ("PRETTY_NAME", "Distroless"),
        ("NAME", "Debian GNU/Linux"),
        ("ID", "debian"),
        ("VERSION_ID", ""),
        ("VERSION", ""),
        ("HOME_URL", "https://github.com/GoogleContainerTools/distroless"),
        ("SUPPORT_URL", "https://github.com/GoogleContainerTools/distroless/blob/master/README.md"),
        ("BUG_REPORT_URL", "https://github.com/GoogleContainerTools/distroless/issues/new"),
    ])
    if distro in DEBIAN_RELEASES:
        os_release["VERSION_ID"] = DEBIAN_RELEASES[distro]
        os_release["VERSION"] = '{0} {1} ({2})'.format(os_release["NAME"], os_release["VERSION_ID"], distro)
    for k, val in os_release.items():
        if val:
            os_release_file.write('{0}=\"{1}\"\n'.format(k, val))

def build_os_release_tar(distro, os_release_file, os_release_path, tar_file_name):
    os.makedirs(os_release_path)
    with open(os_release_file, 'w') as os_release:
        generate_os_release(distro, os_release)
    with TarFile(output=tar_file_name, directory=None, compression='', root_directory='./', default_mtime=0) as tar:
        tar.add_file(os_release_path, os_release_path, mode=0o644)
