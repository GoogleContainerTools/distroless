# Examples

### **Downloading minimal python library packages from a snapshot of `debian jessie`**.

`dpkg_src` and `dpkg_list` are repository rules, and therefore made to be used in the `WORKSPACE`.

First, set up the package source with `dpkg_src` rule.  This example uses a snapshot of debian jessie from July 1st 2017.  The rule outputs a `file:Packages.json` which contains a parsed and formatted `Packages.gz` for `dpkg_list` to consume.

```python
dpkg_src(
    name = "debian_jessie",
    arch = "amd64",
    distro = "jessie",
    sha256 = "8ff5e7a54d4e75bbbcd2f43ebc7cb4a082fbc5493bc9fb2dcdaaeacba6e76dee",
    snapshot = "20170701T034145Z",
    url = "http://snapshot.debian.org/archive",
)
```

You can now reference this `dpkg_src` rule when downloading packages in the `dpkg_list` rule.  The `dpkg_src` rule will output a `packages` map in `file:packages.bzl` for you to access the `.deb` artifacts. 

```python
dpkg_list(
    name = "package_bundle",
    packages = [
        "libpython2.7-minimal",
        "python2.7-minimal",
        "libpython2.7-stdlib",
        "zlib1g",
    ],
    sources = [
        "@debian_jessie//file:Packages.json",
    ],
)
```

Finally, in a `BUILD` file, you can access the `.deb` files for rules that might require them.  We reference the package map from the previous `dpkg_list` rule and access the packages.  

```python
load("@package_bundle//file:packages.bzl", "packages")

docker_build(
    name = "python27",
    base = "//base:base",
    debs = [
        packages["zlib1g"],
        packages["python2.7-minimal"],
        packages["libpython2.7-minimal"],
        packages["libpython2.7-stdlib"],
    ],
    entrypoint = [
        "/usr/bin/python2.7",
    ],
    symlinks = {
        "/usr/bin/python": "/usr/bin/python2.7",
    },
)
```

# Reference

## dpkg_src

```python
dpkg_src(name, url, arch, distro, snapshot, sha256, dpkg_parser)
```

A rule that downloads a Packages.gz snapshot file and parses it into a readable format for `dpkg_list`.  It currently only supports snapshots from [http://snapshot.debian.org/](http://snapshot.debian.org/).  You can find out more about the format and sources available there.  

<table class="table table-condensed table-bordered table-params">
  <colgroup>
    <col class="col-param" />
    <col class="param-description" />
  </colgroup>
  <thead>
    <tr>
      <th colspan="2">Attributes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>name</code></td>
      <td>
        <p><code>name, required</code></p>
      </td>
    </tr>
    <tr>
      <td><code>url</code></td>
      <td>
        <p><code>the base url of the package repository, required</code></p>
        <p>The url that hosts snapshots of Packages.gz files.</p>
      </td>
    </tr>
    <tr>
      <td><code>arch</code></td>
      <td>
        <p><code>the target package architecture, required</code></p>
      </td>
    </tr>
    <tr>
      <td><code>distro</code></td>
      <td>
        <p><code>the name of the package distribution, required</code></p>
        <p>Examples: wheezy, jessie, jessie-backports, etc.</p>
      </td>
    </tr>
    <tr>
      <td><code>snapshot</code></td>
      <td>
        <p><code>the snapshot date of the Packages.gz, required</code></p>
        <p>Format: YYYYMMDDTHHMMSSZ.  You can query a list of possible dates for snapshot.debian.org at <a href=
        'http://snapshot.debian.org/archive/debian/?year=2009;month=10'>http://snapshot.debian.org/archive/debian/?year=2009;month=10</a>
      </td>
    </tr>
    <tr>
      <td><code>sha256</code></td>
      <td>
        <p><code>the sha256 of the Packages.gz file, required</code></p>
      </td>
    </tr>
    <tr>
      <td><code>dpkg_parser</code></td>
      <td>
        <p><code>A binary that translates a Packages.gz file into a format readable by dpkg_list, required</code></p>
      </td>
    </tr>
  </tbody>
</table>

## dpkg_list

```python
dpkg_list(name, packages, sources)
```

A rule that downloads `.deb` packages and makes them available in the WORKSPACE.

For a `dpkg_list` rule named `package_bundle`, packages can be used by loading `load("@package_bundle//file:packages.bzl", "packages")` into your `BUILD` file, then referencing the package with `packages['packagename']`

<table class="table table-condensed table-bordered table-params">
  <colgroup>
    <col class="col-param" />
    <col class="param-description" />
  </colgroup>
  <thead>
    <tr>
      <th colspan="2">Attributes</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>name</code></td>
      <td>
        <p><code>name, required</code></p>
      </td>
    </tr>
    <tr>
      <td><code>packages</code></td>
      <td>
        <p><code>a string array of packages to download, required</code></p>
        <p>The url that hosts snapshots of Packages.gz files.</p>
      </td>
    </tr>
    <tr>
      <td><code>sources</code></td>
      <td>
        <p><code>a list of outputs from dpkg_src, required</code></p>
        <p>A list of snapshot sources that will be checked when downloading the package.  If a package is present in multiple sources, the first source in the list will be chosen.</p>
      </td>
    </tr>
  </tbody>
</table>