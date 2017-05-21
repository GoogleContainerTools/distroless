[![Build Status](https://travis-ci.org/GoogleCloudPlatform/distroless.svg?branch=master)](https://travis-ci.org/GoogleCloudPlatform/distroless)

# "Distroless" Docker Images

"Distroless" images contain only your application and it's runtime dependencies.
They do not contain package managers, shells any other programs you would expect to find in a standard Linux distribution.

For more information, see this talk.

## Why should I use distroless images?

## How do I use distroless images?

These images are built using the [bazel](https://bazel.build) tool, but they can also be used through other Docker image build tooling.

### Docker

Docker multi-stage builds make using distroless images easy.
Follow these steps to get started:

* Pick the right base image for your application stack
  We publish the following distroless base images on `gcr.io`:
    * [gcr.io/distroless/base](base/README.md)
    * [gcr.io/distroless/python2.7](python2.7/README.md)
    * [gcr.io/distroless/java](java/README.md)
    * [gcr.io/distroless/java/jetty](java/jetty/README/md)
    * [gcr.io/distroless/cc](cc/README.md)
* Write a multi-stage docker file.
  The basic idea is that you'll have one stage to build your application artifacts, and insert them into your runtime distroless image.
  If you'd like to learn more, please see the documentation on [multi-stage builds]().

  Here's a quick example.
  ```
  # Start by building the application.
  FROM golang:1.8 as build

  WORKDIR /go/src/app
  COPY . .

  RUN go-wrapper download   # "go get -d -v ./..."
  RUN go-wrapper install

  # Now copy it into our cc image.
  FROM gcr.io/distroless/base
  COPY --from=build /go/bin/app /
  CMD ["/app"]
  ```

### Bazel
<show docker_build usage>

## Examples

We have some examples on how to run some common application stacks in the /examples directory.
See here for:

* [Java]()
  * [Jetty]()
* [Python]()
* [Golang]()

See here for examples on how to complete some common tasks in your image:

* [Adding and running as a non-root user]()
* [Including debian packages]()

See here for more information on how these images are [built and released]().
