# Documentation for `gcr.io/distroless/java`

## Image Contents

This image contains a minimal Linux, OpenJDK-based runtime.

Specifically, the image contains everything in the [base image](../base/README.md), plus:

* OpenJDK 17 (`gcr.io/distroless/java17-debian12`) and its dependencies.
* Temurin OpenJDK 21 (`gcr.io/distroless/java21-debian12`) and its dependencies


## Usage

The entrypoint of this image is set to the equivalent of "java -jar", so this image expects users to supply a path to a JAR file in the CMD.
