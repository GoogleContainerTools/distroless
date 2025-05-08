load("//:checksums.bzl", "ARCHITECTURES")

# Function to filter architectures based on Node.js version
def node_arch(major_version):
    if int(major_version) >= 24:
        return [arch for arch in ARCHITECTURES if arch != "arm"]
    return ARCHITECTURES
