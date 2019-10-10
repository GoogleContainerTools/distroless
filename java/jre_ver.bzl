def jre_ver(version):
    """Extract JRE version from a Debian openjdk package.
      Debian packages versions are of the form:
         openjdk-8-jre*: 8u171-b11-1~deb9u1
         openjdk-11-jre*: 11.0.1+13-2~bpo9+1
    """
    if version.startswith("8u"):
        return version.split("-")[0]
    if version.startswith("11."):
        return version.split("+")[0]
    fail("unrecognized openjdk package version: " + version)
