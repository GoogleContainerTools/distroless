load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

def _impl(ctx):
  """Core implementation of docker_push."""

  f = "%s:x:%s:%s:%s:%s:%s\n" % (
      ctx.attr.username,
      ctx.attr.uid,
      ctx.attr.gid,
      ctx.attr.info,
      ctx.attr.home,
      ctx.attr.shell
  )
  ctx.file_action(
      output = ctx.outputs.out,
      content = f,
      executable=False
  )
  build_tar = ctx.executable.build_tar
  args = [
      "--output=" + ctx.outputs.tar.path,
      "--file=%s=/etc/passwd" % ctx.outputs.out.path
  ]
  arg_file = ctx.new_file(ctx.attr.name + ".args")
  ctx.file_action(arg_file, "\n".join(args))

  ctx.action(
      executable = build_tar,
      arguments = ["--flagfile=" + arg_file.path],
      inputs = [ctx.outputs.out, arg_file],
      outputs = [ctx.outputs.tar],
      use_default_shell_env = True
  )

passwd_file = rule(
    attrs = {
        "username": attr.string(mandatory = True),
        "uid": attr.int(default = 1000),
        "gid": attr.int(default = 1000),
        "info": attr.string(default = "user"),
        "home": attr.string(default = "/home"),
        "shell": attr.string(default = "/bin/bash"),
        "build_tar": attr.label(
            default = Label("@bazel_tools//tools/build_defs/pkg:build_tar"),
            cfg = "host",
            executable = True,
            allow_files = True,
        ),
    },
    executable = False,
    outputs = {
        "out": "%{name}.passwd",
        "tar": "%{name}.passwd.tar",
    },
    implementation = _impl,
)
