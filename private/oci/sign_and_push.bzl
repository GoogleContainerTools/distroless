"rules for signing, attesting and pushing images"

load("@bazel_skylib//rules:write_file.bzl", "write_file")
load("@rules_oci//cosign:defs.bzl", "cosign_attest", "cosign_sign")
load("@rules_oci//oci:defs.bzl", "oci_push")
load("//private/pkg:oci_image_spdx.bzl", "oci_image_spdx")

PUSH_AND_SIGN_CMD = """\
repository="$(stamp "{REPOSITORY}")"
tag="$(stamp "{TAG}")"

[[ -n $EXPORT ]] && echo "$repository:$tag" >> $EXPORT

# Push the image by its digest
"$(realpath {PUSH_CMD})" --repository "$repository"

# Attest the sbom
GOOGLE_SERVICE_ACCOUNT_NAME="$KEYLESS" "$(realpath {ATTEST_CMD})" --repository "$repository" --yes

# Sign keyless by using an identity
GOOGLE_SERVICE_ACCOUNT_NAME="$KEYLESS" "$(realpath {SIGN_CMD})" --repository "$repository" --yes

# Tag the image
"$(realpath {PUSH_CMD})" --repository "$repository" --tag "$tag"
"""

def _sign_and_push_impl(ctx):
    cmds = []
    runfiles = ctx.runfiles(files = ctx.files.targets + [ctx.version_file])

    for (target, url) in ctx.attr.targets.items():
        files = target[DefaultInfo].files.to_list()
        runfiles = runfiles.merge(target[DefaultInfo].default_runfiles)
        repository_and_tag = url.split(":")
        cmds.append(
            PUSH_AND_SIGN_CMD.format(
                ATTEST_CMD = files[0].short_path,
                SIGN_CMD = files[1].short_path,
                PUSH_CMD = files[2].short_path,
                REPOSITORY = repository_and_tag[0],
                TAG = repository_and_tag[1],
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
        "targets": attr.label_keyed_string_dict(mandatory = True, cfg = "exec"),
        "_push_tpl": attr.label(default = "sign_and_push.sh.tpl", allow_single_file = True),
    },
    executable = True,
)

def sign_and_push_all(name, images):
    """simple macro singing and pushing images

    Args:
        name: name of the target
        images: a dict where keys are fully qualified image url and values are image labels
    """
    image_dict = dict()
    query_dict = dict()
    for (idx, (url, image)) in enumerate(images.items()):
        oci_push(
            name = "{}_{}_push".format(name, idx),
            image = image,
            repository = "repository.default.local",
        )
        oci_image_spdx(
            name = "{}_{}_sbom".format(name, idx),
            image = image,
        )
        cosign_attest(
            name = "{}_{}_attest".format(name, idx),
            image = image,
            type = "spdx",
            predicate = "{}_{}_sbom".format(name, idx),
            repository = "repository.default.local",
        )
        cosign_sign(
            name = "{}_{}_sign".format(name, idx),
            image = image,
            repository = "repository.default.local",
        )
        native.filegroup(
            name = "{}_{}".format(name, idx),
            srcs = [
                ":{}_{}_attest".format(name, idx),
                ":{}_{}_sign".format(name, idx),
                ":{}_{}_push".format(name, idx),
            ],
        )

        image_dict[":{}_{}".format(name, idx)] = url
        query_dict[image] = url.split(":") + [":{}_{}_push".format(name, idx)]

    write_file(
        name = name + ".query",
        content = [
            "{repo} {tag} {push_label} {image_label}".format(
                repo = ref[0],
                tag = ref[1],
                push_label = ref[2],
                image_label = image,
            )
            for (image, ref) in query_dict.items()
        ],
        out = name + "_query",
    )

    sign_and_push(
        name = name,
        targets = image_dict,
    )
