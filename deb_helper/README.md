# Examples

### **Downloading minimal python library packages from a snapshot of `debian jessie`**.

`deb_loader` and `deb_packages` are repository rules, and therefore made to be used in the `WORKSPACE`.

First, tell bazel to load these rules with a `load()` statement and then initialize the `deb_loader()` rule to make sure the loader tool is available during the build.

```python
load(
    "//deb_helper:deb_helper.bzl",
    "deb_loader",
    "deb_packages",
)
deb_loader()
```

Next, for every source of deb packages, create a `deb_packages` rule.
You can define additional mirrors per package source, but it is assumed that all these mirrors will serve the exact same files.
Hashes are checked after downloading files from a mirror.

```python
deb_packages(
    name = "debian_jessie_amd64",
    architecture = "amd64",
    distro = "jessie",
    distro_type = "debian",
    mirrors = [
        "http://deb.debian.org",
        "http://my.private.mirror",
    ],
    packages = {
        "libpython2.7-minimal": "pool/main/p/python2.7/libpython2.7-minimal_2.7.9-2+deb8u1_amd64.deb",
        "libpython2.7-stdlib": "pool/main/p/python2.7/libpython2.7-stdlib_2.7.9-2+deb8u1_amd64.deb",
        "python2.7-minimal": "pool/main/p/python2.7/python2.7-minimal_2.7.9-2+deb8u1_amd64.deb",
        "zlib1g": "pool/main/z/zlib/zlib1g_1.2.8.dfsg-2+b1_amd64.deb",
    },
    packages_sha256 = {
        "libpython2.7-minimal": "916e2c541aa954239cb8da45d1d7e4ecec232b24d3af8982e76bf43d3e1758f3",
        "libpython2.7-stdlib": "cf1c9dfc12d6cfd42bb14bfb46ee3cec0f6ebc720a1419f017396739953b12c5",
        "python2.7-minimal": "c89199f908d5a508d8d404efc0e1aef3d9db59ea23bd4532df9e59941643fcfb",
        "zlib1g": "b75102f61ace79c14ea6f06fdd9509825ee2af694c6aa503253df4e6659d6772",
    },
)
```

Internally `.deb` files referenced here will be downloaded by the `deb_loader` tool, renamed to their SHA256 hash (not all characters used in file names are legal in bazel names) and made available in a dictionary named the same as the `deb_packages` rule.
This dictionary is made available in a file named `deb_packages.bzl` in the `debs` subfolder of this rule.
You can find the generated and downloaded files in the `./bazel-distroless/external/your_rule_name/debs` folder after building the project if you're interested.

To actually use the `.deb` files in a BUILD file rule like `docker_build`, you first have to load all dictionaries of package sources you want to use.
This is done with the `load("@your_rule_name//debs:deb_packages.bzl", "your_rule_name")` line.
Then you can use the dictionary named the same as the `deb_packages` rule to refer to the packages you defined in the WORKSPACE file.

```python
load("@debian_jessie_amd64//debs:deb_packages.bzl", "debian_jessie_amd64")

docker_build(
    name = "python27",
    base = "//base:base",
    debs = [
        debian_jessie_amd64["libpython2.7-minimal"],
        debian_jessie_amd64["libpython2.7-stdlib"],
        debian_jessie_amd64["python2.7-minimal"],
        debian_jessie_amd64["zlib1g"],
        ],
    entrypoint = [
        "/usr/bin/python2.7",
    ],
    symlinks = {
        "/usr/bin/python": "/usr/bin/python2.7",
    },
)
```

### **Using the `update_workspace` helper program**

As you might have noticed, it is a lot of work to get the exact path and SHA256 hash of a `.deb` package.
All this information is already available online at the mirrors you defined in your WORKSPACE file: As soon as you know the exact distribution, package name and version, you should be able to just generate this data on the fly.

`update_workspace` is exactly such a helper program.
It uses the `buildifier` and `buildozer` tools from [https://github.com/bazelbuild/buildtools](https://github.com/bazelbuild/buildtools), which need to be available on your $PATH.

To update hashes and paths in a single `deb_packages` rule with the `update_workspace --update/-u RULENAME` switch.
If you call it with `all` as rule name, it will update hashes and paths in all packages referenced in `deb_packages` rules.

This solves the issue if you already have packages referenced in your rules and want to update them to their current available version.
Entering new packages is still a chore though (at least you don't need to actually look for hashes or exact paths, since you can just enter empty strings and run an update).

`buildozer` is able to parse all BUILD files in a repository for `docker_build` rules.
Using this, `update_workspace -a/--add` will look through all these rules in the whole repository, check if their `debs` section exists and add all packages that didn't yet occur in the respective `deb_packages` rule.
After this, it'll automatically run the update routine and update all `deb_packages` rules.

The minimal work you need with this tool is now reduced to create `deb_packages` rules with empty `packages` and `packages_sha256` and choose mirrors.
Then you can refer to whatever package you want to in your BUILD files, run `update_workspace -a` and you get a WORKSPACE file with the currently available versions of packages back.

Version pinning (`foo=1.2.3-4` instead of just `foo` as package name) is also supported, to have more fine grained control of which package ends up in which container.
It is the user's responsibility to ensure that all versions are available at the mirror.
In case you always want the latest version for canary style builds, `foo=latest` is also supported.

Both commands output to stdout and don't actually change the WORKSPACE file, so you can use `diff` or other tools to inspect that everything worked out as expected.

This tool is intended as an external independent helper script and not to actually run during your bazel builds (it wouldn't really be possible to change the workspace during builds anyways).

# Reference

## deb_packages

```python
deb_loader()
```

Only used once in your WORKSPACE file to get the current version of the deb_loader tool which downloads and verifies `.deb` files.

To be used after loading the two rules refered to here.

## deb_packages

```python
deb_packages(name, architecture, distro, distro_type, mirrors, packages, packages_sha256)
```

A rule that downloads `.deb` packages from a Debian style repository and makes them available in the WORKSPACE.

For a `deb_packages` rule named `foo_bar`, packages can be used by loading `load("@foo_bar//debs:deb_packages.bzl", "foo_bar")` into your `BUILD` file, then referencing the package with `foo_bar['packagename']`.

The packagename is expected to be the exact package name as available upstream.
If you use the `update_workspace` helper, version pinning with `packagename=version` is supported.

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
        <p><code>rule name, required</code></p>
      </td>
    </tr>
    <tr>
      <td><code>architecture</code></td>
      <td>
        <p><code>the target package architecture, required</code></p>
        <p>Examples: amd64, arm64, s390x etc.</p>
      </td>
    </tr>
    <tr>
      <td><code>distro</code></td>
      <td>
        <p><code>the name of the distribution, required</code></p>
        <p>Examples: wheezy, jessie, jessie-backports, etc.</p>
      </td>
    </tr>
    <tr>
      <td><code>distro_type</code></td>
      <td>
        <p><code>the name of the distribution type, required</code></p>
        <p>currently only <code>debian</code> and <code>ubuntu</code> are supported</p>
      </td>
    </tr>
    <tr>
      <td><code>mirrors</code></td>
      <td>
        <p><code>the base url of the package repository, required</code></p>
        <p>All of these mirrors are expected to host a Debian style mirror and to host the same versions of files</p>
      </td>
    </tr>
    <tr>
      <td><code>packages</code></td>
      <td>
        <p><code>a dictionary mapping packagename to package_path, required</code></p>
        <p>The deb file is expected to be found at <code>mirror</code> + <code>distro_type</code> + <code>package_path</code></p>
        <p>Package names can optionally contain a version (<code>packagename=1.2.3-4</code>)</p>
      </td>
    </tr>
    <tr>
      <td><code>packages_sha256</code></td>
      <td>
        <p><code>a dictionary mapping packagename to package_hash, required</code></p>
        <p>The deb file at package_path is expected to have this sha256 hash</p>
        <p>Keys need to be the same as in the <code>packages</code> dictionary</p>
      </td>
    </tr>
  </tbody>
</table>
