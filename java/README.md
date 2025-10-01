# Documentation for `gcr.io/distroless/java`

## Image Contents

This image contains a minimal Linux, OpenJDK-based runtime.

Specifically, the image contains everything in the [base image](../base/README.md), plus:

* OpenJDK 17 (`gcr.io/distroless/java17-debian12`) and its dependencies.
* Temurin OpenJDK 21 (`gcr.io/distroless/java21-debian12`) and its dependencies
* Temurin OpenJDK 25 (`gcr.io/distroless/java25-debian13`) and its dependencies

## Usage

The entrypoint of this image is set to the equivalent of "java -jar", so this image expects users to supply a path to a JAR file in the CMD.

## Add another JAVA version

To support JAVA version you need to do the following steps:
- Create a new file `java_{newVersion}.MODULE.bazel` in the [java_temurin](private/repos/java_temurin) folder based on the latest created.
- In the file, you must specify the tar.gz files used to build the images, ideally from this URL: `https://github.com/adoptium/temurin{newVersion}-binaries/releases`.
- Add the new names in the [java.MODULE.bazel](private/repos/java_temurin/java.MODULE.bazel) file.
- Add two yaml files in the [java/testdata](java/testdata) folder to prepare the tests, you can take inspiration on the other files.
- Add the new version in `JAVA_TEMURIN_VERSIONS` and `JAVA_TEMURIN_VERSIONS_PER_DISTRO` (must be debian13 starting from Java 25).

You can then ensure everything works on this folder with `bazel build //java:...`