FROM python:3.6-stretch AS build-env
ADD . /app
WORKDIR /app
RUN pip3 install --upgrade pip
RUN pip3 install -r /requirements.txt

# This is an example of how to install requirements, copy to the distroless
# image and use them.
FROM gcr.io/distroless/python3
COPY --from=build-env /app /app
COPY --from=build-env /usr/local/lib/python3.6/site-packages /site-packages
ENV PYTHONPATH=/site-packages
WORKDIR /app
CMD ["hello.py", "/etc"]
