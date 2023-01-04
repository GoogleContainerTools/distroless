load("@contrib_rules_oci//oci:defs.bzl", "oci_push")
load("@contrib_rules_oci//cosign:defs.bzl", "cosign_sign")

PUSH_AND_SIGN_CMD="""\
repository="$(stamp "{REPOSITORY}")"
tag="$(stamp "{TAG}")"
[[ -n $EXPORT ]] && echo "$repository:$tag" >> $EXPORT
"$(realpath {SIGN_CMD})" --repository "$repository" --key "$KEY"
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
                SIGN_CMD = files[0].short_path,
                PUSH_CMD = files[1].short_path,
                REPOSITORY = repository_and_tag[0],
                TAG = repository_and_tag[1]
            )
        )


    executable = ctx.actions.declare_file("{}_sign_and_push.sh".format(ctx.label.name))
    ctx.actions.expand_template(
        template = ctx.file._push_tpl,
        output = executable,
        substitutions = {
            "{{VERSION_FILE}}": ctx.version_file.short_path,
            "{{CMDS}}": "\n".join(cmds)
        },
        is_executable = True
    )

    return DefaultInfo(executable = executable, runfiles = runfiles)


sign_and_push = rule(
    implementation = _sign_and_push_impl,
    attrs = {
        "targets": attr.label_keyed_string_dict(mandatory = True, cfg = "exec"),
        "_push_tpl": attr.label(default = "sign_and_push.sh.tpl", allow_single_file = True)
    },
    executable = True
)


def sign_and_push_all(name, images):
    """simple macro singing and pushing images
    
    Args:
        name: name of the target
        images: a dict where keys are fully qualified image url and values are image labels
    """
    image_dict = dict()
    for (idx, (url, image)) in enumerate(images.items()):
        oci_push(
            name = "{}_{}_push".format(name, idx),
            image = image, 
            repository = "repository.default.local"
        )
        cosign_sign(
            name = "{}_{}_sign".format(name, idx),
            image = image, 
            repository = "repository.default.local"
        )
        native.filegroup(
            name = "{}_{}".format(name, idx),
            srcs = [
                ":{}_{}_sign".format(name, idx), 
                ":{}_{}_push".format(name, idx)
            ]
        )
        image_dict[":{}_{}".format(name, idx)] = url

    sign_and_push(
        name = name,
        targets = image_dict
    )