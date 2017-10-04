# Examples

### **Downloading minimal python library packages from a snapshot of `debian jessie`**.

`deb_repositories` and `deb_packages` are repository rules, and therefore made to be used in the `WORKSPACE`.

First, tell bazel to load these rules with a `load()` statement and then initialize the `deb_repositories()` rule to make sure the deb_file_loader tool is available during the build.

```bzl
load(
    "//deb_loader:deb_loader.bzl",
    "deb_packages",
    "deb_repositories",
)
deb_repositories()
```

Next, create a http_file rule that points to a PGP armored public key.
It is highly recommended to also specify the sha256 hash of the key file to make sure it is untampered.
This key must be the one that signed the `Release` file for the distribution that you'll specify in the next step.

This is necessary because the `update_workspace` helper tool verifies files according to https://wiki.debian.org/SecureApt

Here is for example a list of keys for Debian: https://ftp-master.debian.org/keys.html (note the https - it is important that you are sure the fingerprints are directly from the Debian project)

To verify that a key you downloaded has the correct fingerprint, you can download it locally and run `gpg --with-fingerprint keyfile.asc`.
If no fingerprint is displayed, try again with `gpg2` instead of `gpg`.
The fingerprint of the downloaded key must exactly match the fingerprint you obtained via a trusted channel.

After verifying, you can run `sha256sum keyfile.asc` to get a hash that ensures that you'll receive the same file from now on.

```
# Look on https://ftp-master.debian.org/keys.html for the key and its fingerprint you want to use
# Also verify the fingerprint is correct via a different source (mailing lists, other web sites, colleagues, different internet connections...)

wget -q https://ftp-master.debian.org/keys/archive-key-8.asc

gpg2 --with-fingerprint archive-key-8.asc
pub  rsa4096/2B90D010 2014-11-21 [expires: 2022-11-19]
      Key fingerprint = 126C 0D24 BD8A 2942 CC7D  F8AC 7638 D044 2B90 D010
uid                   Debian Archive Automatic Signing Key (8/jessie) <ftpmaster@debian.org>

# Manually verify that this is the correct fingerprint that you obtained before

sha256sum archive-key-8.asc
e42141a829b9fde8392ea2c0e329321bb29e5c0453b0b48e33c9f88bdc4873c5  archive-key-8.asc
```

Now enter this information in your `http_file` rule:

```bzl
http_file(
    name = "jessie_archive_key",
    sha256 = "e42141a829b9fde8392ea2c0e329321bb29e5c0453b0b48e33c9f88bdc4873c5",
    urls = ["https://ftp-master.debian.org/keys/archive-key-8.asc"],
)
```

You can of course also use the key your organization uses internally to sign their Debian style repositories instead of the ones used by the Debian project.

Another good practice is to mirror this file, maybe at a location you control in case you are worried that the Debian project might not always be able to deliver this file to you.

Also take note of the `urls` syntax instead of the deprecated single `url`


Next, for every source of deb packages, create a `deb_packages` rule.
You can define additional mirrors per package source, but it is assumed that all these mirrors will serve the exact same files.
Hashes are checked after downloading files.

```bzl
deb_packages(
    name = "debian_jessie_amd64",
    arch = "amd64",
    distro = "jessie",
    distro_type = "debian",
    mirrors = [
        "http://deb.debian.org/debian",
        "http://my.private.mirror/debian",
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
    pgp_key = "jessie_archive_key",
)
```

Internally `.deb` files referenced here will be downloaded by the tool defined in `deb_repositories`, renamed to their SHA256 hash (not all characters used in file names are legal in bazel names) and made available in a dictionary named the same as the `deb_packages` rule.
This dictionary is made available in a file named `deb_packages.bzl` in the `debs` subfolder of this rule.
You can find the generated and downloaded files in the `./bazel-distroless/external/your_rule_name/debs` folder after building the project if you're interested.

To actually use the `.deb` files in a BUILD file rule like `docker_build`, you first have to load all dictionaries of package sources you want to use.
This is done with the `load("@your_rule_name//debs:deb_packages.bzl", "your_rule_name")` line.
Then you can use the dictionary named the same as the `deb_packages` rule to refer to the packages you defined in the WORKSPACE file.

```bzl
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

### **Adding new packages or package sources**

#### Manually

Chosse a Debian mirror that you want to use, for example http://deb.debian.org/debian.

Visit the `/dists/` directory on that mirror and choose the distro you want to use, for example `jessie`.

Download the `Release` and `Release.gpg` files in the distro's folder (in our example: http://deb.debian.org/debian/dists/jessie/Release and http://deb.debian.org/debian/dists/jessie/Release.gpg).

Verify the file's signature: `gpg --verify Release.gpg Release`
It **must** be signed with a vald signature by one of the keys on this site: https://ftp-master.debian.org/keys.html

Also create a `http_file` rule that references this key and make sure to include a SHA256 hash, so it won't change later:

```bzl
http_file(
    name = "jessie_archive_key",
    sha256 = "e42141a829b9fde8392ea2c0e329321bb29e5c0453b0b48e33c9f88bdc4873c5",
    urls = ["https://ftp-master.debian.org/keys/archive-key-8.asc"],
)
```

This file contains the paths to various other files and their hashes.
Scroll down to the SHA256 section and choose the path to the `Packages` file that you want to use (for example `main/binary-amd64/Packages.xz`) and also note down its hash.

Append the `Packages` file path to your mirror URL + `/dists/yourdistro` (for example http://deb.debian.org/debian/dists/jessie/main/binary-amd64/Packages.xz) and download the resulting file.

Verify the hash of the file you received (with the exception of the GPG keys site, all these downloads happen on insecure channels by design) with `sha256sum`:
`sha256sum Packages.xz`

Unpack the archive (if you downloaded the `Packages.gz` or `Packages.xz` file) and now you'll have a huge text file that contains hashes and paths to all Debian packages in that repository.

Open this file and start looking for the package names you want to use in your `BUILD` files.
You can do this for example in a text editor or using `grep` (the -A switch prints that many lines after each match): `grep -A 25 "Package: python2.7-minimal" Packages`

Now you finally have the info that you must enter in the `deb_packages` rule:
The value at `Filename` is the path to the exact package to be used and the value at `SHA256` is the verified hash that this file will have.

Now enter this information in the `WORKSPACE` file in a `deb_packages` rule:

```bzl
deb_packages(
    name = "my_new_manual_source",
    arch = "amd64",
    distro = "jessie",
    distro_type = "debian",
    mirrors = [
        "http://deb.debian.org/debian",
        "http://my.private.mirror/debian",
    ],
    packages = {
        "libpython2.7-minimal": "pool/main/p/python2.7/libpython2.7-minimal_2.7.9-2+deb8u1_amd64.deb",
    },
    packages_sha256 = {
        "libpython2.7-minimal": "916e2c541aa954239cb8da45d1d7e4ecec232b24d3af8982e76bf43d3e1758f3",
    },
    pgp_key = "jessie_archive_key",
)
```

#### Automatically using the `update_workspace` tool

As you saw, most of the information is already available on mirrors anyways as soon as you know the distro, exact package name, architecture and version.
If you enter the correct rule name for the `pgp_key` field, this also means that you can do this in a verified chain of trust.

The `update_workspace` tool can help you with this.

To use it, just create a `deb_packages` rule in your WORKSPACE file without any packages defined:

```bzl
deb_packages(
    name = "my_new_automatic_source",
    arch = "amd64",
    distro = "jessie",
    distro_type = "debian",
    mirrors = [
        "http://deb.debian.org/debian",
        "http://my.private.mirror/debian",
    ],
    packages = {},
    packages_sha256 = {},
    pgp_key = "jessie_archive_key",
)
```

Now use this rule in your `BUILD` files, as if the packages were already defined:

```bzl
load("@my_new_automatic_source//debs:deb_packages.bzl", "my_new_automatic_source")

docker_build(
    name = "python27",
    base = "//base:base",
    debs = [
        my_new_automatic_source["libpython2.7-minimal"],
        my_new_automatic_source["libpython2.7-stdlib"],
        my_new_automatic_source["python2.7-minimal"],
        my_new_automatic_source["zlib1g"],
        ],
    entrypoint = [
        "/usr/bin/python2.7",
    ],
    symlinks = {
        "/usr/bin/python": "/usr/bin/python2.7",
    },
)
```

Now run `bazel run update_workspace` (similar to the `gazelle` tool used by the golang Bazel rules) and the helper tool will fetch the relevant files from the mirror(s), parse BUILD files for `docker_build` rules and add the data for missing packages at the respective `deb_packages` rule.
It uses the `buildifier` and `buildozer` tools from [https://github.com/bazelbuild/buildtools](https://github.com/bazelbuild/buildtools), which need to be available on your $PATH.

It will also update any existing packages to either the most recent version available on the mirror or a version you specified in the package name (`package=version`).
The string `latest` is also supported if you want to use version pinning.

# Reference

## deb_repositories

```python
deb_repositories()
```

Only used once in your WORKSPACE file to get the current version of the `deb_file_loader` tool which downloads and verifies `.deb` files.

To be used after loading the two rules refered to here.

## deb_packages

```python
deb_packages(name, arch, distro, distro_type, mirrors, packages, packages_sha256)
```

A rule that downloads `.deb` packages from a Debian style repository and makes them available in the WORKSPACE.

For a `deb_packages` rule named `foo_bar`, packages can be used by loading `load("@foo_bar//debs:deb_packages.bzl", "foo_bar")` into your `BUILD` file, then referencing the package with `foo_bar['packagename']`.

The packagename is expected to be the exact package name as available upstream.
This is not enforced by bazel or these rules, but makes automatic parsing and updating much easier.
If you use the `update_workspace` helper, version pinning with `packagename=version` is supported.

Every key name in the `packages` section must exactly match a key name in the `packages_sha256` section.

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
      <td><code>arch</code></td>
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
        <p><code>the full url of the package repository, required</code></p>
        <p>All of these mirrors are expected to host a Debian style mirror and to host the same versions of files</p>
        <p>Many mirrors host their packages in a subdirectory (e.g. <code>http://deb.debian.org/debian</code> instead of <code>http://deb.debian.org</code>), in that case use the former URL.</p>
      </td>
    </tr>
    <tr>
      <td><code>packages</code></td>
      <td>
        <p><code>a dictionary mapping packagename to package_path, required</code></p>
        <p>The deb file is expected to be found at <code>mirror</code> + <code>package_path</code></p>
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
    <tr>
      <td><code>pgp_key</code></td>
      <td>
        <p><code>the name of the http_file rule that points to a file containing an armored PGP key, required</code></p>
        <p>This PGP key must be one that signed the <code>Release</code> file, meaning the signature of the <code>Release.gpg</code> file of the repository must verify with this key.</p>
        <p>This is not checked when downloading individual deb packages, it is used by the helper tool to establish a chain of trusted inputs when updating file paths and hashes.</p>
      </td>
    </tr>
  </tbody>
</table>
