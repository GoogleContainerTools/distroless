#!/bin/sh

set -o errexit
set -o xtrace

bazel build --host_force_python=PY2 //package_manager:dpkg_parser.par

bazel run --host_force_python=PY2 //base:static_root_amd64_debian9
bazel run --host_force_python=PY2 //base:static_root_amd64_debian10
bazel run --host_force_python=PY2 //base:static_nonroot_amd64_debian9
bazel run --host_force_python=PY2 //base:static_nonroot_amd64_debian10
bazel run --host_force_python=PY2 //base:static_root_arm64_debian9
bazel run --host_force_python=PY2 //base:static_root_arm64_debian10
bazel run --host_force_python=PY2 //base:static_nonroot_arm64_debian9
bazel run --host_force_python=PY2 //base:static_nonroot_arm64_debian10
bazel run --host_force_python=PY2 //base:static_root_ppc64le_debian9
bazel run --host_force_python=PY2 //base:static_root_ppc64le_debian10
bazel run --host_force_python=PY2 //base:static_nonroot_ppc64le_debian9
bazel run --host_force_python=PY2 //base:static_nonroot_ppc64le_debian10
bazel run --host_force_python=PY2 //base:static_root_s390x_debian9
bazel run --host_force_python=PY2 //base:static_root_s390x_debian10
bazel run --host_force_python=PY2 //base:static_nonroot_s390x_debian9
bazel run --host_force_python=PY2 //base:static_nonroot_s390x_debian10

bazel run --host_force_python=PY2 //base:base_root_amd64_debian9
bazel run --host_force_python=PY2 //base:base_root_amd64_debian10
bazel run --host_force_python=PY2 //base:base_nonroot_amd64_debian9
bazel run --host_force_python=PY2 //base:base_nonroot_amd64_debian10
bazel run --host_force_python=PY2 //base:debug_root_amd64_debian9
bazel run --host_force_python=PY2 //base:debug_root_amd64_debian10
bazel run --host_force_python=PY2 //base:debug_nonroot_amd64_debian9
bazel run --host_force_python=PY2 //base:debug_nonroot_amd64_debian10
bazel run --host_force_python=PY2 //base:base_root_arm64_debian9
bazel run --host_force_python=PY2 //base:base_root_arm64_debian10
bazel run --host_force_python=PY2 //base:base_nonroot_arm64_debian9
bazel run --host_force_python=PY2 //base:base_nonroot_arm64_debian10
bazel run --host_force_python=PY2 //base:debug_root_arm64_debian9
bazel run --host_force_python=PY2 //base:debug_root_arm64_debian10
bazel run --host_force_python=PY2 //base:debug_nonroot_arm64_debian9
bazel run --host_force_python=PY2 //base:debug_nonroot_arm64_debian10
bazel run --host_force_python=PY2 //base:base_root_s390x_debian9
bazel run --host_force_python=PY2 //base:base_root_s390x_debian10
bazel run --host_force_python=PY2 //base:base_nonroot_s390x_debian9
bazel run --host_force_python=PY2 //base:base_nonroot_s390x_debian10
bazel run --host_force_python=PY2 //base:debug_root_s390x_debian9
bazel run --host_force_python=PY2 //base:debug_root_s390x_debian10
bazel run --host_force_python=PY2 //base:debug_nonroot_s390x_debian9
bazel run --host_force_python=PY2 //base:debug_nonroot_s390x_debian10
bazel run --host_force_python=PY2 //base:base_root_ppc64le_debian9
bazel run --host_force_python=PY2 //base:base_root_ppc64le_debian10
bazel run --host_force_python=PY2 //base:base_nonroot_ppc64le_debian9
bazel run --host_force_python=PY2 //base:base_nonroot_ppc64le_debian10
bazel run --host_force_python=PY2 //base:debug_root_ppc64le_debian9
bazel run --host_force_python=PY2 //base:debug_root_ppc64le_debian10
bazel run --host_force_python=PY2 //base:debug_nonroot_ppc64le_debian9
bazel run --host_force_python=PY2 //base:debug_nonroot_ppc64le_debian10

bazel run --host_force_python=PY2 //cc:cc_root_amd64_debian9
bazel run --host_force_python=PY2 //cc:cc_root_amd64_debian10
bazel run --host_force_python=PY2 //cc:cc_nonroot_amd64_debian9
bazel run --host_force_python=PY2 //cc:cc_nonroot_amd64_debian10
bazel run --host_force_python=PY2 //cc:debug_root_amd64_debian9
bazel run --host_force_python=PY2 //cc:debug_root_amd64_debian10
bazel run --host_force_python=PY2 //cc:debug_nonroot_amd64_debian9
bazel run --host_force_python=PY2 //cc:debug_nonroot_amd64_debian10
bazel run --host_force_python=PY2 //cc:cc_root_arm64_debian9
bazel run --host_force_python=PY2 //cc:cc_root_arm64_debian10
bazel run --host_force_python=PY2 //cc:cc_nonroot_arm64_debian9
bazel run --host_force_python=PY2 //cc:cc_nonroot_arm64_debian10
bazel run --host_force_python=PY2 //cc:debug_root_arm64_debian9
bazel run --host_force_python=PY2 //cc:debug_root_arm64_debian10
bazel run --host_force_python=PY2 //cc:debug_nonroot_arm64_debian9
bazel run --host_force_python=PY2 //cc:debug_nonroot_arm64_debian10

bazel run --host_force_python=PY2 //experimental/python3:python3_amd64_debian9
bazel run --host_force_python=PY2 //experimental/python3:python3_amd64_debian10
bazel run --host_force_python=PY2 //experimental/python3:python3_nonroot_amd64_debian9
bazel run --host_force_python=PY2 //experimental/python3:python3_nonroot_amd64_debian10
bazel run --host_force_python=PY2 //experimental/python3:debug_amd64_debian9
bazel run --host_force_python=PY2 //experimental/python3:debug_amd64_debian10
bazel run --host_force_python=PY2 //experimental/python3:debug_nonroot_amd64_debian9
bazel run --host_force_python=PY2 //experimental/python3:debug_nonroot_amd64_debian10
bazel run --host_force_python=PY2 //experimental/python3:python3_arm64_debian9
bazel run --host_force_python=PY2 //experimental/python3:python3_arm64_debian10
bazel run --host_force_python=PY2 //experimental/python3:python3_nonroot_arm64_debian9
bazel run --host_force_python=PY2 //experimental/python3:python3_nonroot_arm64_debian10
bazel run --host_force_python=PY2 //experimental/python3:debug_arm64_debian9
bazel run --host_force_python=PY2 //experimental/python3:debug_arm64_debian10
bazel run --host_force_python=PY2 //experimental/python3:debug_nonroot_arm64_debian9
bazel run --host_force_python=PY2 //experimental/python3:debug_nonroot_arm64_debian10

bazel run --host_force_python=PY2 //experimental/python2.7:python27_amd64_debian9
bazel run --host_force_python=PY2 //experimental/python2.7:python27_amd64_debian10
bazel run --host_force_python=PY2 //experimental/python2.7:debug_amd64_debian9
bazel run --host_force_python=PY2 //experimental/python2.7:debug_amd64_debian10
bazel run --host_force_python=PY2 //experimental/python2.7:python27_arm64_debian9
bazel run --host_force_python=PY2 //experimental/python2.7:python27_arm64_debian10
bazel run --host_force_python=PY2 //experimental/python2.7:debug_arm64_debian9
bazel run --host_force_python=PY2 //experimental/python2.7:debug_arm64_debian10

bazel run //nodejs:nodejs10_amd64_debian9
bazel run //nodejs:nodejs10_debug_amd64_debian9
bazel run //nodejs:nodejs10_amd64_debian10
bazel run //nodejs:nodejs10_debug_amd64_debian10
bazel run //nodejs:nodejs12_amd64_debian9
bazel run //nodejs:nodejs12_debug_amd64_debian9
bazel run //nodejs:nodejs12_amd64_debian10
bazel run //nodejs:nodejs12_debug_amd64_debian10
bazel run //nodejs:nodejs14_amd64_debian9
bazel run //nodejs:nodejs14_debug_amd64_debian9
bazel run //nodejs:nodejs14_amd64_debian10
bazel run //nodejs:nodejs14_debug_amd64_debian10

bazel run //nodejs:nodejs10_arm64_debian9
bazel run //nodejs:nodejs10_debug_arm64_debian9
bazel run //nodejs:nodejs10_arm64_debian10
bazel run //nodejs:nodejs10_debug_arm64_debian10
bazel run //nodejs:nodejs12_arm64_debian9
bazel run //nodejs:nodejs12_debug_arm64_debian9
bazel run //nodejs:nodejs12_arm64_debian10
bazel run //nodejs:nodejs12_debug_arm64_debian10
bazel run //nodejs:nodejs14_arm64_debian9
bazel run //nodejs:nodejs14_debug_arm64_debian9
bazel run //nodejs:nodejs14_arm64_debian10
bazel run //nodejs:nodejs14_debug_arm64_debian10

bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_debian9
bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_debian10
bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_core_aspnet_debian9
bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_core_runtime_debian9
bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_core_sdk_debian9

bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_debug_debian9
bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_debug_debian10
bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_core_aspnet_debug_debian9
bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_core_runtime_debug_debian9
bazel run --host_force_python=PY2 //experimental/dotnet:dotnet_core_sdk_debug_debian9

    bazel run --host_force_python=PY2 //java:java_base_root_debian9
    bazel run --host_force_python=PY2 //java:java_base_nonroot_debian9
    bazel run --host_force_python=PY2 //java:java_base_debug_root_debian9
    bazel run --host_force_python=PY2 //java:java_base_debug_nonroot_debian9
    bazel run --host_force_python=PY2 //java:java_base_root_debian10
    bazel run --host_force_python=PY2 //java:java_base_nonroot_debian10
    bazel run --host_force_python=PY2 //java:java_base_debug_root_debian10
    bazel run --host_force_python=PY2 //java:java_base_debug_nonroot_debian10
    bazel run --host_force_python=PY2 //java:java8_root_debian9
    bazel run --host_force_python=PY2 //java:java8_nonroot_debian9
    bazel run --host_force_python=PY2 //java:java8_debug_root_debian9
    bazel run --host_force_python=PY2 //java:java8_debug_nonroot_debian9
    bazel run --host_force_python=PY2 //java:java11_root_debian9
    bazel run --host_force_python=PY2 //java:java11_nonroot_debian9
    bazel run --host_force_python=PY2 //java:java11_debug_root_debian9
    bazel run --host_force_python=PY2 //java:java11_debug_nonroot_debian9
    bazel run --host_force_python=PY2 //java:java11_root_debian10
    bazel run --host_force_python=PY2 //java:java11_nonroot_debian10
    bazel run --host_force_python=PY2 //java:java11_debug_root_debian10
    bazel run --host_force_python=PY2 //java:java11_debug_nonroot_debian10

    bazel run --host_force_python=PY2 //java/jetty:jetty_java8_debian9
    bazel run --host_force_python=PY2 //java/jetty:jetty_java8_debug_debian9
    bazel run --host_force_python=PY2 //java/jetty:jetty_java11_debian9
    bazel run --host_force_python=PY2 //java/jetty:jetty_java11_debug_debian9
    bazel run --host_force_python=PY2 //java/jetty:jetty_java11_debian10
    bazel run --host_force_python=PY2 //java/jetty:jetty_java11_debug_debian10
