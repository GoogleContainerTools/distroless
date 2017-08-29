# "Distroless" Docker Images

[![Build Status](https://travis-ci.org/GoogleCloudPlatform/distroless.svg?branch=master)](https://travis-ci.org/GoogleCloudPlatform/distroless)

"Distroless" images contain only your application and its runtime dependencies.
They do not contain package managers, shells any other programs you would expect to find in a standard Linux distribution.

For more information, see this [talk](https://swampup2017.sched.com/event/A6CW/distroless-docker-containerizing-apps-not-vms?iframe=no&w=100%&sidebar=yes&bg=no) ([video](https://www.youtube.com/watch?v=lviLZFciDv4)).

## Why should I use distroless images?

Restricting what's in your runtime to container to precisely what's necessary for your app is a best practice employed by Google
and other tech giants that have used containers in production for many years.
It improves the signal to noise of scanners (e.g. CVE) and reduces the burden of establishing provenance to just what you need.

## How do I use distroless images?

These images are built using the [bazel](https://bazel.build) tool, but they can also be used through other Docker image build tooling.

### Docker

Docker multi-stage builds make using distroless images easy.
Follow these steps to get started:

* Pick the right base image for your application stack
  We publish the following distroless base images on `gcr.io`:
    * [gcr.io/distroless/base](base/README.md)
    * [gcr.io/distroless/python2.7](python2.7/README.md)
    * [gcr.io/distroless/nodejs](nodejs/README.md)
    * [gcr.io/distroless/java](java/README.md)
    * [gcr.io/distroless/java/jetty](java/jetty/README/md)
    * [gcr.io/distroless/cc](cc/README.md)
* Write a multi-stage docker file.
  Note: This requires Docker 17.05 or higher.

  The basic idea is that you'll have one stage to build your application artifacts, and insert them into your runtime distroless image.
  If you'd like to learn more, please see the documentation on [multi-stage builds](https://docs.docker.com/engine/userguide/eng-image/multistage-build/).

  Here's a quick example.
  ```
  # Start by building the application.
  FROM golang:1.8 as build

  WORKDIR /go/src/app
  COPY . .

  RUN go-wrapper download   # "go get -d -v ./..."
  RUN go-wrapper install

  # Now copy it into our base image.
  FROM gcr.io/distroless/base
  COPY --from=build /go/bin/app /
  CMD ["/app"]
  ```

### Bazel

For full documentation on how to use bazel to generate Docker images, see the [bazelbuild/rules_docker](http://github.com/bazelbuild/rules_docker) repository.

For documentation and examples on how to use the bazel deb_packages rules and the related update helper script, see [./package_manager](./package_manager)

Examples can be found in this repository in the [examples](examples/) directory.

## Examples

We have some examples on how to run some common application stacks in the /examples directory.
See here for:

* [Java](examples/java/BUILD)
* [Python](examples/python2.7/BUILD)
* [Golang](examples/go/BUILD)
* [Node.js](examples/nodejs/BUILD)

See here for examples on how to complete some common tasks in your image:

* [Adding and running as a non-root user](examples/nonroot)
* [Including debian packages](https://github.com/bazelbuild/rules_docker#docker_build-1)
* [Including CA certificates](cacerts/)

See here for more information on how these images are [built and released](RELEASES.md).
