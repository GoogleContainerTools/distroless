load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
# load("//base:base.bzl", "glob")

# https://github.com/dotnet/core/blob/main/release-notes/releases-index.json
# https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/6.0/releases.json
# bazel build //experimental/dotnet:all
# targets=$(bazel query "//experimental/dotnet/...")
# echo $targets | while read target ; do bazel run $target ; done

def repositories():
#    native.genrule(
#       name = "dotnet_6_0_testapp-publish",
#       cmd = "pwd && ls -lah && "+
#             "dotnet publish --framework net6.0 -c Release -o $(@D) ./experimental/dotnet/testdata/TestApp",
#       srcs = ["experimental/dotnet/testdata/TestApp/Program.cs", "experimental/dotnet/testdata/TestApp/TestApp.csproj"],
#       outs = [
#         "TestApp.deps.json",
#         "TestApp.dll",
#         "TestApp.pdb",
#         "TestApp.runtimeconfig.json"
#       ],
#   )

    http_archive(
        name = "dotnet_6-0_sdk_amd64",
        build_file = "//experimental/dotnet:BUILD.dotnet",
        sha256 = "1d4c8c90a5c32de9fc4e9872c79a97271abdff3a60fb55e36690e558d5697005",
        type = "tar.gz",
        urls = ["https://download.visualstudio.microsoft.com/download/pr/dc930bff-ef3d-4f6f-8799-6eb60390f5b4/1efee2a8ea0180c94aff8f15eb3af981/dotnet-sdk-6.0.300-linux-x64.tar.gz"],
    )

    http_archive(
        name = "dotnet_6-0_sdk_arm64",
        build_file = "//experimental/dotnet:BUILD.dotnet",
        sha256 = "20fa1686e9a046b364cf0478bdb560fb39be3a9a2608103b93b7e8c162018359",
        type = "tar.gz",
        urls = ["https://download.visualstudio.microsoft.com/download/pr/7c62b503-4ede-4ff2-bc38-50f250a86d89/3b5e9db04cbe0169e852cb050a0dffce/dotnet-sdk-6.0.300-linux-arm64.tar.gz"],
    )

    http_archive(
        name = "dotnet_6-0_runtime_amd64",
        build_file = "//experimental/dotnet:BUILD.dotnet",
        sha256 = "688694c604bbd810d28446752131e20468390a071aa2a5157a4e2d87a43dfa3c",
        type = "tar.gz",
        urls = ["https://download.visualstudio.microsoft.com/download/pr/56d9250f-97df-4786-b33e-a8e34b349e86/dcf054ca00899a70a80aa1a7d3072b52/dotnet-runtime-6.0.5-linux-x64.tar.gz"],
    )

    http_archive(
        name = "dotnet_6-0_runtime_arm64",
        build_file = "//experimental/dotnet:BUILD.dotnet",
        sha256 = "48aef75040b082f7c7d4222c5726f9dbf4da0d1dd8511a236fa112d2e8eac77c",
        type = "tar.gz",
        urls = ["https://download.visualstudio.microsoft.com/download/pr/36a5510d-e454-4f46-aeaa-ed2c9521e12e/1d60cf7759fd938f2e6c9730d0792b9d/dotnet-runtime-6.0.5-linux-arm.tar.gz"],
    )

    http_archive(
        name = "dotnet_6-0_aspnetcore_amd64",
        build_file = "//experimental/dotnet:BUILD.dotnet",
        sha256 = "95a3cc7c4e7de792e39e40ffda72127ba49a49604b61fee18d50f970c9c1e903",
        type = "tar.gz",
        urls = ["https://download.visualstudio.microsoft.com/download/pr/a0e9ceb8-04eb-4510-876c-795a6a123dda/6141e57558eddc2d4629c7c14c2c6fa1/aspnetcore-runtime-6.0.5-linux-x64.tar.gz"],
    )

    http_archive(
        name = "dotnet_6-0_aspnetcore_arm64",
        build_file = "//experimental/dotnet:BUILD.dotnet",
        sha256 = "70dc0a73b71761a2f717bf8917f7ea4a1be4c41d2cffbe29df68f38d26e8061e",
        type = "tar.gz",
        urls = ["https://download.visualstudio.microsoft.com/download/pr/8ba7087e-4513-41e5-8359-a4bcd2a3661f/e6828f0d8cf1ecc63074c9ff57685e27/aspnetcore-runtime-6.0.5-linux-arm64.tar.gz"],
    )
