#!/usr/bin/env bash
set -o pipefail -o errexit -o nounset

# ./private/tools/diff.bash --head-ref test --base-ref test --query-bazel --registry-spawn --report ./report.log

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
SET_GITHUB_OUTPUT="0"
ONLY=
SKIP_INDEX="0"

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
    --set-github-output-on-diff)
        SET_GITHUB_OUTPUT="1"
        echo "changed_targets=" >> "$GITHUB_OUTPUT"
        shift
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

# Redirect stderr to the $STDERR temp file for the rest of the script.
exec 2>>"${STDERR}"

DISK_STORAGE="/tmp/diff-storage"

if [[ "${QUERY_FILE}" == "bazel" ]]; then
    bazel build :sign_and_push.query
    QUERY_FILE=$(bazel cquery --output=files :sign_and_push.query)
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

function test_image() {
    IFS=" " read -r repo tag push_label image_label <<<"$1"

    if [[ "${ONLY}" != "" && "${ONLY}" != "$image_label" ]]; then
        return 
    fi

    repo_origin=$(stamp_origin "$repo")
    repo_stage=$(stamp_stage "$repo")
    tag_stamped=$(stamp_origin "$tag")

    if [[ "${SKIP_INDEX}" == "1" ]]; then
        if ! crane manifest "$repo_origin:$tag_stamped" | jq -e '.mediaType == "application/vnd.oci.image.manifest.v1+json"' > /dev/null; then  
            echo "⏭️ Skipping image index $repo_origin:$tag_stamped "
            return
        fi
    fi

    echo ""
    echo "🚧 Diffing $repo_origin:$tag_stamped against $repo_stage:$tag_stamped"
    echo ""

    bazel run $push_label -- --repository $repo_stage --tag $tag_stamped
    if ! diffoci diff --pull=always --all-platforms --semantic "$repo_origin:$tag_stamped" "$repo_stage:$tag_stamped"; then
        echo ""
        echo "      🔬 To reproduce: bazel run //private/tools:diff -- --only $image_label"
        echo ""
        echo "👎 $repo_origin:$tag_stamped and $repo_stage:$tag_stamped are different."
        if [[ "${SET_GITHUB_OUTPUT}" == "1" ]]; then
            echo "$image_label" >> "$CHANGED_IMAGES_FILE"
        fi
    else
        echo ""
        echo "👍 $repo_origin:$tag_stamped and $repo_stage:$tag_stamped are identical."
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
    export HEAD_REF BASE_REF REGISTRY REPORT_FILE SET_GITHUB_OUTPUT ONLY CHANGED_IMAGES_FILE SKIP_INDEX
    export -f stamp_origin stamp_stage test_image
    cat "${QUERY_FILE}" | parallel --eta --progress --jobs "${JOBS}" "set -o pipefail -o errexit -o nounset && test_image"
else
    while IFS= read -r line || [ -n "$line" ]; do
        test_image "${line}"
    done <"${QUERY_FILE}"
fi

if [[ "${SET_GITHUB_OUTPUT}" == "1" ]]; then
    echo "changed_targets<<EOF" >> "$GITHUB_OUTPUT"
    cat "$CHANGED_IMAGES_FILE" >> "$GITHUB_OUTPUT"
    echo "EOF" >> "$GITHUB_OUTPUT"
fi
