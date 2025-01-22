"rules for signing, attesting and pushing images"

load("@bazel_skylib//rules:write_file.bzl", "write_file")
load("//private/pkg:oci_image_spdx.bzl", "oci_image_spdx")
load(":digest.bzl", "digest")

PUSH_AND_SIGN_CMD = """\
# Push {IMAGE}
repository="$(stamp "{REPOSITORY}")"
digest="$(cat {DIGEST})"
echo "Pushing $repository@$digest"
{CRANE} push {IMAGE} "$repository@$digest"
{COSIGN} attest "$repository@$digest" --predicate "{SBOM}" --type "spdx" --yes
{COSIGN} sign "$repository@$digest" --yes
"""

TAG_CMD = """\
# Tag {IMAGE}
from="$(stamp "{FROM}")"
to="$(stamp "{TO}")"
{CRANE} copy "$from" "$to"
"""

def _sign_and_push_impl(ctx):
    cmds = []

    runfiles = ctx.runfiles(files = ctx.files.targets + [ctx.version_file, ctx.file._crane, ctx.file._cosign])

    for (image, target) in ctx.attr.targets.items():
        files = target[DefaultInfo].files.to_list()

        all_refs = ctx.attr.refs[image]
        first_ref = all_refs[0]
        repository_and_tag = first_ref.split(":")
        cmds.append(
            PUSH_AND_SIGN_CMD.format(
                IMAGE = files[0].short_path,
                SBOM = files[1].short_path,
                DIGEST = files[2].short_path,
                CRANE = ctx.file._crane.short_path,
                COSIGN = ctx.file._cosign.short_path,
                REPOSITORY = repository_and_tag[0],
                TAG = repository_and_tag[1],
            ),
        )

        for ref in all_refs[1:]:
            cmds.append(
                TAG_CMD.format(
                    IMAGE = image,
                    FROM = first_ref,
                    TO = ref,
                    CRANE = ctx.file._crane.short_path,
                ),
            )

    executable = ctx.actions.declare_file("{}_sign_and_push.sh".format(ctx.label.name))
    ctx.actions.expand_template(
        template = ctx.file._push_tpl,
        output = executable,
        substitutions = {
            "{{VERSION_FILE}}": ctx.version_file.short_path,
            "{{CMDS}}": "\n".join(cmds),
        },
        is_executable = True,
    )

    return DefaultInfo(executable = executable, runfiles = runfiles)

sign_and_push = rule(
    implementation = _sign_and_push_impl,
    attrs = {
        "refs": attr.string_list_dict(mandatory = True),
        "targets": attr.string_keyed_label_dict(mandatory = True, cfg = "exec"),
        "_push_tpl": attr.label(default = "sign_and_push.sh.tpl", allow_single_file = True),
        "_crane": attr.label(allow_single_file = True, cfg = "exec", default = "@oci_crane_toolchains//:current_toolchain"),
        "_cosign": attr.label(allow_single_file = True, cfg = "exec", default = "@oci_cosign_toolchains//:current_toolchain"),
    },
    executable = True,
)

def sign_and_push_all(name, images):
    """simple macro singing and pushing images

    Args:
        name: name of the target
        images: a dict where keys are fully qualified image reference and values are image label
    """

    dedup_image_dict = dict()
    dedup_push_dict = dict()

    for (idx, (ref, image)) in enumerate(images.items()):
        if image in dedup_image_dict:
            dedup_image_dict[image].append(ref)
        else:
            dedup_image_dict[image] = [ref]

    for (idx, (image, ref)) in enumerate(dedup_image_dict.items()):
        oci_image_spdx(
            name = "{}_{}_sbom".format(name, idx),
            image = image,
        )
        digest(
            name = "{}_{}_digest".format(name, idx),
            image = image,
        )

        native.filegroup(
            name = "{}_{}".format(name, idx),
            srcs = [
                image,
                ":{}_{}_sbom".format(name, idx),
                ":{}_{}_digest".format(name, idx),
            ],
        )

        dedup_push_dict[image] = "{}_{}".format(name, idx)

    write_file(
        name = name + ".query",
        content = [
            "{repo} {image}".format(
                repo = refs[0],
                image = image,
            )
            for (image, refs) in dedup_image_dict.items()
        ],
        out = name + "_query",
    )

    sign_and_push(
        name = name,
        targets = dedup_push_dict,
        refs = dedup_image_dict,
    )
