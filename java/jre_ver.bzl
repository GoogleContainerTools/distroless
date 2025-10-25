def jre_ver(version):
    """Extract JRE version from a Debian openjdk downloaded filename.

      Debian packages versions are of the form:
         openjdk-11-jre*: 11.0.1+13-2~bpo9+1
    """
    if version.startswith("11.") or version.startswith("17.") or version.startswith("21.") or version.startswith("25."):
        v = version.split("+")[0].split(".")
        return v[0] + "." + v[1] + "." + v[2]

    fail("unrecognized openjdk package version: " + version)
