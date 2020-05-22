#!/usr/bin/env bash

set -o errexit
set -o xtrace

# kill $(pgrep bazel)

# ----------------------------------------------------------------------

GIT_ROOT_DIR="$(git rev-parse --show-toplevel)"
echo "\${GIT_ROOT_DIR}: ${GIT_ROOT_DIR}"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "\${SCRIPT_DIR}: ${SCRIPT_DIR}"

BAZEL_BIN_PATH="${GIT_ROOT_DIR}/bazel-bin"
echo "\${BAZEL_BIN_PATH}: ${BAZEL_BIN_PATH}"

# ----------------------------------------------------------------------

bazel version
bazel version --gnu_format
bazel --version

# ----------------------------------------------------------------------

# for item in "${BAZEL_BIN_PATH}/*"; do
#     rm --force --recursive --verbose "$(readlink --canonicalize ${item})"
# done
# [ -d "/path/to/dir" ] && rm --verbose ./bazel-bin

# ----------------------------------------------------------------------

# bazel clean \
#     --announce_rc \
#     --attempt_to_print_relative_paths \
#     --color=yes \
#     --curses=no \
#     --host_force_python=PY2 \
#     --show_timestamps

# bazel build \
#     --announce_rc \
#     --attempt_to_print_relative_paths \
#     --color=yes \
#     --curses=no \
#     --host_force_python=PY2 \
#     --show_timestamps \
#     //package_manager:dpkg_parser.par

# ----------------------------------------------------------------------

bazel build \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_timestamps \
    //experimental/dotnet:dotnet

# ----------------------------------------------------------------------

bazel build \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_aspnet:dotnet_core_aspnet

bazel run \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_aspnet:dotnet_core_aspnet

docker run \
    --cpus 1 \
    --memory 256M \
    --rm \
    bazel/experimental/dotnet_core_aspnet:dotnet_core_aspnet_debian10 \
    dotnet --list-runtimes

# -----------------------------------

bazel build \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_aspnet:debug

bazel run \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_aspnet:debug

docker run \
    --cpus 1 \
    --memory 256M \
    --rm \
    bazel/experimental/dotnet_core_aspnet:debug_debian10 \
    dotnet --info

# ----------------------------------------------------------------------

bazel build \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_runtime:dotnet_core_runtime

bazel run \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_runtime:dotnet_core_runtime

docker run \
    --cpus 1 \
    --memory 256M \
    --rm \
    bazel/experimental/dotnet_core_runtime:dotnet_core_runtime_debian10 \
    dotnet --list-runtimes

# -----------------------------------

bazel build \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_runtime:debug

bazel run \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_runtime:debug

docker run \
    --cpus 1 \
    --memory 256M \
    --rm \
    bazel/experimental/dotnet_core_runtime:debug_debian10 \
    dotnet --info

# ----------------------------------------------------------------------

bazel build \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_sdk:dotnet_core_sdk

bazel run \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_sdk:dotnet_core_sdk

docker run \
    --cpus 1 \
    --memory 256M \
    --rm \
    bazel/experimental/dotnet_core_sdk:dotnet_core_sdk_debian10 \
    dotnet --list-sdks

# -----------------------------------

bazel build \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_sdk:debug

bazel run \
    --announce_rc \
    --attempt_to_print_relative_paths \
    --color=yes \
    --curses=no \
    --host_force_python=PY2 \
    --show_loading_progress \
    --show_progress \
    --show_progress_rate_limit=1 \
    --show_timestamps \
    --verbose_failures \
    --worker_verbose \
    //experimental/dotnet_core_sdk:debug

docker run \
    --cpus 1 \
    --memory 256M \
    --rm \
    bazel/experimental/dotnet_core_sdk:debug_debian10 \
    dotnet --info

# ----------------------------------------------------------------------

# bazel build --host_force_python=PY2 --curses=no //experimental/dotnet:dotnet_debian9
# bazel build --host_force_python=PY2 --curses=no //experimental/dotnet:dotnet_debian10
# bazel run --host_force_python=PY2 --curses=no //experimental/dotnet:dotnet_debian9
# bazel run --host_force_python=PY2 --curses=no //experimental/dotnet:dotnet_debian10
# bazel test --host_force_python=PY2 --curses=no --test_output=errors //experimental/dotnet:dotnet_debian9
# bazel test --host_force_python=PY2 --curses=no --test_output=errors //experimental/dotnet:dotnet_debian10

bazel shutdown --iff_heap_size_greater_than=1
