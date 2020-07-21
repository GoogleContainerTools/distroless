"""A rule to unpack minimal locales from the debian package."""

def _impl(ctx):
    ctx.actions.run_shell(
        inputs = [ctx.file.deb],
        outputs = [ctx.outputs.tar],
        tools = [] + ctx.files._tar + ctx.files._dpkg_extract,
        arguments = [
            ctx.file.deb.path,
            ctx.outputs.tar.path,
        ],
        env = {
            "EXTRACT_DEB": ctx.executable._dpkg_extract.path,
            "CREATE_TAR": ctx.executable._tar.path,
        },
        command = """
            $EXTRACT_DEB "$1" ./usr/lib/locale/C.UTF-8
            $CREATE_TAR --output "$2" ./usr/lib/locale
        """,
    )

locale = rule(
    attrs = {
        "deb": attr.label(
            allow_single_file = [".deb"],
            mandatory = True,
        ),
        # Implicit dependencies.
        "_tar": attr.label(
            default = Label("//package_manager:tar"),
            cfg = "host",
            executable = True,
        ),
        "_dpkg_extract": attr.label(
            default = Label("//package_manager:dpkg_extract"),
            cfg = "host",
            executable = True,
        ),
    },
    executable = False,
    outputs = {
        "tar": "%{name}.tar",
    },
    implementation = _impl,
)
