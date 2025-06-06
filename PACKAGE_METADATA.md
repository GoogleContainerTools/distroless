# Package Metadata

## `dpkg` Metadata Structure Standard

### Overview

This document defines the standard structure for `dpkg` metadata within Google Distroless Debian-based images. The goal is to provide a clear specification for tool authors and users, enabling consistent and accurate results for vulnerability (CVE) scanning and package analysis.

### Directory Structure

Distroless Debian images differ from traditional Debian images in their handling of `dpkg` metadata. The relevant structure is as follows:

```
/var/lib/dpkg/
    └── status.d/
                ├── <package>
                └── <package>.md5sums
```

### Details

- **`/var/lib/dpkg/status.d/`**  
    - Contains one file per installed package.
    - Each file is named after the package (e.g., `libc6`, `libssl1.1`).

- **`/var/lib/dpkg/status.d/<package>`**  
    - Contains package metadata, equivalent to the output of:  
        ```
        dpkg-deb --field <package>.deb > /var/lib/dpkg/status.d/<package>
        ```

- **`/var/lib/dpkg/status.d/<package>.md5sums`**  
    - Contains file checksums, equivalent to the output of:  
        ```
        dpkg-deb --control <package>.deb CONTROL
        cp CONTROL/md5sums /var/lib/dpkg/status.d/<package>.md5sums
        rm -rf CONTROL
        ```

### Omitted Files

Distroless images intentionally omit several files found in standard Debian images:

- `/var/lib/dpkg/status`  
    - **Not present.** Replaced by the `status.d` directory.

- `/var/lib/dpkg/info/<package>.list`  
    - **Not present.** File lists can be inferred from the `.md5sums` files.

- `/var/lib/dpkg/info/<package>.md5sums`  
    - **Not present.** Checksums are stored in `status.d/<package>.md5sums`.

- Other `/var/lib/dpkg/info/<package>.*` files  
    - **Not present.** Not required for CVE scanning.

### Rationale

- **Minimalism:**  
    Distroless images remove unnecessary files to reduce image size and attack surface.

- **CVE Scanning Compatibility:**  
    The provided metadata is sufficient for most vulnerability scanners to identify installed packages and their versions.

- **Avoiding Conflicts:**  
    Using the `status.d` directory exclusively prevents confusion or potential issues that could arise if files conflicted with default `dpkg` folders. This approach ensures compatibility, especially if `dpkg` is used directly within the image.

### Guidance for Tool Authors

- Scan `/var/lib/dpkg/status.d/` for installed package metadata.
- Use `<package>` files for package details.
- Use `<package>.md5sums` for file checksums and file lists.
- Do not expect `/var/lib/dpkg/status` or `/var/lib/dpkg/info/` files.