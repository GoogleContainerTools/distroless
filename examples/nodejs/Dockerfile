FROM node:22 AS build-env
COPY . /app
WORKDIR /app

RUN npm ci --omit=dev

FROM gcr.io/distroless/nodejs22-debian13
COPY --from=build-env /app /app
WORKDIR /app
CMD ["hello.js"]
