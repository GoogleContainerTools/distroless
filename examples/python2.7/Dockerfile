FROM python:2.7-slim AS build-env
ADD . /app
WORKDIR /app

FROM gcr.io/distroless/python2.7
COPY --from=build-env /app /app
WORKDIR /app
CMD ["hello.py", "/etc"]
