# "Distroless" Docker Images

[![Build Status](https://travis-ci.org/GoogleContainerTools/distroless.svg?branch=master)](https://travis-ci.org/GoogleContainerTools/distroless)

"Distroless" images contain only your application and its runtime dependencies.
They do not contain package managers, shells or any other programs you would expect to find in a standard Linux distribution.

For more information, see this [talk](https://swampup2017.sched.com/event/A6CW/distroless-docker-containerizing-apps-not-vms?iframe=no&w=100%&sidebar=yes&bg=no) ([video](https://www.youtube.com/watch?v=lviLZFciDv4)).

## Why should I use distroless images?

Restricting what's in your runtime container to precisely what's necessary for your app is a best practice employed by Google
and other tech giants that have used containers in production for many years.
It improves the signal to noise of scanners (e.g. CVE) and reduces the burden of establishing provenance to just what you need.

## How do I use distroless images?

These images are built using the [bazel](https://bazel.build) tool, but they can also be used through other Docker image build tooling.

### Entrypoints

Note that distroless images by default do not contain a shell.
That means the Dockerfile `ENTRYPOINT` command must be specified in `vector` form, to avoid the container runtime prefixing with a shell.

This works:

```
ENTRYPOINT ['myapp']
```

But this does not work:

```
ENTRYPOINT 'myapp'
```

### Docker

Docker multi-stage builds make using distroless images easy.
Follow these steps to get started:

* Pick the right base image for your application stack.
  We publish the following distroless base images on `gcr.io`:
    * [gcr.io/distroless/static](base/README.md)
    * [gcr.io/distroless/base](base/README.md)
    * [gcr.io/distroless/java](java/README.md)
    * [gcr.io/distroless/cc](cc/README.md)

* The following images are also published on `gcr.io`, but are considered experimental and not recommended for production usage:
    * [gcr.io/distroless/python2.7](experimental/python2.7/README.md)
    * [gcr.io/distroless/python3](experimental/python3/README.md)
    * [gcr.io/distroless/nodejs](experimental/nodejs/README.md)
    * [gcr.io/distroless/java/jetty](java/jetty/README.md)
    * [gcr.io/distroless/dotnet](experimental/dotnet/README.md)
* Write a multi-stage docker file.
  Note: This requires Docker 17.05 or higher.

  The basic idea is that you'll have one stage to build your application artifacts, and insert them into your runtime distroless image.
  If you'd like to learn more, please see the documentation on [multi-stage builds](https://docs.docker.com/engine/userguide/eng-image/multistage-build/).


#### Examples with Docker
  Here's a quick example for go:

  ```dockerfile
  # Start by building the application.
  FROM golang:1.8 as build

  WORKDIR /go/src/app
  COPY . .

  RUN go get -d -v ./...
  RUN go install -v ./...

  # Now copy it into our base image.
  FROM gcr.io/distroless/base
  COPY --from=build /go/bin/app /
  CMD ["/app"]
  ```

You can find other examples here:

* [Java](examples/java/Dockerfile)
* [Python](examples/python2.7/Dockerfile)
* [Python 3](examples/python3/Dockerfile)
* [Golang](examples/go/Dockerfile)
* [Node.js](examples/nodejs/Dockerfile)
* [dotnet](examples/dotnet/Dockerfile)

To run any example, go the the directory for the language and run
```
docker build -t myapp .
docker run -t myapp
```

### Bazel

For full documentation on how to use bazel to generate Docker images, see the [bazelbuild/rules_docker](http://github.com/bazelbuild/rules_docker) repository.

For documentation and examples on how to use the bazel package manager rules, see [./package_manager](./package_manager)

Examples can be found in this repository in the [examples](examples/) directory.

#### Examples with Bazel

We have some examples on how to run some common application stacks in the /examples directory.
See here for:

* [Java](examples/java/BUILD)
* [Python](examples/python2.7/BUILD)
* [Python 3](examples/python3/BUILD)
* [Golang](examples/go/BUILD)
* [Node.js](examples/nodejs/BUILD)
* [dotnet](examples/dotnet/BUILD)

See here for examples on how to complete some common tasks in your image:

* [Adding and running as a non-root user](examples/nonroot)
* [Including debian packages](https://github.com/bazelbuild/rules_docker#container_image-1)
* [Including CA certificates](cacerts/)

See here for more information on how these images are [built and released](RELEASES.md).

### Jib

For full documentation on how to use Jib to generate Docker images from Maven and Gradle, see the [GoogleContainerTools/jib](http://github.com/GoogleContainerTools/jib) repository.

### Debug Images

Distroless images are minimal and lack shell access.  The ```:debug``` image set for each language provides a busybox shell to enter.

For example:


```
cd examples/python2.7/
```

edit the ```Dockerfile``` to change the final image to ```:debug```:

```dockerfile
FROM python:2.7-slim AS build-env
ADD . /app
WORKDIR /app

FROM gcr.io/distroless/python2.7:debug
COPY --from=build-env /app /app
WORKDIR /app
CMD ["hello.py", "/etc"]
```

then build and launch with an shell entrypoint:

```
$ docker build -t my_debug_image .
```

```
$ docker run --entrypoint=sh -ti my_debug_image

/app # ls
BUILD       Dockerfile  hello.py
```

> Note: [ldd](http://man7.org/linux/man-pages/man1/ldd.1.html) is not installed in the base image as it's a shell script, you can copy it in or download it.
