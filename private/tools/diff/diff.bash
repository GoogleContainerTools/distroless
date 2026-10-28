#!/usr/bin/env bash
set -o pipefail -o errexit -o nounset

# ./private/tools/diff/diff.bash --head-ref test --base-ref test --query-bazel --registry-spawn --report ./report.log

STDERR=$(mktemp)

# Upon exiting, stop the registry and print STDERR on non-zero exit code.
on_exit() {
    last_exit_code=$?
    set +o errexit
    if [[ $last_exit_code != 0 ]]; then
        echo ""
        echo "💥 Something went wrong."
        if [[ $(wc -c <"${STDERR}") -gt 0 ]]; then
            echo ""
            echo "Here's the STDERR:"
            echo ""
            cat $STDERR
        fi
    fi
    pkill -P $$
}
trap "on_exit" EXIT

PID=
HEAD_REF=
BASE_REF=
QUERY_FILE=
REPORT_FILE=
REGISTRY=
JOBS=
STDERR=$(mktemp)
CHANGED_IMAGES_FILE=$(mktemp)
ONLY=
SKIP_INDEX="0"
BAZEL_ARGS="${BAZEL_ARGS:-}"

while (($# > 0)); do
    case $1 in
    --base-ref)
        BASE_REF="$2"
        shift 2
        ;;
    --head-ref)
        HEAD_REF="$2"
        shift 2
        ;;
    --registry)
        REGISTRY="$2"
        shift 2
        ;;
    --registry-spawn)
        REGISTRY="spawn"
        shift
        ;;
    --registry-spawn-https)
        REGISTRY="spawn_https"
        shift
        ;;
    --query)
        QUERY_FILE="$2"
        shift 2
        ;;
    --query-bazel)
        QUERY_FILE="bazel"
        shift
        ;;
    --report)
        REPORT_FILE="$2"
        shift 2
        ;;
    --jobs)
        JOBS="$2"
        shift 2
        ;;
    --logs)
        STDERR="$2"
        shift 2
        ;;
    --only)
        ONLY="$2"
        shift 2
        ;;
    --cd-into-workspace)
        cd $BUILD_WORKSPACE_DIRECTORY
        shift
        ;;
    --skip-image-index)
        SKIP_INDEX="1"
        shift
        ;;
    --bazel-args)
        BAZEL_ARGS="$2"
        shift 2
        ;;
    *)
        echo "unknown arg $1"
        exit 1
        ;;
    esac
done

if [[ -z "${REGISTRY}" ]]; then
    echo "--registry is required."
    exit 1
fi

if [[ -z "${BASE_REF}" ]]; then
    echo "--base-ref is required."
    exit 1
fi

if [[ -z "${HEAD_REF}" ]]; then
    echo "--head-ref is required."
    exit 1
fi

if [[ -z "${QUERY_FILE}" ]]; then
    echo "--query or --query-bazel must be provided"
    exit 1
fi

if [[ "${GITHUB_ACTIONS:-}" == "true" && -n "${GITHUB_OUTPUT:-}" ]]; then
    echo "changed_targets=" >> "$GITHUB_OUTPUT"
fi

# Redirect stderr to the $STDERR temp file for the rest of the script.
exec 2>>"${STDERR}"

DISK_STORAGE="/tmp/diff-storage"

if [[ "${QUERY_FILE}" == "bazel" ]]; then
    bazel ${BAZEL_ARGS} build :sign_and_push.query
    QUERY_FILE=$(bazel ${BAZEL_ARGS} cquery --output=files :sign_and_push.query)
fi

if [[ "${REGISTRY}" == "spawn_https" ]]; then
    # Make a self signed cert
    rm -f /tmp/localhost.pem /tmp/localhost-key.pem
    rm -rf $DISK_STORAGE
    mkcert -install
    (cd /tmp && mkcert localhost)
    echo '{
        "http":{
            "address":"127.0.0.1", "port":"4564",
            "tls": {
                "cert":"/tmp/localhost.pem",
                "key":"/tmp/localhost-key.pem"
            }
        },
        "log": { "level": "info" },
        "storage":{"rootDirectory":"/tmp/diff-storage"}
    }' >/tmp/cfg.json
    REGISTRY="localhost:4564"
    zot serve /tmp/cfg.json 1>&2 &
    sleep 1
fi

if [[ "${REGISTRY}" == "spawn" ]]; then
    rm -rf $DISK_STORAGE
    mkdir $DISK_STORAGE
    REGISTRY="localhost:4564"
    crane registry serve --address "$REGISTRY" --disk "$DISK_STORAGE" &
fi

stamp_stage() {
    local str="$1"
    str=${str/"{COMMIT_SHA}"/"${HEAD_REF}"}
    str=${str/"{REGISTRY}"/"${REGISTRY}"}
    echo ${str/"{PROJECT_ID}"/"stage"}
}

stamp_origin() {
    local str=$1
    str=${str/"{COMMIT_SHA}"/"${BASE_REF}"}
    str=${str/"{REGISTRY}"/"gcr.io"}
    echo ${str/"{PROJECT_ID}"/"distroless"}
}

sha256_file() {
    if command -v sha256sum >/dev/null 2>&1; then
        sha256sum "$1" | awk '{print $1}'
    else
        shasum -a 256 "$1" | awk '{print $1}'
    fi
}

# Build every selected target: existing outputs may be stale.
# Leave --skip-image-index filtering to the manifest check in test_image.
TARGETS_FILE=$(mktemp)
awk -v only="${ONLY}" '
    NF && $0 !~ /^[[:space:]]*#/ && (only == "" || $2 == only) {
        print $2
    }
' "${QUERY_FILE}" | sort -u >"${TARGETS_FILE}"
IMAGE_TARGETS=()
HAVE_IMAGE_TARGETS=0
while IFS= read -r target; do
    if [[ -n "$target" ]]; then
        IMAGE_TARGETS+=("$target")
        HAVE_IMAGE_TARGETS=1
    fi
done <"${TARGETS_FILE}"
rm -f "${TARGETS_FILE}"

# Resolve output paths once, using the same configuration as the build.
# Each workspace-local image target must expose exactly one OCI layout directory.
IMAGE_FILES_FILE=$(mktemp)
if ((HAVE_IMAGE_TARGETS)); then
    bazel ${BAZEL_ARGS} build "${IMAGE_TARGETS[@]}"
    bazel ${BAZEL_ARGS} cquery "set(${IMAGE_TARGETS[*]})" \
        --output=starlark \
        --starlark:expr='"//" + target.label.package + ":" + target.label.name + " " + " ".join([f.path for f in target.files.to_list()])' \
        >"${IMAGE_FILES_FILE}"
elif [[ -n "${ONLY}" ]]; then
    echo "--only ${ONLY} did not match any image target in ${QUERY_FILE}" >&2
    exit 1
else
    echo "No image targets found in ${QUERY_FILE}" >&2
    exit 1
fi

function test_image() {
    [[ -z "${1//[[:space:]]/}" || "$1" =~ ^[[:space:]]*# ]] && return 0
    IFS=" " read -r repo image_label <<<"$1"

    if [[ "${ONLY}" != "" && "${ONLY}" != "$image_label" ]]; then
        return 0
    fi

    repo_origin=$(stamp_origin "$repo")
    repo_stage=$(stamp_stage "$repo")

    local manifest_file
    manifest_file=$(mktemp)
    if ! crane manifest "$repo_origin" >"$manifest_file"; then
        rm -f "$manifest_file"
        echo "🆕 New image will be added to $repo_origin"
        echo "$image_label (new)" >> "$CHANGED_IMAGES_FILE"
        return 0
    fi

    if [[ "${SKIP_INDEX}" == "1" ]]; then
        if ! jq -e '.mediaType == "application/vnd.oci.image.manifest.v1+json"' "$manifest_file" > /dev/null; then
            rm -f "$manifest_file"
            echo "⏭️ Skipping image index $repo_origin"
            return 0
        fi
    fi

    local origin_digest
    origin_digest="sha256:$(sha256_file "$manifest_file")"
    rm -f "$manifest_file"

    echo ""
    echo "🚧 Diffing $repo_origin against $repo_stage"
    echo ""

    local image_dir
    image_dir=$(awk -v label="$image_label" '
        $1 == label {
            count++
            if (NF == 2) path = $2
        }
        END {
            if (count != 1 || path == "") exit 1
            print path
        }
    ' "${IMAGE_FILES_FILE}") || {
        echo "Missing or ambiguous output for $image_label" >&2
        return 1
    }
    if [[ ! -f "${image_dir}/index.json" ]]; then
        echo "Missing OCI layout for $image_label: $image_dir" >&2
        return 1
    fi

    local local_digest
    local_digest=$(jq -r '
        if (.manifests | type == "array") and (.manifests | length == 1) then
            .manifests[0].digest // empty
        else
            empty
        end
    ' "${image_dir}/index.json")
    if [[ -n "$local_digest" && "$origin_digest" == "$local_digest" ]]; then
        echo "${repo_stage%:*}@${local_digest}"
        echo ""
        echo "👍 $repo_origin and $repo_stage are identical."
        return 0
    fi

    crane push "$image_dir" "$repo_stage"
    if ! diffoci diff --pull=always --all-platforms "$repo_origin" "$repo_stage"; then
        echo ""
        echo "      🔬 To reproduce: bazel run //private/tools/diff:diff -- --only $image_label"
        echo ""
        echo "👎 $repo_origin and $repo_stage are different."
        echo "$image_label" >> "$CHANGED_IMAGES_FILE"
    else
        echo ""
        echo "👍 $repo_origin and $repo_stage are identical."
    fi
}

if [[ -n "${REPORT_FILE}" ]]; then
    echo "Report can be found in: $REPORT_FILE"
    echo -n "" >$REPORT_FILE
    sleep 1
    # Redirect rest of the file into both report file and stdout
    exec 1> >(tee -a "${REPORT_FILE}")
fi

# Parallelize using gnu parallel
if [[ "${JOBS}" -gt 0 ]]; then
    export HEAD_REF BASE_REF REGISTRY REPORT_FILE ONLY CHANGED_IMAGES_FILE SKIP_INDEX IMAGE_FILES_FILE
    export -f stamp_origin stamp_stage sha256_file test_image
    cat "${QUERY_FILE}" | parallel --eta --progress --jobs "${JOBS}" "set -o pipefail -o errexit -o nounset && test_image"
else
    while IFS= read -r line || [ -n "$line" ]; do
        test_image "${line}"
    done <"${QUERY_FILE}"
fi

if [[ "${GITHUB_ACTIONS:-}" == "true" && -n "${GITHUB_OUTPUT:-}" ]]; then
    echo "changed_targets<<EOF" >> "$GITHUB_OUTPUT"
    LC_ALL=C sort -u "$CHANGED_IMAGES_FILE" >> "$GITHUB_OUTPUT"
    echo "EOF" >> "$GITHUB_OUTPUT"
fi
