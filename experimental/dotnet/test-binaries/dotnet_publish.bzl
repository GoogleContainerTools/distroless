dotnet_filetype = [".cs", ".csproj", ".json"]

def dotnet_binary_impl(ctx):
  ctx.actions.run_shell(
      outputs = [ctx.outputs.tar],
      inputs = ctx.files.srcs,
      tools = [] + ctx.files._build_tar,
      env = {
          "BUILD_TAR": ctx.executable._build_tar.path,
          "PATH": "/usr/share/dotnet:/bin",
          "DOTNET_NOLOGO": "1",
          "DOTNET_EnableDiagnostics": "0",
      },
      arguments = [
          ' '.join(ctx.attr.flags),
          ctx.outputs.tar.path,
      ],
      command = """
          set -o errexit
          export DOTNET_CLI_HOME="$2.tmp/"
          outdir="$2.stage/"

          mkdir -p $outdir
          mkdir -p $DOTNET_CLI_HOME
          csproj=$(find . -name "*.csproj")

          dotnet publish $csproj $1 -o $outdir

          files=""
          for f in $(find $outdir -type f)
          do
            files="$files --file $f=${f#$outdir}"
          done
          $BUILD_TAR --output $2 $files
      """,
  )

dotnet_binary = rule(
  implementation = dotnet_binary_impl,
  attrs = {
      "srcs": attr.label_list(allow_files=dotnet_filetype),
      "deps": attr.label_list(allow_files=False),
      "flags": attr.string_list(),
      "outs": attr.label_list(allow_files=True),
      # Implicit dependencies.
      "_build_tar": attr.label(
          default = Label("//build_tar"),
          cfg = "host",
          executable = True,
      ),
  },
  outputs = {
      "tar": "%{name}.tar",
  },
)