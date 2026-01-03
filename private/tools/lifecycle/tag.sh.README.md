# Container Image Lifecycle Tagger (Distroless Admin Tooling)

A Bash utility to bulk-tag container images in a registry. This is particularly useful for marking old images as "available for update" or "deprecated" without deleting them, allowing for safer cleanup or auditing.

## Prerequisites

* **[gcrane](https://github.com/google/go-containerregistry/tree/main/cmd/gcrane):** Used for interacting with the container registry.
* **[jq](https://github.com/jqlang/jq/):** Used for parsing registry JSON manifests.
* **Authentication:** Ensure you are authenticated to your registry (e.g., `gcloud auth configure-docker`).

## Functionality

The script operates in two primary modes:

### 1. `update` mode

Identifies images that are "stale" but likely safe to mark for replacement. It selects images that:

* Have no tags **OR** only have auto-generated git commit hash based tags (40-character hex strings).
* Are older than **48 hours** (to avoid interfering with active CI/CD pipelines).
* **Action:** Tags them with the prefix `update-available-<sha256>`.

### 2. `deprecate` mode

Identifies images that have not yet been marked as deprecated.

* Selects images that do **not** already have a tag matching the deprecation pattern.
* **Action:** Tags them with the prefix `deprecated-public-image-<sha256>`.
* *Note: The execution for this mode is currently commented out in the script as a safety measure.*

---

## Usage

```bash
./tag.sh [update|deprecate] <image>
```

### Examples

**Dry Run (Default):**
By default, the script only prints what it *would* do.

```bash
./tag.sh update gcr.io/distroless/python3-debian12
```

**Live Execution:**
To actually apply tags to the registry, set `DRY_RUN` to `false`.

```bash
DRY_RUN=false ./tag.sh update gcr.io/distroless/python3-debian12
```
