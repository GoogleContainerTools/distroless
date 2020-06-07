# Microsoft .NET Core Distroless Container Image

This project defines a minimal Linux with [.NET Core](https://github.com/dotnet/core).

Specifically, the image contains everything described in the [base image](../../cc/README.md), plus .NET Core and necessary dependencies.

## Microsoft .NET Core 3.1 Runtime and its Dependencies

See [BUILD](BUILD) file for more information.

### Examples

See [../../examples/dotnet_core/Dockerfile](../../examples/dotnet_core/Dockerfile).

### Prerequisites

We need to build a binary out-of-band since the binary build happens outside of Bazel.

It requires a local installation of .NET Core runtime.

See [.NET Core 3.1.4 - May 12, 2020](https://github.com/dotnet/core/blob/master/release-notes/3.1/3.1.4/3.1.4.md) release.
