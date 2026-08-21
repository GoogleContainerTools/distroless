#!/usr/bin/env node
const assert = require("node:assert/strict");
const { EventEmitter } = require("node:events");
const https = require("https");

const {
  calculateChecksum,
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

const withMockedHttpsGet = async (mock, fn) => {
  const originalGet = https.get;
  https.get = mock;
  try {
    await fn();
  } finally {
    https.get = originalGet;
  }
};

const mockHttpsGetStatus = (statusCode) => (_url, onResponse) => {
  const req = new EventEmitter();
  process.nextTick(() => {
    const res = new EventEmitter();
    res.statusCode = statusCode;
    res.resume = () => {};
    onResponse(res);
    process.nextTick(() => {
      res.emit("data", Buffer.from("error body"));
      res.emit("end");
    });
  });
  return req;
};

const runAsyncTests = async () => {
  await withMockedHttpsGet(mockHttpsGetStatus(404), async () => {
    await assert.rejects(
      calculateChecksum("https://nodejs.org/dist/not-found.tar.gz"),
      /Request failed with status code 404/
    );
  });
};

runAsyncTests()
  .then(() => {
    console.log("update_node_archives validation tests passed");
  })
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });
