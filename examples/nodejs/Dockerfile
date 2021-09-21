FROM node:16 AS build-env
COPY . /app
WORKDIR /app

RUN npm ci --only=production

FROM gcr.io/distroless/nodejs:16
COPY --from=build-env /app /app
WORKDIR /app
CMD ["hello.js"]
