# Documentation for dotnet distroless build

## Image Contents

This image definition contains a minimal Linux, dotnet-based [coreCLR](https://github.com/dotnet/core) runtime.

Specifically, the image contains everything in the [/cc image](../../cc/README.md), plus:

- coreCLR 2.1.0 Runtime and its [dependencies]

  * [runtime-deps](https://github.com/dotnet/dotnet-docker/blob/master/2.1/runtime-deps/stretch-slim/amd64/Dockerfile)
  * [runtime](https://github.com/dotnet/dotnet-docker/blob/master/2.1/runtime/stretch-slim/amd64/Dockerfile)
  * [Linux System Prerequisites for .NET Core](https://github.com/dotnet/core/blob/master/Documentation/linux-prereqs.md)

```
    base = "//cc:cc",
    debs = [
        packages["libcurl3"],
        packages["libkrb5-3"],
        packages["libicu57"],
        packages["liblttng-ust0"],
        packages["libssl1.0.2"],
        packages["zlib1g"],
    ],
```

## Usage

The entrypoint of this image is left unset so this image expects users to supply a the full 'dotnet' and path to the generated .dll file in the CMD.


## Example Hello World

To build directly:

```bash
$ dotnet --version
2.1.0

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
FROM microsoft/dotnet:2.1-sdk AS build-env
ADD . /app
WORKDIR /app
RUN dotnet restore -r linux-x64
RUN dotnet publish  -c Release -r linux-x64

FROM gcr.io/distroless/dotnet
WORKDIR /app
COPY --from=build-env /app /app/
#CMD ["dotnet", "bin/Release/netcoreapp2.1/linux-x64/publish/console.dll"]
CMD ["bin/Release/netcoreapp2.1/linux-x64/publish/console"]
```

then
```bash

$ docker build -t myapp .

$ docker run -t myapp
Hello World!
```

Note, for self-contained apps and additional dependencies, you may need to install those separately as described here

- [https://github.com/dotnet/core/blob/master/Documentation/self-contained-linux-apps.md](https://github.com/dotnet/core/blob/master/Documentation/self-contained-linux-apps.md)

For example:

```dockerfile
FROM microsoft/dotnet:2.1-sdk AS build-env
ADD . /app
WORKDIR /app
RUN dotnet restore -r linux-x64
RUN dotnet publish  -c Release -r linux-x64 --self-contained
RUN mkdir bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libnghttp2.so.14 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libidn2.so.0 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/librtmp.so.1 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libssh2.so.1 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libpsl.so.5 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/liblber-2.4.so.2 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libldap_r-2.4.so.2 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libunistring.so.0 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libgnutls.so.30 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libhogweed.so.4 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libnettle.so.6 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libgmp.so.10 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libkrb5support.so.0 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libsasl2.so.2 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libgssapi_krb5.so.2 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libk5crypto.so.3 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.2 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libp11-kit.so.0 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libtasn1.so.6 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /usr/lib/x86_64-linux-gnu/libffi.so.6 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /lib/x86_64-linux-gnu/libkeyutils.so.1 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /lib/x86_64-linux-gnu/libidn.so.11 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /lib/x86_64-linux-gnu/libcom_err.so.2 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /lib/x86_64-linux-gnu/libgpg-error.so.0 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/ && \
    cp /lib/x86_64-linux-gnu/libgcrypt.so.20 bin/Release/netcoreapp2.1/linux-x64/publish/netcoredeps/

FROM gcr.io/distroless/dotnet
WORKDIR /app
COPY --from=build-env /app /app/
CMD ["bin/Release/netcoreapp2.1/linux-x64/publish/hello"]
```

## Example Hello World with bazel

See the dotnet [Hello World](../../examples/dotnet/) directory for an example and [examples/dotnet/BUILD](../../examples/dotnet/BUILD) using bazel:

```
docker_build(
    name = "hello",
    base = "//dotnet:dotnet",
    cmd = [
        "dotnet",
        "/bin/Release/netcoreapp2.1/hello.dll",
    ],
    files = [":bin"],
)
```

### Prerequsite

Since the binary build happens outside of bazel, we need to build a binary out-of-band.

Requires a local installation of dotnet 2.1.0:

- [dotnet 2.1.0](https://download.microsoft.com/download/1/B/4/1B4DE605-8378-47A5-B01B-2C79D6C55519/dotnet-sdk-2.0.0-linux-x64.tar.gz))


```
dotnet --version
2.1.0
```

### Build and test dotnet locally

```
cd examples/dotnet

dotnet restore
dotnet publish
```

```
dotnet bin/Release/netcoreapp2.1/hello.dll
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

[examples/dotnet/hello.csproj](../../examples/dotnet/hello.csproj)

```
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.1</TargetFramework>
    <RuntimeFrameworkVersion>2.1.0</RuntimeFrameworkVersion>
    <RuntimeIdentifiers>linux-x64;</RuntimeIdentifiers>    
  </PropertyGroup>
</Project>
```

then

```
cd examples/dotnet

dotnet restore -r linux-x64
dotnet publish  -c Release -r linux-x64
```

which will generate a contained binary:

```
$ bin/Release/netcoreapp2.1/linux-x64/publish/hello
Hello World
```

which in turn makes the build rule just

```
docker_build(
    name = "hello",
    base = "//dotnet:dotnet",
    cmd = [
        "/bin/Release/netcoreapp2.1/linux-x64/publish/hello",
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

dotnet restore -r linux-x64
dotnet publish  -c Release -r linux-x64
```
