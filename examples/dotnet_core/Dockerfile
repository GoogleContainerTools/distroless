FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build
LABEL maintainer=""

WORKDIR /app
COPY . .
RUN dotnet restore \
    --runtime linux-x64 \
    && dotnet publish \
    --configuration Release \
    --output /app/out \
    --runtime linux-x64


# FROM gcr.io/distroless/dotnet_core_runtime:dotnet_core_runtime_debian10 as runtime
# FROM gcr.io/distroless/dotnet/core:3.1 as runtime # Aim for this container image tag.

# Use below local images for local development.
FROM bazel/experimental/dotnet_core_runtime:dotnet_core_runtime_debian10 as runtime
# FROM bazel/experimental/dotnet_core_runtime:debug_debian10 as runtime
LABEL maintainer=""

WORKDIR /app
COPY --from=build /app/out .
CMD ["/app/Hello"]
