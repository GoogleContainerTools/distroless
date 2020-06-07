FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build

WORKDIR /app
COPY . .
RUN dotnet restore \
    --runtime linux-x64 \
    && dotnet publish \
    --configuration Release \
    --output /app/out \
    --runtime linux-x64


FROM gcr.io/distroless/dotnet/core:3.1 as runtime

WORKDIR /app
COPY --from=build /app/out .
CMD ["/app/Hello"]
