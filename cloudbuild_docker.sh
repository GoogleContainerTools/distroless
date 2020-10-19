#!/bin/sh

set -o errexit
set -o xtrace

docker tag bazel/base:static_root_amd64_debian9     gcr.io/$PROJECT_ID/static:${COMMIT_SHA}
docker tag bazel/base:static_root_amd64_debian9     gcr.io/$PROJECT_ID/static:latest-amd64
docker tag bazel/base:static_root_amd64_debian9     gcr.io/$PROJECT_ID/static-debian9:${COMMIT_SHA}
docker tag bazel/base:static_root_amd64_debian9     gcr.io/$PROJECT_ID/static-debian9:latest
docker tag bazel/base:static_root_amd64_debian10    gcr.io/$PROJECT_ID/static-debian10:${COMMIT_SHA}
docker tag bazel/base:static_root_amd64_debian10    gcr.io/$PROJECT_ID/static-debian10:latest
docker tag bazel/base:static_nonroot_amd64_debian9  gcr.io/$PROJECT_ID/static:nonroot-amd64
docker tag bazel/base:static_nonroot_amd64_debian9  gcr.io/$PROJECT_ID/static-debian9:nonroot
docker tag bazel/base:static_nonroot_amd64_debian10 gcr.io/$PROJECT_ID/static-debian10:nonroot

docker tag bazel/base:static_root_arm64_debian9     gcr.io/$PROJECT_ID/static:latest-arm64
docker tag bazel/base:static_nonroot_arm64_debian9  gcr.io/$PROJECT_ID/static:nonroot-arm64

docker tag bazel/base:base_root_amd64_debian9        gcr.io/$PROJECT_ID/base:${COMMIT_SHA}
docker tag bazel/base:base_root_amd64_debian9        gcr.io/$PROJECT_ID/base:latest-amd64
docker tag bazel/base:base_root_amd64_debian9        gcr.io/$PROJECT_ID/base-debian9:${COMMIT_SHA}
docker tag bazel/base:base_root_amd64_debian9        gcr.io/$PROJECT_ID/base-debian9:latest
docker tag bazel/base:base_root_amd64_debian10       gcr.io/$PROJECT_ID/base-debian10:${COMMIT_SHA}
docker tag bazel/base:base_root_amd64_debian10       gcr.io/$PROJECT_ID/base-debian10:latest
docker tag bazel/base:base_nonroot_amd64_debian9     gcr.io/$PROJECT_ID/base:nonroot-amd64
docker tag bazel/base:base_nonroot_amd64_debian9     gcr.io/$PROJECT_ID/base-debian9:nonroot
docker tag bazel/base:base_nonroot_amd64_debian10    gcr.io/$PROJECT_ID/base-debian10:nonroot
docker tag bazel/base:debug_root_amd64_debian9       gcr.io/$PROJECT_ID/base:debug-amd64
docker tag bazel/base:debug_root_amd64_debian9       gcr.io/$PROJECT_ID/base-debian9:debug
docker tag bazel/base:debug_root_amd64_debian10      gcr.io/$PROJECT_ID/base-debian10:debug
docker tag bazel/base:debug_nonroot_amd64_debian9    gcr.io/$PROJECT_ID/base:debug-nonroot-amd64
docker tag bazel/base:debug_nonroot_amd64_debian9    gcr.io/$PROJECT_ID/base-debian9:debug-nonroot
docker tag bazel/base:debug_nonroot_amd64_debian10   gcr.io/$PROJECT_ID/base-debian10:debug-nonroot

docker tag bazel/base:base_root_arm64_debian9        gcr.io/$PROJECT_ID/base:latest-arm64
docker tag bazel/base:base_nonroot_arm64_debian9     gcr.io/$PROJECT_ID/base:nonroot-arm64
docker tag bazel/base:debug_root_arm64_debian9       gcr.io/$PROJECT_ID/base:debug-arm64
docker tag bazel/base:debug_nonroot_arm64_debian9    gcr.io/$PROJECT_ID/base:debug-nonroot-arm64

docker tag bazel/cc:cc_root_amd64_debian9     gcr.io/$PROJECT_ID/cc:${COMMIT_SHA}
docker tag bazel/cc:cc_root_amd64_debian9     gcr.io/$PROJECT_ID/cc:latest-amd64
docker tag bazel/cc:cc_root_amd64_debian9     gcr.io/$PROJECT_ID/cc-debian9:${COMMIT_SHA}
docker tag bazel/cc:cc_root_amd64_debian9     gcr.io/$PROJECT_ID/cc-debian9:latest
docker tag bazel/cc:cc_root_amd64_debian10    gcr.io/$PROJECT_ID/cc-debian10:${COMMIT_SHA}
docker tag bazel/cc:cc_root_amd64_debian10    gcr.io/$PROJECT_ID/cc-debian10:latest
docker tag bazel/cc:debug_root_amd64_debian9  gcr.io/$PROJECT_ID/cc:debug-amd64
docker tag bazel/cc:debug_root_amd64_debian9  gcr.io/$PROJECT_ID/cc-debian9:debug
docker tag bazel/cc:debug_root_amd64_debian10 gcr.io/$PROJECT_ID/cc-debian10:debug

docker tag bazel/cc:cc_root_arm64_debian9     gcr.io/$PROJECT_ID/cc:latest-arm64
docker tag bazel/cc:debug_root_arm64_debian9  gcr.io/$PROJECT_ID/cc:debug-arm64

docker tag bazel/base:static_root_s390x_debian9      gcr.io/$PROJECT_ID/static:latest-s390x
docker tag bazel/base:static_nonroot_s390x_debian9   gcr.io/$PROJECT_ID/static:nonroot-s390x
docker tag bazel/base:base_root_s390x_debian9        gcr.io/$PROJECT_ID/base:latest-s390x
docker tag bazel/base:base_nonroot_s390x_debian9     gcr.io/$PROJECT_ID/base:nonroot-s390x
docker tag bazel/base:debug_root_s390x_debian9       gcr.io/$PROJECT_ID/base:debug-s390x
docker tag bazel/base:debug_nonroot_s390x_debian9    gcr.io/$PROJECT_ID/base:debug-nonroot-s390x

docker tag bazel/base:static_root_ppc64le_debian9      gcr.io/$PROJECT_ID/static:latest-ppc64le
docker tag bazel/base:static_nonroot_ppc64le_debian9   gcr.io/$PROJECT_ID/static:nonroot-ppc64le
docker tag bazel/base:base_root_ppc64le_debian9        gcr.io/$PROJECT_ID/base:latest-ppc64le
docker tag bazel/base:base_nonroot_ppc64le_debian9     gcr.io/$PROJECT_ID/base:nonroot-ppc64le
docker tag bazel/base:debug_root_ppc64le_debian9       gcr.io/$PROJECT_ID/base:debug-ppc64le
docker tag bazel/base:debug_nonroot_ppc64le_debian9    gcr.io/$PROJECT_ID/base:debug-nonroot-ppc64le

docker tag bazel/experimental/python3:python3_amd64_debian9          gcr.io/$PROJECT_ID/python3:latest-amd64
docker tag bazel/experimental/python3:python3_amd64_debian9          gcr.io/$PROJECT_ID/python3-debian9:latest
docker tag bazel/experimental/python3:python3_amd64_debian10         gcr.io/$PROJECT_ID/python3-debian10:latest
docker tag bazel/experimental/python3:python3_nonroot_amd64_debian9  gcr.io/$PROJECT_ID/python3:nonroot-amd64
docker tag bazel/experimental/python3:python3_nonroot_amd64_debian9  gcr.io/$PROJECT_ID/python3-debian9:nonroot
docker tag bazel/experimental/python3:python3_nonroot_amd64_debian10 gcr.io/$PROJECT_ID/python3-debian10:nonroot
docker tag bazel/experimental/python3:debug_amd64_debian9            gcr.io/$PROJECT_ID/python3:debug-amd64
docker tag bazel/experimental/python3:debug_amd64_debian9            gcr.io/$PROJECT_ID/python3-debian9:debug
docker tag bazel/experimental/python3:debug_amd64_debian10           gcr.io/$PROJECT_ID/python3-debian10:debug
docker tag bazel/experimental/python3:debug_nonroot_amd64_debian9    gcr.io/$PROJECT_ID/python3:debug-nonroot-amd64
docker tag bazel/experimental/python3:debug_nonroot_amd64_debian9    gcr.io/$PROJECT_ID/python3-debian9:debug-nonroot
docker tag bazel/experimental/python3:debug_nonroot_amd64_debian10   gcr.io/$PROJECT_ID/python3-debian10:debug-nonroot
docker tag bazel/experimental/python3:python3_arm64_debian9          gcr.io/$PROJECT_ID/python3:latest-arm64
docker tag bazel/experimental/python3:python3_nonroot_arm64_debian9  gcr.io/$PROJECT_ID/python3:nonroot-arm64
docker tag bazel/experimental/python3:debug_arm64_debian9            gcr.io/$PROJECT_ID/python3:debug-arm64
docker tag bazel/experimental/python3:debug_nonroot_arm64_debian9    gcr.io/$PROJECT_ID/python3:debug-nonroot-arm64


docker tag bazel/experimental/python2.7:python27_amd64_debian9  gcr.io/$PROJECT_ID/python2.7:latest-amd64
docker tag bazel/experimental/python2.7:python27_amd64_debian9  gcr.io/$PROJECT_ID/python2.7-debian9:latest
docker tag bazel/experimental/python2.7:python27_amd64_debian10 gcr.io/$PROJECT_ID/python2.7-debian10:latest
docker tag bazel/experimental/python2.7:debug_amd64_debian9     gcr.io/$PROJECT_ID/python2.7:debug-amd64
docker tag bazel/experimental/python2.7:debug_amd64_debian9     gcr.io/$PROJECT_ID/python2.7-debian9:debug
docker tag bazel/experimental/python2.7:debug_amd64_debian10    gcr.io/$PROJECT_ID/python2.7-debian10:debug
docker tag bazel/experimental/python2.7:python27_arm64_debian9  gcr.io/$PROJECT_ID/python2.7:latest-arm64
docker tag bazel/experimental/python2.7:debug_arm64_debian9     gcr.io/$PROJECT_ID/python2.7:debug-arm64

docker tag bazel/nodejs:nodejs14_amd64_debian9        gcr.io/$PROJECT_ID/nodejs:latest-amd64
docker tag bazel/nodejs:nodejs10_amd64_debian9        gcr.io/$PROJECT_ID/nodejs:10
docker tag bazel/nodejs:nodejs12_amd64_debian9        gcr.io/$PROJECT_ID/nodejs:12
docker tag bazel/nodejs:nodejs14_amd64_debian9        gcr.io/$PROJECT_ID/nodejs:14
docker tag bazel/nodejs:nodejs14_debug_amd64_debian9  gcr.io/$PROJECT_ID/nodejs:debug-amd64
docker tag bazel/nodejs:nodejs10_debug_amd64_debian9  gcr.io/$PROJECT_ID/nodejs:10-debug
docker tag bazel/nodejs:nodejs12_debug_amd64_debian9  gcr.io/$PROJECT_ID/nodejs:12-debug
docker tag bazel/nodejs:nodejs14_debug_amd64_debian9  gcr.io/$PROJECT_ID/nodejs:14-debug
docker tag bazel/nodejs:nodejs14_amd64_debian9        gcr.io/$PROJECT_ID/nodejs-debian9:latest
docker tag bazel/nodejs:nodejs10_amd64_debian9        gcr.io/$PROJECT_ID/nodejs-debian9:10
docker tag bazel/nodejs:nodejs12_amd64_debian9        gcr.io/$PROJECT_ID/nodejs-debian9:12
docker tag bazel/nodejs:nodejs14_amd64_debian9        gcr.io/$PROJECT_ID/nodejs-debian9:14
docker tag bazel/nodejs:nodejs14_debug_amd64_debian9  gcr.io/$PROJECT_ID/nodejs-debian9:debug
docker tag bazel/nodejs:nodejs10_debug_amd64_debian9  gcr.io/$PROJECT_ID/nodejs-debian9:10-debug
docker tag bazel/nodejs:nodejs12_debug_amd64_debian9  gcr.io/$PROJECT_ID/nodejs-debian9:12-debug
docker tag bazel/nodejs:nodejs14_debug_amd64_debian9  gcr.io/$PROJECT_ID/nodejs-debian9:14-debug
docker tag bazel/nodejs:nodejs14_amd64_debian10       gcr.io/$PROJECT_ID/nodejs-debian10:latest
docker tag bazel/nodejs:nodejs10_amd64_debian10       gcr.io/$PROJECT_ID/nodejs-debian10:10
docker tag bazel/nodejs:nodejs12_amd64_debian10       gcr.io/$PROJECT_ID/nodejs-debian10:12
docker tag bazel/nodejs:nodejs14_amd64_debian10       gcr.io/$PROJECT_ID/nodejs-debian10:14
docker tag bazel/nodejs:nodejs14_debug_amd64_debian10 gcr.io/$PROJECT_ID/nodejs-debian10:debug
docker tag bazel/nodejs:nodejs10_debug_amd64_debian10 gcr.io/$PROJECT_ID/nodejs-debian10:10-debug
docker tag bazel/nodejs:nodejs12_debug_amd64_debian10 gcr.io/$PROJECT_ID/nodejs-debian10:12-debug
docker tag bazel/nodejs:nodejs14_debug_amd64_debian10 gcr.io/$PROJECT_ID/nodejs-debian10:14-debug

docker tag bazel/nodejs:nodejs14_arm64_debian9        gcr.io/$PROJECT_ID/nodejs:latest-arm64
docker tag bazel/nodejs:nodejs14_debug_arm64_debian9  gcr.io/$PROJECT_ID/nodejs:debug-arm64

docker tag bazel/experimental/dotnet:dotnet_debian9                    gcr.io/$PROJECT_ID/dotnet:latest
docker tag bazel/experimental/dotnet:dotnet_debian9                    gcr.io/$PROJECT_ID/dotnet-debian9:latest
docker tag bazel/experimental/dotnet:dotnet_debian10                   gcr.io/$PROJECT_ID/dotnet-debian10:latest
docker tag bazel/experimental/dotnet:dotnet_debug_debian9              gcr.io/$PROJECT_ID/dotnet:debug
docker tag bazel/experimental/dotnet:dotnet_debug_debian9              gcr.io/$PROJECT_ID/dotnet-debian9:debug
docker tag bazel/experimental/dotnet:dotnet_debug_debian10             gcr.io/$PROJECT_ID/dotnet-debian10:debug

docker tag bazel/experimental/dotnet:dotnet_core_aspnet_debian9        gcr.io/$PROJECT_ID/dotnet/core/aspnet:latest
docker tag bazel/experimental/dotnet:dotnet_core_aspnet_debian9        gcr.io/$PROJECT_ID/dotnet/core/aspnet:3.1
docker tag bazel/experimental/dotnet:dotnet_core_aspnet_debug_debian9  gcr.io/$PROJECT_ID/dotnet/core/aspnet:debug
docker tag bazel/experimental/dotnet:dotnet_core_runtime_debian9       gcr.io/$PROJECT_ID/dotnet/core/runtime:latest
docker tag bazel/experimental/dotnet:dotnet_core_runtime_debian9       gcr.io/$PROJECT_ID/dotnet/core/runtime:3.1
docker tag bazel/experimental/dotnet:dotnet_core_runtime_debug_debian9 gcr.io/$PROJECT_ID/dotnet/core/runtime:debug
docker tag bazel/experimental/dotnet:dotnet_core_sdk_debian9           gcr.io/$PROJECT_ID/dotnet/core/sdk:latest
docker tag bazel/experimental/dotnet:dotnet_core_sdk_debian9           gcr.io/$PROJECT_ID/dotnet/core/sdk:3.1
docker tag bazel/experimental/dotnet:dotnet_core_sdk_debug_debian9     gcr.io/$PROJECT_ID/dotnet/core/sdk:debug

    docker tag bazel/java:java_base_root_debian9            gcr.io/$PROJECT_ID/java:base
    docker tag bazel/java:java_base_nonroot_debian9         gcr.io/$PROJECT_ID/java:base-nonroot
    docker tag bazel/java:java_base_root_debian9            gcr.io/$PROJECT_ID/java-debian9:base
    docker tag bazel/java:java_base_nonroot_debian9         gcr.io/$PROJECT_ID/java-debian9:base-nonroot
    docker tag bazel/java:java_base_debug_root_debian9      gcr.io/$PROJECT_ID/java:base-debug
    docker tag bazel/java:java_base_debug_nonroot_debian9   gcr.io/$PROJECT_ID/java:base-debug-nonroot
    docker tag bazel/java:java_base_debug_root_debian9      gcr.io/$PROJECT_ID/java-debian9:base-debug
    docker tag bazel/java:java_base_debug_nonroot_debian9   gcr.io/$PROJECT_ID/java-debian9:base-debug-nonroot
    docker tag bazel/java:java8_root_debian9                gcr.io/$PROJECT_ID/java:latest
    docker tag bazel/java:java8_nonroot_debian9             gcr.io/$PROJECT_ID/java:nonroot
    docker tag bazel/java:java8_root_debian9                gcr.io/$PROJECT_ID/java:8
    docker tag bazel/java:java8_nonroot_debian9             gcr.io/$PROJECT_ID/java:8-nonroot
    docker tag bazel/java:java8_root_debian9                gcr.io/$PROJECT_ID/java-debian9:latest
    docker tag bazel/java:java8_nonroot_debian9             gcr.io/$PROJECT_ID/java-debian9:nonroot
    docker tag bazel/java:java8_root_debian9                gcr.io/$PROJECT_ID/java-debian9:8
    docker tag bazel/java:java8_nonroot_debian9             gcr.io/$PROJECT_ID/java-debian9:8-nonroot
    docker tag bazel/java:java8_debug_root_debian9          gcr.io/$PROJECT_ID/java:debug
    docker tag bazel/java:java8_debug_nonroot_debian9       gcr.io/$PROJECT_ID/java:debug-nonroot
    docker tag bazel/java:java8_debug_root_debian9          gcr.io/$PROJECT_ID/java:8-debug
    docker tag bazel/java:java8_debug_nonroot_debian9       gcr.io/$PROJECT_ID/java:8-debug-nonroot
    docker tag bazel/java:java8_debug_root_debian9          gcr.io/$PROJECT_ID/java-debian9:debug
    docker tag bazel/java:java8_debug_nonroot_debian9       gcr.io/$PROJECT_ID/java-debian9:debug-nonroot
    docker tag bazel/java:java8_debug_root_debian9          gcr.io/$PROJECT_ID/java-debian9:8-debug
    docker tag bazel/java:java8_debug_nonroot_debian9       gcr.io/$PROJECT_ID/java-debian9:8-debug-nonroot
    docker tag bazel/java:java11_root_debian9               gcr.io/$PROJECT_ID/java:11
    docker tag bazel/java:java11_nonroot_debian9            gcr.io/$PROJECT_ID/java:11-nonroot
    docker tag bazel/java:java11_root_debian9               gcr.io/$PROJECT_ID/java-debian9:11
    docker tag bazel/java:java11_nonroot_debian9            gcr.io/$PROJECT_ID/java-debian9:11-nonroot
    docker tag bazel/java:java11_debug_root_debian9         gcr.io/$PROJECT_ID/java:11-debug
    docker tag bazel/java:java11_debug_nonroot_debian9      gcr.io/$PROJECT_ID/java:11-debug-nonroot
    docker tag bazel/java:java11_debug_root_debian9         gcr.io/$PROJECT_ID/java-debian9:11-debug
    docker tag bazel/java:java11_debug_nonroot_debian9      gcr.io/$PROJECT_ID/java-debian9:11-debug-nonroot

    docker tag bazel/java:java_base_root_debian10           gcr.io/$PROJECT_ID/java-debian10:base
    docker tag bazel/java:java_base_nonroot_debian10        gcr.io/$PROJECT_ID/java-debian10:base-nonroot
    docker tag bazel/java:java_base_debug_root_debian10     gcr.io/$PROJECT_ID/java-debian10:base-debug
    docker tag bazel/java:java_base_debug_nonroot_debian10  gcr.io/$PROJECT_ID/java-debian10:base-debug-nonroot
    docker tag bazel/java:java11_root_debian10              gcr.io/$PROJECT_ID/java-debian10:latest
    docker tag bazel/java:java11_nonroot_debian10           gcr.io/$PROJECT_ID/java-debian10:nonroot
    docker tag bazel/java:java11_root_debian10              gcr.io/$PROJECT_ID/java-debian10:11
    docker tag bazel/java:java11_nonroot_debian10           gcr.io/$PROJECT_ID/java-debian10:11-nonroot
    docker tag bazel/java:java11_debug_root_debian10        gcr.io/$PROJECT_ID/java-debian10:debug
    docker tag bazel/java:java11_debug_nonroot_debian10     gcr.io/$PROJECT_ID/java-debian10:debug-nonroot
    docker tag bazel/java:java11_debug_root_debian10        gcr.io/$PROJECT_ID/java-debian10:11-debug
    docker tag bazel/java:java11_debug_nonroot_debian10     gcr.io/$PROJECT_ID/java-debian10:11-debug-nonroot

    docker tag bazel/java/jetty:jetty_java8_debian9         gcr.io/$PROJECT_ID/java/jetty:latest
    docker tag bazel/java/jetty:jetty_java8_debian9         gcr.io/$PROJECT_ID/java/jetty:java8
    docker tag bazel/java/jetty:jetty_java8_debian9         gcr.io/$PROJECT_ID/java-debian9/jetty:latest
    docker tag bazel/java/jetty:jetty_java8_debian9         gcr.io/$PROJECT_ID/java-debian9/jetty:java8
    docker tag bazel/java/jetty:jetty_java8_debug_debian9   gcr.io/$PROJECT_ID/java/jetty:debug
    docker tag bazel/java/jetty:jetty_java8_debug_debian9   gcr.io/$PROJECT_ID/java/jetty:java8-debug
    docker tag bazel/java/jetty:jetty_java8_debug_debian9   gcr.io/$PROJECT_ID/java-debian9/jetty:debug
    docker tag bazel/java/jetty:jetty_java8_debug_debian9   gcr.io/$PROJECT_ID/java-debian9/jetty:java8-debug
    docker tag bazel/java/jetty:jetty_java11_debian9        gcr.io/$PROJECT_ID/java/jetty:java11
    docker tag bazel/java/jetty:jetty_java11_debian9        gcr.io/$PROJECT_ID/java-debian9/jetty:java11
    docker tag bazel/java/jetty:jetty_java11_debug_debian9  gcr.io/$PROJECT_ID/java/jetty:java11-debug
    docker tag bazel/java/jetty:jetty_java11_debug_debian9  gcr.io/$PROJECT_ID/java-debian9/jetty:java11-debug
    docker tag bazel/java/jetty:jetty_java11_debian10       gcr.io/$PROJECT_ID/java-debian10/jetty:latest
    docker tag bazel/java/jetty:jetty_java11_debian10       gcr.io/$PROJECT_ID/java-debian10/jetty:java11
    docker tag bazel/java/jetty:jetty_java11_debug_debian10 gcr.io/$PROJECT_ID/java-debian10/jetty:debug
    docker tag bazel/java/jetty:jetty_java11_debug_debian10 gcr.io/$PROJECT_ID/java-debian10/jetty:java11-debug

# First publish the individual container images, we do this manually because we
# want to publish manifest lists next, which GCB does not support.
docker push gcr.io/$PROJECT_ID/static:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/static:latest-amd64
docker push gcr.io/$PROJECT_ID/static:nonroot-amd64
docker push gcr.io/$PROJECT_ID/static:latest-arm64
docker push gcr.io/$PROJECT_ID/static:nonroot-arm64
docker push gcr.io/$PROJECT_ID/static:latest-s390x
docker push gcr.io/$PROJECT_ID/static:nonroot-s390x
docker push gcr.io/$PROJECT_ID/static:latest-ppc64le
docker push gcr.io/$PROJECT_ID/static:nonroot-ppc64le
docker push gcr.io/$PROJECT_ID/static-debian9:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/static-debian9:latest
docker push gcr.io/$PROJECT_ID/static-debian9:nonroot
docker push gcr.io/$PROJECT_ID/static-debian10:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/static-debian10:latest
docker push gcr.io/$PROJECT_ID/static-debian10:nonroot
docker push gcr.io/$PROJECT_ID/base:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/base:latest-amd64
docker push gcr.io/$PROJECT_ID/base:nonroot-amd64
docker push gcr.io/$PROJECT_ID/base:debug-amd64
docker push gcr.io/$PROJECT_ID/base:debug-nonroot-amd64
docker push gcr.io/$PROJECT_ID/base:latest-arm64
docker push gcr.io/$PROJECT_ID/base:nonroot-arm64
docker push gcr.io/$PROJECT_ID/base:debug-arm64
docker push gcr.io/$PROJECT_ID/base:debug-nonroot-arm64
docker push gcr.io/$PROJECT_ID/base:latest-s390x
docker push gcr.io/$PROJECT_ID/base:nonroot-s390x
docker push gcr.io/$PROJECT_ID/base:debug-s390x
docker push gcr.io/$PROJECT_ID/base:debug-nonroot-s390x
docker push gcr.io/$PROJECT_ID/base:latest-ppc64le
docker push gcr.io/$PROJECT_ID/base:nonroot-ppc64le
docker push gcr.io/$PROJECT_ID/base:debug-ppc64le
docker push gcr.io/$PROJECT_ID/base:debug-nonroot-ppc64le
docker push gcr.io/$PROJECT_ID/base-debian9:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/base-debian9:latest
docker push gcr.io/$PROJECT_ID/base-debian9:nonroot
docker push gcr.io/$PROJECT_ID/base-debian9:debug
docker push gcr.io/$PROJECT_ID/base-debian9:debug-nonroot
docker push gcr.io/$PROJECT_ID/base-debian10:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/base-debian10:latest
docker push gcr.io/$PROJECT_ID/base-debian10:nonroot
docker push gcr.io/$PROJECT_ID/base-debian10:debug
docker push gcr.io/$PROJECT_ID/base-debian10:debug-nonroot
docker push gcr.io/$PROJECT_ID/cc:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/cc:latest-amd64
docker push gcr.io/$PROJECT_ID/cc:debug-amd64
docker push gcr.io/$PROJECT_ID/cc:latest-arm64
docker push gcr.io/$PROJECT_ID/cc:debug-arm64
docker push gcr.io/$PROJECT_ID/cc-debian9:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/cc-debian9:latest
docker push gcr.io/$PROJECT_ID/cc-debian9:debug
docker push gcr.io/$PROJECT_ID/cc-debian10:${COMMIT_SHA}
docker push gcr.io/$PROJECT_ID/cc-debian10:latest
docker push gcr.io/$PROJECT_ID/cc-debian10:debug
docker push gcr.io/$PROJECT_ID/python3:latest-amd64
docker push gcr.io/$PROJECT_ID/python3:nonroot-amd64
docker push gcr.io/$PROJECT_ID/python3:debug-amd64
docker push gcr.io/$PROJECT_ID/python3:debug-nonroot-amd64
docker push gcr.io/$PROJECT_ID/python3:latest-arm64
docker push gcr.io/$PROJECT_ID/python3:nonroot-arm64
docker push gcr.io/$PROJECT_ID/python3:debug-arm64
docker push gcr.io/$PROJECT_ID/python3:debug-nonroot-arm64
docker push gcr.io/$PROJECT_ID/python3-debian9:latest
docker push gcr.io/$PROJECT_ID/python3-debian9:nonroot
docker push gcr.io/$PROJECT_ID/python3-debian9:debug
docker push gcr.io/$PROJECT_ID/python3-debian9:debug-nonroot
docker push gcr.io/$PROJECT_ID/python3-debian10:latest
docker push gcr.io/$PROJECT_ID/python3-debian10:nonroot
docker push gcr.io/$PROJECT_ID/python3-debian10:debug
docker push gcr.io/$PROJECT_ID/python3-debian10:debug-nonroot
docker push gcr.io/$PROJECT_ID/python2.7:latest-amd64
docker push gcr.io/$PROJECT_ID/python2.7:debug-amd64
docker push gcr.io/$PROJECT_ID/python2.7:latest-arm64
docker push gcr.io/$PROJECT_ID/python2.7:debug-arm64
docker push gcr.io/$PROJECT_ID/python2.7-debian9:latest
docker push gcr.io/$PROJECT_ID/python2.7-debian9:debug
docker push gcr.io/$PROJECT_ID/python2.7-debian10:latest
docker push gcr.io/$PROJECT_ID/python2.7-debian10:debug
docker push gcr.io/$PROJECT_ID/nodejs:latest-amd64
docker push gcr.io/$PROJECT_ID/nodejs:latest-arm64
docker push gcr.io/$PROJECT_ID/nodejs:10
docker push gcr.io/$PROJECT_ID/nodejs:12
docker push gcr.io/$PROJECT_ID/nodejs:14
docker push gcr.io/$PROJECT_ID/nodejs:debug-amd64
docker push gcr.io/$PROJECT_ID/nodejs:debug-arm64
docker push gcr.io/$PROJECT_ID/nodejs:10-debug
docker push gcr.io/$PROJECT_ID/nodejs:12-debug
docker push gcr.io/$PROJECT_ID/nodejs:14-debug
docker push gcr.io/$PROJECT_ID/nodejs-debian9:latest
docker push gcr.io/$PROJECT_ID/nodejs-debian9:10
docker push gcr.io/$PROJECT_ID/nodejs-debian9:12
docker push gcr.io/$PROJECT_ID/nodejs-debian9:14
docker push gcr.io/$PROJECT_ID/nodejs-debian9:debug
docker push gcr.io/$PROJECT_ID/nodejs-debian9:10-debug
docker push gcr.io/$PROJECT_ID/nodejs-debian9:12-debug
docker push gcr.io/$PROJECT_ID/nodejs-debian9:14-debug
docker push gcr.io/$PROJECT_ID/nodejs-debian10:latest
docker push gcr.io/$PROJECT_ID/nodejs-debian10:10
docker push gcr.io/$PROJECT_ID/nodejs-debian10:12
docker push gcr.io/$PROJECT_ID/nodejs-debian10:14
docker push gcr.io/$PROJECT_ID/nodejs-debian10:debug
docker push gcr.io/$PROJECT_ID/nodejs-debian10:10-debug
docker push gcr.io/$PROJECT_ID/nodejs-debian10:12-debug
docker push gcr.io/$PROJECT_ID/nodejs-debian10:14-debug
docker push gcr.io/$PROJECT_ID/dotnet:latest
docker push gcr.io/$PROJECT_ID/dotnet:debug
docker push gcr.io/$PROJECT_ID/dotnet-debian9:latest
docker push gcr.io/$PROJECT_ID/dotnet-debian9:debug
docker push gcr.io/$PROJECT_ID/dotnet-debian10:latest
docker push gcr.io/$PROJECT_ID/dotnet-debian10:debug
docker push gcr.io/$PROJECT_ID/dotnet/core/aspnet:latest
docker push gcr.io/$PROJECT_ID/dotnet/core/aspnet:3.1
docker push gcr.io/$PROJECT_ID/dotnet/core/aspnet:debug
docker push gcr.io/$PROJECT_ID/dotnet/core/runtime:latest
docker push gcr.io/$PROJECT_ID/dotnet/core/runtime:3.1
docker push gcr.io/$PROJECT_ID/dotnet/core/runtime:debug
docker push gcr.io/$PROJECT_ID/dotnet/core/sdk:latest
docker push gcr.io/$PROJECT_ID/dotnet/core/sdk:3.1
docker push gcr.io/$PROJECT_ID/dotnet/core/sdk:debug

docker push gcr.io/$PROJECT_ID/java:latest
docker push gcr.io/$PROJECT_ID/java:nonroot
docker push gcr.io/$PROJECT_ID/java:8
docker push gcr.io/$PROJECT_ID/java:8-nonroot
docker push gcr.io/$PROJECT_ID/java:debug
docker push gcr.io/$PROJECT_ID/java:debug-nonroot
docker push gcr.io/$PROJECT_ID/java:8-debug
docker push gcr.io/$PROJECT_ID/java:8-debug-nonroot
docker push gcr.io/$PROJECT_ID/java:11
docker push gcr.io/$PROJECT_ID/java:11-nonroot
docker push gcr.io/$PROJECT_ID/java:11-debug
docker push gcr.io/$PROJECT_ID/java:11-debug-nonroot
docker push gcr.io/$PROJECT_ID/java:base
docker push gcr.io/$PROJECT_ID/java:base-nonroot
docker push gcr.io/$PROJECT_ID/java:base-debug
docker push gcr.io/$PROJECT_ID/java:base-debug-nonroot
docker push gcr.io/$PROJECT_ID/java-debian9:base
docker push gcr.io/$PROJECT_ID/java-debian9:base-nonroot
docker push gcr.io/$PROJECT_ID/java-debian9:base-debug
docker push gcr.io/$PROJECT_ID/java-debian9:base-debug-nonroot
docker push gcr.io/$PROJECT_ID/java-debian9:latest
docker push gcr.io/$PROJECT_ID/java-debian9:nonroot
docker push gcr.io/$PROJECT_ID/java-debian9:8
docker push gcr.io/$PROJECT_ID/java-debian9:8-nonroot
docker push gcr.io/$PROJECT_ID/java-debian9:debug
docker push gcr.io/$PROJECT_ID/java-debian9:debug-nonroot
docker push gcr.io/$PROJECT_ID/java-debian9:8-debug
docker push gcr.io/$PROJECT_ID/java-debian9:8-debug-nonroot
docker push gcr.io/$PROJECT_ID/java-debian9:11
docker push gcr.io/$PROJECT_ID/java-debian9:11-nonroot
docker push gcr.io/$PROJECT_ID/java-debian9:11-debug
docker push gcr.io/$PROJECT_ID/java-debian9:11-debug-nonroot
docker push gcr.io/$PROJECT_ID/java-debian10:base
docker push gcr.io/$PROJECT_ID/java-debian10:base-nonroot
docker push gcr.io/$PROJECT_ID/java-debian10:base-debug
docker push gcr.io/$PROJECT_ID/java-debian10:base-debug-nonroot
docker push gcr.io/$PROJECT_ID/java-debian10:latest
docker push gcr.io/$PROJECT_ID/java-debian10:nonroot
docker push gcr.io/$PROJECT_ID/java-debian10:11
docker push gcr.io/$PROJECT_ID/java-debian10:11-nonroot
docker push gcr.io/$PROJECT_ID/java-debian10:debug
docker push gcr.io/$PROJECT_ID/java-debian10:debug-nonroot
docker push gcr.io/$PROJECT_ID/java-debian10:11-debug
docker push gcr.io/$PROJECT_ID/java-debian10:11-debug-nonroot
docker push gcr.io/$PROJECT_ID/java/jetty:latest
docker push gcr.io/$PROJECT_ID/java/jetty:java8
docker push gcr.io/$PROJECT_ID/java/jetty:debug
docker push gcr.io/$PROJECT_ID/java/jetty:java8-debug
docker push gcr.io/$PROJECT_ID/java/jetty:java11
docker push gcr.io/$PROJECT_ID/java/jetty:java11-debug
docker push gcr.io/$PROJECT_ID/java-debian9/jetty:latest
docker push gcr.io/$PROJECT_ID/java-debian9/jetty:java8
docker push gcr.io/$PROJECT_ID/java-debian9/jetty:debug
docker push gcr.io/$PROJECT_ID/java-debian9/jetty:java8-debug
docker push gcr.io/$PROJECT_ID/java-debian9/jetty:java11
docker push gcr.io/$PROJECT_ID/java-debian9/jetty:java11-debug
docker push gcr.io/$PROJECT_ID/java-debian10/jetty:latest
docker push gcr.io/$PROJECT_ID/java-debian10/jetty:java11
docker push gcr.io/$PROJECT_ID/java-debian10/jetty:debug
docker push gcr.io/$PROJECT_ID/java-debian10/jetty:java11-debug

# Publish manifest lists second, after all of the binary material
# has been uploaded, so that it is fast.  We want fast because enabling
# the experimental features in docker changes ~/.docker/config.json, which
# GCB periodically tramples.
#
# Enable support for 'docker manifest create'
# https://docs.docker.com/engine/reference/commandline/manifest_create/
sed -i 's/^{/{"experimental": "enabled",/g' ~/.docker/config.json

docker manifest create gcr.io/$PROJECT_ID/static:nonroot \
   gcr.io/$PROJECT_ID/static:nonroot-amd64 \
   gcr.io/$PROJECT_ID/static:nonroot-arm64 \
   gcr.io/$PROJECT_ID/static:nonroot-s390x \
   gcr.io/$PROJECT_ID/static:nonroot-ppc64le
docker manifest push gcr.io/$PROJECT_ID/static:nonroot

docker manifest create gcr.io/$PROJECT_ID/static:latest \
   gcr.io/$PROJECT_ID/static:latest-amd64 \
   gcr.io/$PROJECT_ID/static:latest-arm64 \
   gcr.io/$PROJECT_ID/static:latest-s390x \
   gcr.io/$PROJECT_ID/static:latest-ppc64le
docker manifest push gcr.io/$PROJECT_ID/static:latest

docker manifest create gcr.io/$PROJECT_ID/base:nonroot \
   gcr.io/$PROJECT_ID/base:nonroot-amd64 \
   gcr.io/$PROJECT_ID/base:nonroot-arm64 \
   gcr.io/$PROJECT_ID/base:nonroot-s390x \
   gcr.io/$PROJECT_ID/base:nonroot-ppc64le
docker manifest push gcr.io/$PROJECT_ID/base:nonroot

docker manifest create gcr.io/$PROJECT_ID/base:latest \
   gcr.io/$PROJECT_ID/base:latest-amd64 \
   gcr.io/$PROJECT_ID/base:latest-arm64 \
   gcr.io/$PROJECT_ID/base:latest-s390x \
   gcr.io/$PROJECT_ID/base:latest-ppc64le
docker manifest push gcr.io/$PROJECT_ID/base:latest

docker manifest create gcr.io/$PROJECT_ID/base:debug-nonroot \
   gcr.io/$PROJECT_ID/base:debug-nonroot-amd64 \
   gcr.io/$PROJECT_ID/base:debug-nonroot-arm64 \
   gcr.io/$PROJECT_ID/base:debug-nonroot-s390x \
   gcr.io/$PROJECT_ID/base:debug-nonroot-ppc64le
docker manifest push gcr.io/$PROJECT_ID/base:debug-nonroot

docker manifest create gcr.io/$PROJECT_ID/base:debug \
   gcr.io/$PROJECT_ID/base:debug-amd64 \
   gcr.io/$PROJECT_ID/base:debug-arm64 \
   gcr.io/$PROJECT_ID/base:debug-s390x \
   gcr.io/$PROJECT_ID/base:debug-ppc64le
docker manifest push gcr.io/$PROJECT_ID/base:debug

docker manifest create gcr.io/$PROJECT_ID/cc:latest \
   gcr.io/$PROJECT_ID/cc:latest-amd64 \
   gcr.io/$PROJECT_ID/cc:latest-arm64
docker manifest push gcr.io/$PROJECT_ID/cc:latest

docker manifest create gcr.io/$PROJECT_ID/cc:debug \
   gcr.io/$PROJECT_ID/cc:debug-amd64 \
   gcr.io/$PROJECT_ID/cc:debug-arm64
docker manifest push gcr.io/$PROJECT_ID/cc:debug


docker manifest create gcr.io/$PROJECT_ID/python3:nonroot \
   gcr.io/$PROJECT_ID/python3:nonroot-amd64 \
   gcr.io/$PROJECT_ID/python3:nonroot-arm64
docker manifest push gcr.io/$PROJECT_ID/python3:nonroot

docker manifest create gcr.io/$PROJECT_ID/python3:latest \
   gcr.io/$PROJECT_ID/python3:latest-amd64 \
   gcr.io/$PROJECT_ID/python3:latest-arm64
docker manifest push gcr.io/$PROJECT_ID/python3:latest

docker manifest create gcr.io/$PROJECT_ID/python3:debug-nonroot \
   gcr.io/$PROJECT_ID/python3:debug-nonroot-amd64 \
   gcr.io/$PROJECT_ID/python3:debug-nonroot-arm64
docker manifest push gcr.io/$PROJECT_ID/python3:debug-nonroot

docker manifest create gcr.io/$PROJECT_ID/python3:debug \
   gcr.io/$PROJECT_ID/python3:debug-amd64 \
   gcr.io/$PROJECT_ID/python3:debug-arm64
docker manifest push gcr.io/$PROJECT_ID/python3:debug

docker manifest create gcr.io/$PROJECT_ID/python2.7:latest \
   gcr.io/$PROJECT_ID/python2.7:latest-amd64 \
   gcr.io/$PROJECT_ID/python2.7:latest-arm64
docker manifest push gcr.io/$PROJECT_ID/python2.7:latest

docker manifest create gcr.io/$PROJECT_ID/python2.7:debug \
   gcr.io/$PROJECT_ID/python2.7:debug-amd64 \
   gcr.io/$PROJECT_ID/python2.7:debug-arm64
docker manifest push gcr.io/$PROJECT_ID/python2.7:debug

docker manifest create gcr.io/$PROJECT_ID/nodejs:latest \
   gcr.io/$PROJECT_ID/nodejs:latest-amd64 \
   gcr.io/$PROJECT_ID/nodejs:latest-arm64
docker manifest push gcr.io/$PROJECT_ID/nodejs:latest

docker manifest create gcr.io/$PROJECT_ID/nodejs:debug \
   gcr.io/$PROJECT_ID/nodejs:debug-amd64 \
   gcr.io/$PROJECT_ID/nodejs:debug-arm64
docker manifest push gcr.io/$PROJECT_ID/nodejs:debug
