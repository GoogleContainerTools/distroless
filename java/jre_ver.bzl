def jre_ver(version):
  """Extract JRE version from an OpenJDK debian package.
    debian packages have versions in the form:
       openjdk-8-jre*: 8u171-b11-1~deb9u1
       openjdk-11-jre*: 11.0.1+13-2~bpo9+1
  """
  if version.startswith("8u"): return version.split("-",2)[0]
  if version.startswith("11."): return version.split("+",2)[0]
  return "unknown: " + version
