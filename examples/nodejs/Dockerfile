FROM node:18 AS build-env
COPY . /app
WORKDIR /app

RUN npm ci --omit=dev

FROM gcr.io/distroless/nodejs:18
COPY --from=build-env /app /app
WORKDIR /app
CMD ["hello.js"]
