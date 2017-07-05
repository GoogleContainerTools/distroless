import hashlib
import base64

def sha256_checksum(filename, block_size=65536):
    sha256 = hashlib.sha256()
    with open(filename, 'rb') as f:
        for block in iter(lambda: f.read(block_size), b''):
            sha256.update(block)
    return sha256.hexdigest()

def package_to_rule(workspace_name, s):
    return  "@" + workspace_name + "//file:" + encode_package_name(s)

def encode_package_name(s):
    return base64.urlsafe_b64encode(s) + ".deb"
