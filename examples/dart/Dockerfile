FROM dart:stable AS build-env
WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart build cli --target bin/hello.dart -o output

FROM gcr.io/distroless/base-debian13
COPY --from=build-env /app/output/bundle/ /app/
CMD ["/app/bin/hello"]
