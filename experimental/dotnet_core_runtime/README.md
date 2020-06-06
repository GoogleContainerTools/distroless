# Microsoft .NET Core Distroless Container Image

This project defines a minimal Linux with [.NET Core](https://github.com/dotnet/core).

Specifically, the image contains everything described in the [base image](../../cc/README.md), plus .NET Core and necessary dependencies.

## Microsoft .NET Core 3.1 Runtime and its Dependencies

- [3.1/runtime-deps/buster-slim/amd64/Dockerfile](https://github.com/dotnet/dotnet-docker/blob/master/3.1/runtime-deps/buster-slim/amd64/Dockerfile)
- [3.1/runtime/buster-slim/amd64/Dockerfile](https://github.com/dotnet/dotnet-docker/blob/master/3.1/runtime/buster-slim/amd64/Dockerfile)

```text
    base = "//cc:cc",
    debs = [
        packages["libcurl3"],
        packages["libgssapi-krb5-2"],
        packages["libicu57"],
        packages["liblttng-ust0"],
        packages["libssl1.0.2"],
        packages["libunwind8"],
        packages["libuuid1"],
        packages["zlib1g"],
        packages["curl"],
        packages["libcomerr2"],
        packages["libidn2-0"],
        packages["libk5crypto3"],
        packages["libkrb5-3"],
        packages["libldap-2.4-2"],
        packages["libldap-common"],
        packages["libsasl2-2"],
        packages["libnghttp2-14"],
        packages["libpsl5"],
        packages["librtmp1"],
        packages["libssh2-1"],
        packages["libkeyutils1"],
        packages["libkrb5support0"],
        packages["libunistring0"],
        packages["libgnutls30"],
        packages["libgmp10"],
        packages["libhogweed4"],
        packages["libidn11"],
        packages["libnettle6"],
        packages["libp11-kit0"],
        packages["libffi6"],
        packages["libtasn1-6"],
        packages["libsasl2-modules-db"],
        packages["libdb5.3"],
        packages["libgcrypt20"],
        packages["libgpg-error0"],
        packages["libacl1"],
        packages["libattr1"],
        packages["libselinux1"],
        packages["libpcre3"],
        packages["libbz2-1.0"],
        packages["liblzma5"],
    ],
```

These dependencies are from the .NET Core `runtime` and `runtime-deps` that also install `curl`.

```bash
apt-get install apt-rdepends
apt-rdepends curl
```

Bazel does _not_ support dotnet build rules yet. ~See [#39](https://github.com/bazelbuild/rules_dotnet/issues/39).~ Unlike other distroless rules in this repository, users will need to compile and generate your .NET binary outside of Bazel manually. Instructions to generate the default binary files is described below.

## Usage

The `ENTRYPOINT` of this image is left unset, so this image expects users to supply a the full `dotnet` and related path to the generated `*.dll` file in the `CMD`.

### Examples

See [../../examples/dotnet_core/Dockerfile](../../examples/dotnet_core/Dockerfile).

### Prerequisites

We need to build a binary out-of-band since the binary build happens outside of Bazel.

It requires a local installation of .NET Core runtime.

See [.NET Core 3.1.4 - May 12, 2020](https://github.com/dotnet/core/blob/master/release-notes/3.1/3.1.4/3.1.4.md) release.
