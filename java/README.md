# Documentation for `gcr.io/distroless/java`

## Image Contents

This image contains a minimal Linux, OpenJDK-based runtime.

Specifically, the image contains everything in the [base image](../base/README.md), plus:

* Temurin OpenJDK 17 (`gcr.io/distroless/java17-debian13`) and its dependencies.
* Temurin OpenJDK 21 (`gcr.io/distroless/java21-debian13`) and its dependencies
* Temurin OpenJDK 25 (`gcr.io/distroless/java25-debian13`) and its dependencies

## Usage

The entrypoint of this image is set to the equivalent of "java -jar", so this image expects users to supply a path to a JAR file in the CMD.

## Add another JAVA version

To support a new JAVA version you need to do the following steps:
- Add the new version to `ADOPTIUM_DEB_PER_DISTRO` in [java/BUILD](BUILD).
- Add the new version to `JAVA_MAJOR_VERSIONS` in [java/config.bzl](config.bzl).
- Add two yaml files in the [java/testdata](testdata) folder to prepare the tests, you can take inspiration on the other files.

You can then ensure everything works on this folder with `bazel build //java:...`
