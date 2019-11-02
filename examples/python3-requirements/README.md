# Python 3 with requirements.txt

This is a Python 3 application that specifies third-party dependencies using requirements.txt. The
psutil module it uses is a C module that must be compiled. This is the most annoying kind of
dependency, since you need to build it in an environment where the C library and Python version
match where it will run.

It builds the final container in three stages:

1. `build`: Set up a Debian build environment that can compile Python C modules.
2. `build-venv`: Create a virtualenv using `requirements.txt`.
3. Output: Copy the venv and the code and build the final image.

The first step is only re-executed if you edit `Dockerfile`. The second step is only re-executed
if you change requirements.txt. The final step is very fast and will change on every code edit.


## Build and run

1. Build the image: `docker build . --tag=psutil-example`
2. Run it! `docker run --rm psutil-example`


## Example output

```
RSS: 13.0 MiB;  SHARED: 5.7 MiB; VIRTUAL: 19.9 MiB
```


## TODO: Bazel

It would be nice if we could show how to build this container with Bazel, but I don't actually know
how to do that.
