#!/usr/bin/env bash
set -eo pipefail

MODE=$1
shift

if [[ "${MODE}" != "update" && "${MODE}" != "check" ]]; then
  echo "Usage: $0 <update|check> <arch>..." >&2
  exit 1
fi

# Root to find the reference cache files
ROOT="python3/ldconfig"
if [[ -n "${BUILD_WORKSPACE_DIRECTORY}" ]]; then
  cd "${BUILD_WORKSPACE_DIRECTORY}"
elif [[ ! -d "${ROOT}" ]]; then
  # Fallback to finding it in the same dir as the script
  ROOT=$(dirname "$0")
fi

CID=""
TEMP_DIR=""
cleanup() {
  local exit_status=$?
  if [[ -n "${CID}" ]]; then docker rm -f "${CID}"; fi
  if [[ -n "${TEMP_DIR}" ]]; then rm -rf "${TEMP_DIR}"; fi
  exit "${exit_status}"
}
trap cleanup EXIT

for arch in "$@"; do
  echo "===> ${MODE^}ing ldconfig cache for ${arch}..."

  # Run ldconfig and extract the cache.
  # We assume the image is ALREADY loaded (handled by Bazel build dependencies)
  CID=$(docker create --platform "linux/${arch}" --entrypoint /sbin/ldconfig "bazel/python3:python3_root_${arch}_debian13")
  docker start -a "${CID}"

  if [[ "${MODE}" == "update" ]]; then
    docker cp "${CID}:/etc/ld.so.cache" "${ROOT}/ld.so.cache.${arch}"
    echo "✅ Updated ${arch} cache."
  else
    TEMP_DIR=$(mktemp -d)
    docker cp "${CID}:/etc/ld.so.cache" "${TEMP_DIR}/ld.so.cache.${arch}"
    if ! cmp -s "${TEMP_DIR}/ld.so.cache.${arch}" "${ROOT}/ld.so.cache.${arch}"; then
      echo "❌ ERROR: ldconfig cache for ${arch} is out of date!" >&2
      echo "Run 'bazel run //python3:update_ldconfig' to regenerate." >&2
      exit 1
    fi
    rm -rf "${TEMP_DIR}"
    TEMP_DIR=""
    echo "✅ ldconfig cache for ${arch} is up to date."
  fi
  docker rm -f "${CID}"
  CID=""
done
