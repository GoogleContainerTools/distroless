# Copyright 2017 Google Inc. All rights reserved.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"extract ca-certificates and converts to version 2 JKS from PEM-encoded x509 certs"
load("@rules_pkg//:providers.bzl", "PackageFilesInfo")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

CMD="""\
#!/usr/bin/env bash
set -o pipefail -o errexit
tar -xOf "$1" ./etc/ssl/certs/ca-certificates.crt | $3 > $2
"""

def _impl(ctx):
    cacerts = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.run_shell(
        outputs = [cacerts],
        inputs = [ctx.file.cacerts_tar],
        tools = [ctx.file._jksutil],
        arguments = [ctx.file.cacerts_tar.path, cacerts.path, ctx.executable._jksutil.path],
        command = CMD,
    )
    return [
        DefaultInfo(files = depset([cacerts])),
        PackageFilesInfo(dest_src_map = {"/etc/ssl/certs/java/cacerts": cacerts})
    ]

_cacerts_java = rule(
    doc = """
Rule for converting the PEM formatted ca-certs in to JKS format. Output is a tar
file with the JKS file at etc/ssl/certs/java/cacerts.
""",
    attrs = {
        "cacerts_tar": attr.label(
            allow_single_file = [".tar"],
            mandatory = True,
        ),
        "_jksutil": attr.label(
            default = Label("//cacerts/jksutil:jksutil"),
            cfg = "host",
            executable = True,
            allow_single_file = True,
        ),
    },
    implementation = _impl,
)

def cacerts_java(name, cacerts_tar, **kwargs):
    _cacerts_java(name = "%s_extract" % name, cacerts_tar = cacerts_tar, **kwargs)
    pkg_tar(name = name, srcs = ["%s_extract" % name], **kwargs)