"rules for attaching lifecycle tags to older published images"

load("@bazel_skylib//rules:write_file.bzl", "write_file")

def _tag(ctx):
    script_file = ctx.executable.script

    runner_script = ctx.actions.declare_file(ctx.label.name + "_runner.sh")

    commands = ["#!/usr/bin/env bash", "set -euo pipefail"]
    for ref in ctx.attr.targets:
        commands.append("{script} update {ref}".format(
            script = script_file.short_path,
            ref = ref,
        ))

    ctx.actions.write(
        output = runner_script,
        content = "\n".join(commands),
        is_executable = True,
    )

    return [
        DefaultInfo(
            executable = runner_script,
            runfiles = ctx.runfiles(files = [script_file]),
        ),
        RunEnvironmentInfo(
            environment = {"DRY_RUN": "false"},
            # maybe inherit this, need cloud build testing
            # inherited_environment = ["GOOGLE_APPLICATION_CREDENTIALS"],
        ),
    ]

tag = rule(
    implementation = _tag,
    attrs = {
        "targets": attr.string_list(),
        "script": attr.label(
            mandatory = True,
            allow_single_file = True,
            executable = True,
            cfg = "exec",
        ),
    },
    executable = True,
)

def attach_lifecycle_tags(name, images):
    """simple macro to assign lifecycle tags to older images

    Args:
        name: name of the target
        images: a dict where keys are fully qualified image references and values are image label
    """

    all_images = dict()

    for (ref, _) in images.items():
        repository_and_tag = ref.split(":")

        # TODO: have these leverage ../stamp.bash
        repository = repository_and_tag[0].format(REGISTRY = "gcr.io", PROJECT_ID = "distroless")
        all_images[repository] = "ignored"

    write_file(
        name = name + ".query",
        content = sorted(all_images.keys()),
        out = name + "_query",
    )

    tag(
        name = name,
        targets = sorted(all_images.keys()),
        script = Label("//private/tools/lifecycle:tag.sh"),
    )
