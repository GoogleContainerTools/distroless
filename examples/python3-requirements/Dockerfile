# Build a virtualenv using the appropriate Debian release
# * Install gcc and libc6-dev to compile C Python modules
# * In the virtualenv: Update pip setuputils and wheel to support building new packages
FROM python:3.13-slim-trixie AS build
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends --yes gcc libc6-dev && \
    # Symlink the distroless path for python: /usr/bin/python to the build 
    # image path: /usr/local/bin/python to ensure the runtime image's venv has
    # the right python paths.
    ln -s /usr/local/bin/python /usr/bin/python && \
    /usr/bin/python -m venv /venv && \
    /venv/bin/pip install --upgrade pip setuptools wheel

# Build the virtualenv as a separate step: Only re-execute this step when requirements.txt changes
FROM build AS build-venv
COPY requirements.txt /requirements.txt
RUN /venv/bin/pip install --disable-pip-version-check -r /requirements.txt

# Copy the virtualenv into a distroless image
FROM gcr.io/distroless/python3-debian13
COPY --from=build-venv /venv /venv
COPY . /app
WORKDIR /app
ENTRYPOINT ["/venv/bin/python3", "psutil_example.py"]
