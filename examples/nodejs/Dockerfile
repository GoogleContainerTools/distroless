FROM node:10.17.0 AS build-env
ADD . /app
WORKDIR /app

FROM gcr.io/distroless/nodejs
COPY --from=build-env /app /app
WORKDIR /app
CMD ["hello.js"]
