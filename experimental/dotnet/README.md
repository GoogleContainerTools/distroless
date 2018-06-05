# Documentation for dotnet distroless build

## Image Contents

This image definition contains a minimal Linux, dotnet-based [coreCLR](https://github.com/dotnet/core) runtime.

Specifically, the image contains everything in the [/cc image](../cc/README.md), plus:

- coreCLR 2.0.0 Runtime and its [dependencies]

  * [runtime-deps](https://github.com/dotnet/dotnet-docker/blob/master/2.0/runtime-deps/stretch/amd64/Dockerfile)
  * [runtime](https://github.com/dotnet/dotnet-docker/blob/master/2.0/runtime/stretch/amd64/Dockerfile)


```
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

> Note, these dependencies are from the coreclr ```runtime``` and ```runtime-deps``` that also install ```curl```
```
# apt-get install apt-rdepends
# apt-rdepends curl
```

>> **NOTE**  bazel does _not_ support dotnet build rules yet (see [issue #39](https://github.com/bazelbuild/rules_dotnet/issues/39)) so unlike other
distroless rules in this repo, users will need to compile and generate your dotnet binary outside of bazel manually.  Instructions to generate the default
binary files is described below.

## Usage

The entrypoint of this image is left unset so this image expects users to supply a the full 'dotnet' and path to the generated .dll file in the CMD.


## Example Hello World

To build directly:

```bash
$ dotnet --version
2.0.0

$ docker --version
Docker version 17.05.0-ce, build 89658be
```

then

```bash
$ mkdir console && cd console
$ dotnet new console
```

create a Dockerfile

```dockerfile
FROM microsoft/dotnet:2.0.0-sdk AS build-env
ADD . /app
WORKDIR /app
RUN dotnet restore
RUN dotnet publish  -c Release

FROM gcr.io/distroless/dotnet
WORKDIR /app
COPY --from=build-env /app /app/
ENTRYPOINT ["dotnet", "bin/Release/netcoreapp2.0/console.dll"]
```

then
```bash

$ docker build -t myapp .

$ docker run -t myapp
Hello World!
```


## Example Hello World with bazel

See the dotnet [Hello World](../examples/dotnet/) directory for an example and [examples/dotnet/BUILD](examples/dotnet/BUILD) using bazel:

```
docker_build(
    name = "hello",
    base = "//dotnet:dotnet",
    cmd = [
        "dotnet",
        "/bin/Release/netcoreapp2.0/hello.dll",
    ],
    files = [":bin"],
)
```

### Prerequsite

Since the binary build happens outside of bazel, we need to build a binary out-of-band.

Requires a local installation of dotnet 2.0.0: 

- [dotnet 2.0.0](https://download.microsoft.com/download/1/B/4/1B4DE605-8378-47A5-B01B-2C79D6C55519/dotnet-sdk-2.0.0-linux-x64.tar.gz))


```
dotnet --version
2.0.0
```

### Build and test dotnet locally

```
cd examples/dotnet

dotnet restore
dotnet publish -c Release
```

```
dotnet bin/Release/netcoreapp2.0/publish/hello.dll
Hello World
```


### Build distroless image

```
bazel build examples/dotnet:hello
bazel run examples/dotnet:hello
```

### Test distroless image

```
docker run -t bazel/examples/dotnet:hello
```

### Optionally generate platform-target binary

The entrypoint is left unset because users can generate a platform-specific binary to execute directly:

eg. if built on a linux workstation, edit:

[examples/dotnet/hello.csproj](examples/dotnet/hello.csproj)

```
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.0</TargetFramework>
    <RuntimeFrameworkVersion>2.0.0</RuntimeFrameworkVersion>
    <RuntimeIdentifiers>ubuntu.14.04-x64;</RuntimeIdentifiers>    
  </PropertyGroup>
</Project>
```

then 

```
cd examples/dotnet

dotnet restore -r ubuntu.14.04-x64
dotnet publish -c Release -r ubuntu.14.04-x64
```

which will generate a contained binary:

```
$ bin/Release/netcoreapp2.0/ubuntu.14.04-x64/publish/hello 
Hello World
```

which in turn makes the build rule just

```
docker_build(
    name = "hello",
    base = "//dotnet:dotnet",
    cmd = [
        "/bin/Release/netcoreapp2.0/ubuntu.14.04-x64/publish/hello",
    ],
    files = [":bin"],
)
```

## Running Tests

```
$ bazel test examples/dotnet:hello_test
```


## Generating default binary files 

The files under the ```examples/dotnet/bin/``` folder is currently part of the repo but is generated by using the default dotnet commands:

```
cd examples/dotnet

dotnet restore
dotnet publish -c Release
```
