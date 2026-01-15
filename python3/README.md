# Documentation for `gcr.io/distroless/python3`

## Image Contents

This image contains a minimal Linux, Python-based runtime.

Specifically, the image contains everything in the [base image](../base/README.md), plus:

* Python 3 and its runtime dependencies
* No shell and limited support for native extensions

## Usage

This image is intended to run Python applications directly.

See the Python [Hello World](../examples/python3/) directory for an example.

---

## ⚠️ Important Usage Notes

### Python Version Compatibility

The Python version included in distroless images is provided by the underlying
Debian distribution. Users must ensure that any Python packages copied into the
image were built using the **exact same Python minor version**.

❌ Unsupported / unsafe pattern

- Installing dependencies using Python 3.12 in a builder stage
- Copying `/usr/local/lib/python3.12` or site-packages into a distroless image
  that uses Python 3.11

This may result in runtime errors such as:

- `SyntaxError: Non-UTF-8 code starting with '\x80'`
- `No module named <package>`
- Segmentation faults or crashes at startup

These failures are caused by ABI incompatibilities between Python versions.

---

### Recommended Usage

Distroless Python images are best suited for:

- Pure-Python applications
- Minimal dependencies
- Environments where Python version alignment is guaranteed

For applications with native extensions (e.g. numpy, pandas, torch, ML workloads),
consider using `python:<version>-slim` images instead.

---

### Execution Model

### Execution Model

Distroless images do not include a shell.

The `python3` image provides a default ENTRYPOINT that invokes the Python
interpreter, which allows users to supply a script directly via `CMD`
(as demonstrated in the `examples/python3` directory).

However, for maximum clarity and to avoid ambiguity—especially in more complex
container configurations—it is often preferable to explicitly invoke the
interpreter using an absolute path:

```dockerfile
CMD ["/usr/bin/python3", "-m", "your_module"]
