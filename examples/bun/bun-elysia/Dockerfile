FROM oven/bun:1 AS build-env
COPY . /app
WORKDIR /app

RUN bun install

FROM gcr.io/distroless/bun-debian12
COPY --from=build-env /app /app
WORKDIR /app
CMD ["src/index.ts"]
