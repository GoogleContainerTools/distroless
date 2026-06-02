#!/usr/bin/env node
const assert = require("node:assert/strict");

const {
  starlarkString,
  validateArchiveSuffix,
  validateDistrolessArch,
  validateNodeVersion,
  validateSha256,
} = require("./update_node_archives.js");

assert.equal(validateNodeVersion("26.2.0"), "26.2.0");
assert.throws(
  () => validateNodeVersion('26.2.0" + "bad'),
  /Invalid Node.js version/
);
assert.throws(() => validateNodeVersion("v26.2.0"), /Invalid Node.js version/);
assert.throws(() => validateNodeVersion("26.2.0\n26.2.1"), /Invalid Node.js version/);

assert.equal(validateArchiveSuffix("x64"), "x64");
assert.throws(() => validateArchiveSuffix('x64" + fail("bad") + "'), /Invalid Node.js archive suffix/);

assert.equal(validateDistrolessArch("amd64"), "amd64");
assert.throws(() => validateDistrolessArch("amd64\nbad"), /Invalid distroless architecture/);

assert.equal(
  validateSha256("a".repeat(64)),
  "a".repeat(64)
);
assert.throws(() => validateSha256("not-a-sha"), /Invalid SHA256 checksum/);

assert.equal(
  starlarkString('26.2.0" + "bad'),
  '"26.2.0\\" + \\"bad"'
);
assert.equal(starlarkString("line1\nline2"), '"line1\\nline2"');

console.log("update_node_archives validation tests passed");
