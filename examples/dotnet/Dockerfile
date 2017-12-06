FROM microsoft/dotnet:2.0.0-sdk AS build-env
ADD . /app
WORKDIR /app
RUN dotnet restore -r linux-x64
RUN dotnet publish  -c Release -r linux-x64

FROM gcr.io/distroless/dotnet
WORKDIR /app
COPY --from=build-env /app /app/
#CMD ["dotnet", "bin/Release/netcoreapp2.0/linux-x64/publish/hello.dll"]
CMD ["bin/Release/netcoreapp2.0/linux-x64/publish/hello"]
