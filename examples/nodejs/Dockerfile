FROM node:12.14.0 AS build-env
ADD . /app
WORKDIR /app

FROM gcr.io/distroless/nodejs
COPY --from=build-env /app /app
WORKDIR /app
CMD ["hello.js"]
