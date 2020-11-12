# How to become a contributor and submit your own code

## Contributor License Agreements

We'd love to accept your patches! Before we can take them, we have to jump a couple of legal hurdles.

Please fill out either the individual or corporate [Contributor License Agreement (CLA)](https://cla.developers.google.com/about).

  * If you are an individual writing original source code and you're sure you own the intellectual property, then you'll need to sign an [individual CLA](https://cla.developers.google.com/about/google-individual).
  * If you work for a company that wants to allow you to contribute your work, then you'll need to sign a [corporate CLA](https://cla.developers.google.com/about/google-corporate).

Follow either of the two links above to access the appropriate CLA and instructions for how to sign and return it. Once we receive it, we'll be able to accept your pull requests.

## How to Build and Test

Look into `./test.sh` to understand how. Minimally,

1. Build `dpkg_parser.par` first, if not done so: `bazel build //package_manager:dpkg_parser.par` (You may need to provide `--host_force_python=PY2` if you don't have a working version of Python 3.)

   You don't have to repeat this step unless you cleaned your workspace or want to generate a new version of `dpkg_parser.par`.
1. `bazel build //...`

For running tests, check `./test.sh`. (`bazel test //...` will NOT run all tests, as many tests are marked "manual".)

For building and loading images to your local Docker engine, do `bazel run //java:java11_debian10` for example. After successful build, `docker images` will list images like `bazel/java:java11_debian10`.

For styling Bazel files, install and run `buildifier` with:

```shell
# Install buildifier version 3.2.0
GO111MODULE=on go get github.com/bazelbuild/buildtools/buildifier@3.2.0

# This will automatically fix files.
buildifier -mode=fix $(find . -name 'BUILD*' -o -name 'WORKSPACE*' -o -name '*.bzl' -type f)
```

For styling Python files, [install](https://www.pylint.org/#install) and run `pylint` with:

```shell
# Install pylint
sudo pip install pylint
# Or
sudo apt-get install pylint

# Identify python style issues.
find . -name "*.py" | xargs pylint --disable=R,C
```

## Contributing a Patch

1. Submit an issue describing your proposed change to the repo in question.
1. The repo owner will respond to your issue promptly.
1. If your proposed change is accepted, and you haven't already done so, sign a Contributor License Agreement (see details above).
1. Fork the desired repo, develop and test your code changes.
1. Submit a pull request.
