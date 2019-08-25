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

"""Rule for building and extracting java ca-certificates inside of a docker image."""

def _impl(ctx):
    # Strip off the '.tar'
    image_name = ctx.attr._builder_image.label.name.split(".", 1)[0]

    # container_image rules always generate an image named 'bazel/$package:$name'.
    builder_image_name = "bazel/%s:%s" % (
        ctx.attr._builder_image.label.package,
        image_name,
    )

    # Generate a shell script to run the build.
    build_contents = """\
#!/bin/bash
set -ex
docker load -i {0}
# Install the certs in the builder image.
# ln: the default non-interactive shell is dash, which interferes with the post install script.
cid=$(docker run -d {1} sh -c "ln -sf bash /bin/sh && apt-get update && apt-get install -y -q ca-certificates-java")
docker attach $cid

# Copy out the certs as a tarball
mkdir -p etc/ssl/certs/java
docker cp $cid:/etc/ssl/certs/java/cacerts etc/ssl/certs/java/cacerts
tar -cf {2} etc/

# Cleanup
docker rm $cid
 """.format(
        ctx.file._builder_image.path,
        builder_image_name,
        ctx.outputs.out.path,
    )
    script = ctx.actions.declare_file("cacerts.build")
    ctx.actions.write(
        output = script,
        content = build_contents,
    )

    ctx.actions.run(
        outputs = [ctx.outputs.out],
        inputs = ctx.attr._builder_image.files.to_list() +
                 ctx.attr._builder_image.data_runfiles.files.to_list() + ctx.attr._builder_image.default_runfiles.files.to_list(),
        executable = script,
    )

    return struct()

cacerts_java = rule(
    attrs = {
        "_builder_image": attr.label(
            default = Label("@debian9//image:image.tar"),
            allow_single_file = True,
        ),
    },
    executable = False,
    outputs = {
        "out": "%{name}.tar",
    },
    implementation = _impl,
)
