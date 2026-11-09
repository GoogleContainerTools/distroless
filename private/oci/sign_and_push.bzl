"rules for signing, attesting and pushing images"

load("@bazel_skylib//rules:write_file.bzl", "write_file")
load("//private/pkg:oci_image_spdx.bzl", "image_aspect")

def _sign_and_push_impl(ctx):
    targets = []
    runfile_list = [ctx.version_file, ctx.file._crane, ctx.file._cosign, ctx.executable._runner]

    for (image, target) in ctx.attr.targets.items():
        image_dir = target[DefaultInfo].files.to_list()[0]
        sbom = target[OutputGroupInfo].spdx.to_list()[0]
        runfile_list.extend([image_dir, sbom])

        for ref in ctx.attr.refs[image]:
            repository, primary_tag = ref.split(":")
            targets.append({
                "image": image_dir.short_path,
                "sbom": sbom.short_path,
                "repository": repository,
                "tags": [primary_tag] + ctx.attr.more_tags[ref],
            })

    manifest = ctx.actions.declare_file("{}_manifest.json".format(ctx.label.name))
    ctx.actions.write(
        output = manifest,
        content = json.encode_indent({
            "version_file": ctx.version_file.short_path,
            "crane": ctx.file._crane.short_path,
            "cosign": ctx.file._cosign.short_path,
            "targets": targets,
        }),
    )
    runfile_list.append(manifest)

    executable = ctx.actions.declare_file("{}_sign_and_push.sh".format(ctx.label.name))
    ctx.actions.write(
        output = executable,
        content = """#!/usr/bin/env bash
set -euo pipefail
if [[ -d "$0.runfiles/_main" ]]; then
  cd "$0.runfiles/_main"
fi
exec "{runner}" --manifest "{manifest}" "$@"
""".format(
            runner = ctx.executable._runner.short_path,
            manifest = manifest.short_path,
        ),
        is_executable = True,
    )

    runfiles = ctx.runfiles(files = runfile_list).merge(
        ctx.attr._runner[DefaultInfo].default_runfiles,
    )
    return DefaultInfo(executable = executable, runfiles = runfiles)

sign_and_push = rule(
    implementation = _sign_and_push_impl,
    attrs = {
        "refs": attr.string_list_dict(mandatory = True),
        # Keep in target configuration so CI and local builds share outputs with
        # direct image builds; image and SBOM targets must not depend on --stamp.
        "targets": attr.string_keyed_label_dict(mandatory = True, aspects = [image_aspect]),
        "more_tags": attr.string_list_dict(mandatory = True),
        "_runner": attr.label(default = Label("//private/oci:sign_and_push"), executable = True, cfg = "exec"),
        "_crane": attr.label(allow_single_file = True, cfg = "exec", default = "@oci_crane_toolchains//:current_toolchain"),
        "_cosign": attr.label(allow_single_file = True, cfg = "exec", default = "@oci_cosign_toolchains//:current_toolchain"),
    },
    executable = True,
)

def sign_and_push_all(name, images):
    """simple macro signing and pushing images

    Args:
        name: name of the target
        images: a dict where keys are fully qualified image reference and values are image label
    """

    # since bazel doesn't allow dicts of dicts of lists as attrs, we have to write this nutty
    # deduplication code
    dedup_image_dict = dict()
    dedup_more_tags = dict()

    for (ref, image) in images.items():
        repository, tag = ref.split(":")
        if image in dedup_image_dict:
            foundPrefix = False
            for oRef in dedup_image_dict[image]:
                if oRef.split(":")[0] == repository:
                    dedup_more_tags[oRef].append(tag)
                    foundPrefix = True
                    break
            if not foundPrefix:
                dedup_image_dict[image].append(ref)
                dedup_more_tags[ref] = []
        else:
            dedup_image_dict[image] = [ref]
            dedup_more_tags[ref] = []

    write_file(
        name = name + ".query",
        content = [
            "{repo} {image}".format(
                repo = repo,
                image = image,
            )
            for (image, refs) in dedup_image_dict.items()
            for repo in refs
        ],
        out = name + "_query",
    )

    sign_and_push(
        name = name,
        targets = {image: image for image in dedup_image_dict},
        more_tags = dedup_more_tags,
        refs = dedup_image_dict,
    )
