def jre_ver(version):
    """Extract JRE version from a Debian openjdk package.
      Debian packages versions are of the form:
         openjdk-11-jre*: 11.0.1+13-2~bpo9+1
         openjdk-17-jre*: 17~19-1 or in the future 17+35-1
    """
    if version.startswith("11."):
        return version.split("+")[0]

    if version.startswith("17"):
        return version.split("+")[0]
    fail("unrecognized openjdk package version: " + version)
